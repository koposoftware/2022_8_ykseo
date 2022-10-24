package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.CorporationDAO;
import kr.ac.kopo.dao.ProjectDAO;
import kr.ac.kopo.util.HttpUtil;
import kr.ac.kopo.vo.CorporationVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:moduhana.properties")
@PropertySource("classpath:hanabank.properties")
public class ProjectService {

	@Value("${key}")
	private String apiKey;

	@Value("${accountpassword}")
	private String moduHanaAccountPassword;

	private final ProjectDAO projectDAO;
	private final CorporationDAO corporationDAO;
	private final AccountService accountService;

	public Map<String, Object> getClassifiedProjects() {
		return projectDAO.blockSelectProjectClassifiedByProgressCode();
	}

	private int updateProgressCode(String projectSeq, String progressCode) {
		ProjectVO projectVO = new ProjectVO();
		projectVO.setProjectSeq(projectSeq);
		projectVO.setProgressCode(progressCode);

		return projectDAO.updateProgressCodeByProjectSeq(projectVO);
	}

	public void approveProject(String jsonData) {
		JSONObject jObject = new JSONObject(jsonData);
		String projectSeq = String.valueOf(jObject.getInt("projectSeq"));

		// 별단계좌 개설
		ProjectVO project = projectDAO.selectByProjectSeq(projectSeq); // Project 정보 가져오기
		accountService.createProjectAccount(project);
		updateProgressCode(projectSeq, "1");
	}

	public void cancelApprovedProject(String jsonData) {
		JSONObject jObject = new JSONObject(jsonData);
		String projectSeq = String.valueOf(jObject.getInt("projectSeq"));

		updateProgressCode(projectSeq, "0");
	}

	public void uploadProject(String jsonData) {
		JSONObject jObject = new JSONObject(jsonData);
		String projectSeq = String.valueOf(jObject.getInt("projectSeq"));

		updateProgressCode(projectSeq, "2");
	}

	public void refuseProject(String jsonData) {
		JSONObject jObject = new JSONObject(jsonData);
		String projectSeq = String.valueOf(jObject.getInt("projectSeq"));

		updateProgressCode(projectSeq, "6");
	}

	public ProjectVO getProjectByProjectSeq(String projectSeq) {
		return projectDAO.selectByProjectSeq(projectSeq);
	}

	@Transactional
	public void pay(String jsonData) {
		JSONObject jObject = new JSONObject(jsonData);
		String projectSeq = String.valueOf(jObject.getInt("projectSeq"));

		// 투자금 전달
		ProjectVO project = projectDAO.selectByProjectSeq(projectSeq);
		CorporationVO corporationVO = corporationDAO.selectByRegNo(project.getCorpRegNo());
		System.out.println("pay : " + corporationVO);

		// api request 보내기
		String url = "http://localhost:9990/HanaBank/transfer";

		JSONObject param = new JSONObject();
		param.put("apiKey", apiKey);
		param.put("activeAcctNo", project.getAccountNo());
		param.put("typeCode", "08"); // 08: 투자금지급
		param.put("name", project.getProjectSeq() + "." + project.getTitle() + "투자금 지급");
		param.put("amount", project.getFundAmt());
		param.put("dealBankCode", corporationVO.getBankCode());
		param.put("dealAcctNo", corporationVO.getAccountNo());
		param.put("dealName", project.getTitle() + "투자금");
		param.put("password", moduHanaAccountPassword);

		System.out.println(param);

		HttpUtil.callApi(url, param, "PUT");

		updateProgressCode(projectSeq, "10");
	}

	public Map<String, String> getHeadValues() {
		return projectDAO.blockGetHeadValues();
	}

	public Map<String, Double> getSexRatio() {
		return this.getSexRatio(null);
	}

	public Map<String, Double> getSexRatio(String projectSeq) {
		return projectDAO.blockGetSexRatio(projectSeq);
	}

	public List<ProjectVO> getSubjectRatio() {
		return projectDAO.blockGetSubjectRatio();
	}

	public List<Double> getMonthFundAmt() {
		return projectDAO.blockGetMonthFundAmt();
	}

	public List<ProjectVO> getProjectListNeedRepayment() {
		return projectDAO.selectProjectListNeedRepayment();
	}

	public void updateRepaymentAndProgressCode(String projectSeq, String repayment) {
		// 해당 프로젝트의 회사에서 수익금을 보냈는지 repayment값 확인 및 업데이트
		// (progressCode도 바꿔야함!)
		ProjectVO projectVO = new ProjectVO();
		projectVO.setProjectSeq(projectSeq);
		projectVO.setRepayment(repayment);

		projectDAO.updateProgressCodeByProjectSeq(projectVO); // proejectSeq와 progressCode 필요
		projectDAO.updateRepaymentByProjectSeq(projectVO);
	}

	public void updateProjectToScheduled() {
		projectDAO.updateProjectToScheduled();
	}

	public String getCorpEmail(String projectSeq) {
		return projectDAO.selectCropEmailByProjectSeq(projectSeq);
	}

}
