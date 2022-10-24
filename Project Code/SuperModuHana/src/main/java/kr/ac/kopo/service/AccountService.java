package kr.ac.kopo.service;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kr.ac.kopo.dao.ProjectDAO;
import kr.ac.kopo.util.HttpUtil;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:moduhana.properties")
@PropertySource("classpath:hanabank.properties")
public class AccountService {

	@Value("${key}")
	private String apiKey;
	
	@Value("${name}")
	private String moduHanaName;
	@Value("${regno}")
	private String moduHanaRegNo;
	@Value("${accountpassword}")
	private String moduHanaAccountPassword;

	private final ProjectDAO projectDAO;

	public void createProjectAccount(ProjectVO project) {

		// user 정보 채우기
		JSONObject userParam = new JSONObject();
		userParam.put("name", moduHanaName);
		userParam.put("regNo", moduHanaRegNo);
		
		// account 정보 채우기
		AccountVO accountVO = new AccountVO();
		accountVO.setPassword(moduHanaAccountPassword);
		accountVO.setName(project.getProjectSeq() + "." + project.getTitle() + " 별단 계좌");
		accountVO.setTypeCode("1"); // 1는 별단 계좌

		// api request 보내기
		String url = "http://13.209.81.235/HanaBank/account/creation";

		JSONObject param = new JSONObject();
		param.put("apiKey", apiKey);
		param.put("user", userParam);
		param.put("account", new JSONObject(accountVO));

		JSONObject jsonObject = HttpUtil.callApi(url, param, "POST");

		// JSONOject 파싱
		Gson gson = new Gson();
		JSONObject data = jsonObject.getJSONObject("data");
		AccountVO newAccount = gson.fromJson(data.toString(), AccountVO.class);
		System.out.println("newAccount : " + newAccount);

		// project accountNo update
//		projectDAO.updateAccountNoByProjectSeq(newAccount.getAccountNo());
		project.setAccountNo(newAccount.getAccountNo());
		projectDAO.updateAccountNoByProjectSeq(project);

	}
	
	public AccountVO getAccountByAccountNoFromBankAPI(String accountNo) {

		// api request 보내기
		String url = "http://13.209.81.235/HanaBank/account";

		JSONObject param = new JSONObject();
		param.put("apiKey", apiKey);
		param.put("accountNo", accountNo);

		JSONObject jsonObject = HttpUtil.callApi(url, param, "POST");

		// JSONOject 파싱
		Gson gson = new Gson();
		JSONObject data = jsonObject.getJSONObject("data");
		AccountVO accountVO = gson.fromJson(data.toString(), AccountVO.class);

		return accountVO;
	}

}
