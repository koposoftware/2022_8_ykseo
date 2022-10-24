package kr.ac.kopo.service;

import java.nio.charset.Charset;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.ApiKeyDAO;
import kr.ac.kopo.dao.CorporationDAO;
import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.tag.StatusEnum;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.CorporationVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.MessageVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountService {

	private final AccountDAO accountDAO;
	private final MemberDAO memberDAO;
	private final CorporationDAO corporationDAO;
	private final ApiKeyDAO apiKeyDAO;

	public ResponseEntity<MessageVO> createAccount(Map<String, Object> reqParam) {

		try {

			// json 데이터 정리
			System.out.println("jsonData : " + reqParam);

			String apiKey = (String) reqParam.get("apiKey");

			// api key 확인
			if (apiKeyDAO.selectByApikey(apiKey) != null) {

				@SuppressWarnings("unchecked")
				String typeCode = (String) ((Map<String, Object>) reqParam.get("account")).get("typeCode");
				if (typeCode.equals("2")) {
					// 회원 유무 확인
					@SuppressWarnings("unchecked")
					Map<String, Object> memberVO = (Map<String, Object>) reqParam.get("user");
					MemberVO user = memberDAO.selectByRegNo(memberVO);

					if (user == null) {
						// 새로운 유저 생성
						memberDAO.processCreateMember(memberVO);
						user = memberDAO.selectByRegNo(memberVO);
					}

					// 이미 존재하는 유저에게 다른 예치금 계좌가 존재한다면?
					// 계좌를 모두하나를 위한 하나의 상품 계좌로 만들어서 관리한다고 생각하자
					// 회원은 동일하게 관리

					// 새로운 계좌의 계좌번호로
					@SuppressWarnings("unchecked")
					Map<String, Object> accountVO = (Map<String, Object>) reqParam.get("account");
					accountVO.put("customerId", user.getId());
					accountVO.put("accountNo", null);

					// 새로운 계좌 생성
					String newAccountNo = accountDAO.procedureCreateAccount(accountVO);
					System.out.println("newAccountNo : " + newAccountNo);
					AccountVO data = accountDAO.selectByAccountNo(newAccountNo);
					System.out.println("data : " + data);

					return makeResponseEntity(StatusEnum.CREATED, "계좌 생성 성공", data, HttpStatus.CREATED);

				} else if (typeCode.equals("1")) {

					@SuppressWarnings("unchecked")
					Map<String, Object> corporationVO = (Map<String, Object>) reqParam.get("user");

					// 회사 유무 확인
					CorporationVO user = corporationDAO.selectByRegNo(corporationVO);

					if (user == null) {
						// 없으면 실패
						return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
					}

					// 새로운 계좌의 계좌번호로
					@SuppressWarnings("unchecked")
					Map<String, Object> accountVO = (Map<String, Object>) reqParam.get("account");
					accountVO.put("customerId", user.getId());

					// 새로운 계좌 생성
					String newAccountNo = accountDAO.procedureCreateAccount(accountVO);

					AccountVO data = accountDAO.selectByAccountNo(newAccountNo);

					return makeResponseEntity(StatusEnum.CREATED, "성공", data, HttpStatus.CREATED);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);
		}

		return makeResponseEntity(StatusEnum.UNAUTHORIZED, "인증에 실패하셨습니다.", null, HttpStatus.UNAUTHORIZED);

	}

	public ResponseEntity<MessageVO> getAccountInfo(Map<String, Object> reqParam) {

		try {

			String apiKey = (String) reqParam.get("apiKey");

			// api key 확인
			if (apiKeyDAO.selectByApikey(apiKey) != null) {
				String accountNo = (String) reqParam.get("accountNo");

				AccountVO account = accountDAO.selectByAccountNo(accountNo);
				System.out.println("account: " + account);

				if (account != null) {
					return makeResponseEntity(StatusEnum.OK, "성공", account, HttpStatus.OK);
				} else {
					return makeResponseEntity(StatusEnum.NOT_FOUND, "계좌번호를 잘못입력하셨습니다.", account, HttpStatus.NOT_FOUND);
				}
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
