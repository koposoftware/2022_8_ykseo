package kr.ac.kopo.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.ac.kopo.dao.FundDAO;
import kr.ac.kopo.dao.ProjectDAO;
import kr.ac.kopo.util.HttpUtil;
import kr.ac.kopo.vo.FundVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:moduhana.properties")
@PropertySource("classpath:hanabank.properties")
public class FundService {

	@Value("${key}")
	private String apiKey;

	@Value("${accountpassword}")
	private String moduHanaAccountPassword;
	@Value("${bankCode}")
	private String moduHanaBankCode;

	private final FundDAO fundDAO;
	private final ProjectDAO projectDAO;
	private final MessageService messageService;

	public FundVO getFundByFundSeq(String fundSeq) {
		return fundDAO.selectByFundSeq(fundSeq);
	}

	public List<FundVO> getFundListByProjectSeq(String projectSeq) {
		return fundDAO.selectByProjectSeq(projectSeq);
	}

	public List<FundVO> payoff(String projectSeq) {
		// 투자자들의 수익금 계산
		List<FundVO> calFundList = fundDAO.procedureCalProjectPayoff(projectSeq);

		System.out.println("투자자들의 수익금 계산");
		
		// 은행 이체
		ProjectVO project = projectDAO.selectByProjectSeq(projectSeq);

		System.out.println("은행 이체");
		
		
		// api request 보내기
//		String url = "http://13.209.81.235/HanaBank/multitransfer";
//
//		JSONObject param = new JSONObject();
//		param.put("apiKey", apiKey);
//		param.put("password", moduHanaAccountPassword);
//		param.put("activeAcctNo", project.getAccountNo());
//
//		List<Object> transferList = new ArrayList<>();
//		for (FundVO fundVO : calFundList) {
//			System.out.println(fundVO);
//			Map<String, Object> map = new HashMap<>();
//			
//			map.put("key", fundVO.getFundSeq());
//			map.put("typeCode", "7"); // 07: 정산출금
//			map.put("amount", fundVO.getPayoff());
//			map.put("dealBankCode", moduHanaBankCode);
//			map.put("dealAcctNo", fundVO.getMemberAccountNo());
//			map.put("dealName", project.getTitle() + " 수익 정산");
//			map.put("name", project.getProjectSeq() + "." + project.getTitle());
//			transferList.add(map);
//		}
//		
//		param.put("transferList", transferList);
//		
//		JSONObject jsonObject = HttpUtil.callApi(url, param, "PUT");
//		System.out.println("api request 보내기");
//		System.out.println("jsonObject : " + jsonObject);
//		
//		// 정산 완료 업데이트
//		JSONObject data = jsonObject.getJSONObject("data");
//		Type type = new TypeToken<Map<String, Integer>>(){}.getType();
//		Map<String, Integer> resultMapBank = new Gson().fromJson(data.toString(), type);
//		Map<String, String> resultMap = new HashMap<>();
//		for (Map.Entry<String, Integer> entry : resultMapBank.entrySet()) {
//			String key = entry.getKey();
//			Integer val = entry.getValue();
//			resultMap.put(key, val == 0 ? "S" : "F");
//		}
//		System.out.println("정산 완료 업데이트");
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("projectSeq", projectSeq);
//		map.put("resultMap", resultMap);
//		
//		fundDAO.blockUpdatePayoffStatus(map);
//		
//		System.out.println("정산 완료 업데이트 완료");
		
		// 투자자들에게 정산 완료 메세지 보내기
//		List<String> phoneList = fundDAO.selectPhoneListByProjectSeq(projectSeq);
		List<String> phoneList = new ArrayList<>();
		phoneList.add("01026093796");
		
		String message = "[ModuHana] " + (project.getTitle().length() > 10 ? project.getTitle().substring(0, 10) + "..." : project.getTitle()) + " 투자의 정산이 완료되었습니다. 예치금 계좌를 확인해주세요.";
		for (String phone : phoneList) {
			System.out.println(phone);
			messageService.sendMessage(phone, message);
		}

		return fundDAO.selectByProjectSeq(projectSeq);
	}

	public List<HashMap<String, Object>> getTrendsInFund(String projectSeq) {
		return fundDAO.blockGetTrendsInFund(projectSeq);
	}

	public String getFundListCountByProjectSeq(String projectSeq) {
		return fundDAO.selectCountByProjectSeq(projectSeq);
	}
	
}
