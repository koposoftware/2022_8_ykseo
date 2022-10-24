package kr.ac.kopo.service;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.ApiKeyDAO;
import kr.ac.kopo.dao.TransactionDAO;
import kr.ac.kopo.tag.StatusEnum;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MessageVO;
import kr.ac.kopo.vo.TransactionVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TransactionService {

	private final TransactionDAO transactionDAO;
	private final AccountDAO accountDAO;
	private final ApiKeyDAO apiKeyDAO;

	public ResponseEntity<MessageVO> getTransactionList(Map<String, Object> reqParam) {

		try {

			String apiKey = (String) reqParam.get("apiKey");

			if (apiKeyDAO.selectByApikey(apiKey) != null) {
				String accountNo = (String) reqParam.get("accountNo");

				AccountVO accountVO = accountDAO.selectByAccountNo(accountNo);

				if (accountVO != null) {

					List<TransactionVO> transactionList = transactionDAO.selectAllByAccountNo(accountNo);
					Map<String, Object> data = new HashMap<>();
					data.put("transactionList", transactionList);

					System.out.println("data : " + data);

					return makeResponseEntity(StatusEnum.OK, "성공", data, HttpStatus.OK);

				} else {
					return makeResponseEntity(StatusEnum.NOT_FOUND, "계좌번호를 잘못입력하셨습니다.", null, HttpStatus.NOT_FOUND);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
		}

		return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
	}

	public ResponseEntity<MessageVO> transfer(Map<String, Object> reqParam) {

		try {

			System.out.println(reqParam);
			String apiKey = (String) reqParam.get("apiKey");

			if (apiKeyDAO.selectByApikey(apiKey) != null) {

				transactionDAO.procedureTransfer(reqParam);

				return makeResponseEntity(StatusEnum.CREATED, "이체 성공", null, HttpStatus.CREATED);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
		}

		return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);

	}

	public ResponseEntity<MessageVO> multiTransfer(Map<String, Object> reqParam) {
		
		try {
			
			JSONObject jObject = new JSONObject(reqParam);
			System.out.println("multiTransfer : " + reqParam);
			
			String apiKey = jObject.getString("apiKey");
			
			if (apiKeyDAO.selectByApikey(apiKey) != null) {
				String password = (String) jObject.get("password");
				String activeAcctNo = (String) jObject.get("activeAcctNo");
				
				JSONArray jsonArray = jObject.getJSONArray("transferList");
				
				Map<String, TransactionVO> transferMap = new HashMap<>();
				
				for (Object object : jsonArray) {
					
					TransactionVO transactionVO = new TransactionVO();
					transactionVO.setActiveAcctNo(activeAcctNo);
					
					JSONObject transferData = (JSONObject) object;
					transactionVO.setDealBankCode((String) transferData.get("dealBankCode"));
					transactionVO.setDealName((String) transferData.get("dealName"));
					transactionVO.setTypeCode((String) transferData.get("typeCode"));
					transactionVO.setAmount((String) transferData.get("amount"));
					transactionVO.setDealAcctNo((String) transferData.get("dealAcctNo"));
					transactionVO.setName((String) transferData.get("name"));
					
					transferMap.put((String) transferData.get("key"), transactionVO);
				}
				
				transactionDAO.blockMultiTransfer(transferMap, password);
				
				Map<String, Integer> resultMap = new HashMap<>();
				for (Map.Entry<String, TransactionVO> entry : transferMap.entrySet()) {
					String key = entry.getKey();
					TransactionVO val = entry.getValue();
					resultMap.put(key, val.getStatus());
				}
				
				System.out.println("resultMap : " + resultMap);
				
				return makeResponseEntity(StatusEnum.CREATED, "다중 이체 성공", resultMap, HttpStatus.CREATED);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
		}
		
		return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
		
	}

	public ResponseEntity<MessageVO> makeResponseEntity(StatusEnum statusEnum, String message, Object data,
			HttpStatus httpStatus) {

		MessageVO messageVO = new MessageVO();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		messageVO.setStatus(statusEnum);
		messageVO.setMessage(message);
		messageVO.setData(data);

		return new ResponseEntity<>(messageVO, headers, httpStatus);

	}
}
