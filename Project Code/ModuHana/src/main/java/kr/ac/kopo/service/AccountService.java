package kr.ac.kopo.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.util.HttpUtil;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.FundVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ProjectVO;
import kr.ac.kopo.vo.TransactionVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:hanabank.properties")
public class AccountService {

	@Value("${key}")
	private String apiKey;
	
	private final AccountDAO accountDAO;
	private final ProjectService projectService;
	private final FundService fundService;

	public AccountVO getAccountByMemberId(String id) {
		return accountDAO.selectByMemberId(id);
	}

	public AccountVO getAccountByAccountNoFromBankAPI(String accountNo) {

		// api request 보내기
		String url = "http://localhost:9990/HanaBank/account?apiKey=" + apiKey + "&accountNo=" + accountNo;
		JSONObject jsonObject = HttpUtil.callApiGet(url, "GET");

		// JSONOject 파싱
		Gson gson = new Gson();
		JSONObject data = jsonObject.getJSONObject("data");
		AccountVO accountVO = gson.fromJson(data.toString(), AccountVO.class);

		return accountVO;
	}

	public List<TransactionVO> getTransactionListByAccountNoFromBankAPI(String accountNo) {

		// api request 보내기
		String url = "http://13.209.81.235/HanaBank/transaction?apiKey=" + apiKey + "&accountNo=" + accountNo;
		JSONObject jsonObject = HttpUtil.callApiGet(url, "GET");

		// JSONOject 파싱
		JSONObject data = jsonObject.getJSONObject("data");
		JSONArray jsonArray = data.getJSONArray("transactionList");
		ArrayList<TransactionVO> transactionList = new ArrayList<>();

		// Checking whether the JSON array has some value or not
		Gson gson = new Gson();
		if (jsonArray != null) {

			// Iterating JSON array
			for (int i = 0; i < jsonArray.length(); i++) {

				// Adding each element of JSON array into ArrayList
				transactionList.add(gson.fromJson(jsonArray.get(i).toString(), TransactionVO.class));
			}
		}

		return transactionList;
	}

	@Transactional
	public String fund(MemberVO attribute, FundVO fundVO, String password) {
		
		// 투자금 계좌 이체
		transfer(attribute, fundVO, password);
		
		// 투자 내역 로그 & 프로젝트 fundAmt update
		String fundSeq = fundService.fund(fundVO);
		
		return fundSeq;
		
	}
	
	private void transfer(MemberVO user, FundVO fundVO, String password) {

		// 프로젝트 정보 가져오기
		ProjectVO project = projectService.getProjectByProjectSeq(fundVO.getProjectSeq());

		// api request 보내기
		String url = "http://13.209.81.235/HanaBank/transfer";

		JSONObject param = new JSONObject();
		param.put("apiKey", apiKey);
		param.put("activeAcctNo", fundVO.getMemberAccountNo());
		param.put("typeCode", "03");
		param.put("name", project.getTitle() + " 투자");
		param.put("amount", fundVO.getAmount());
		param.put("dealBankCode", "81");
		param.put("dealAcctNo", project.getAccountNo());
		param.put("dealName", user.getName());
		param.put("password", password);
		System.out.println("param : " + param);

		JSONObject jsonObject = HttpUtil.callApiExceptGet(url, param, "PUT");

		System.out.println("jsonObject : " + jsonObject);
	}

}
