package kr.ac.kopo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProjectDAO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectService {

	private final ProjectDAO projectDAO;

	public String createProject(String CorpRegNo) {
		ProjectVO projectVO = new ProjectVO();
		projectVO.setCorpRegNo(CorpRegNo);
		return projectDAO.blockInsertReturnProjectSeq(projectVO);
	}

	public ProjectVO getProjectByProjectSeq(String projectSeq) {
		return projectDAO.selectByProjectSeq(projectSeq);
	}

	public void updateStep2Part(String projectSeq, ProjectVO projectVO) {
		projectVO.setProjectSeq(projectSeq);
		projectDAO.updateStep2PartByProjectSeq(projectVO);
	}

	public void updateStep3Part(String projectSeq, ProjectVO projectVO) {
		projectVO.setProjectSeq(projectSeq);
		projectDAO.updateStep3PartByProjectSeq(projectVO);
	}

	public List<ProjectVO> getProjectList(String corpRegNo, String progressCode) {
		ProjectVO projectVO = new ProjectVO();
		projectVO.setCorpRegNo(corpRegNo);
		projectVO.setProgressCode(progressCode);

		if (progressCode.equals("all")) {
			return projectDAO.selectByCorpRegNo(corpRegNo);
		} else {
			return projectDAO.selectByCorpRegNoAndProgressCode(projectVO);
		}
	}

	public void apply(String projectSeq) {
		projectDAO.updateProgressCodeByProjectSeq(projectSeq);
	}

	public Map<String, Object> getMypageMap(String corpRegNo) {
		Map<String, Object> map = new HashMap<>();

		Map<String, Object> tmpmap = projectDAO.selectTotalFundAmt(corpRegNo);
		if (tmpmap != null) {
			map.put("totalFundAmt", tmpmap.get("TOTAL_FUND_AMT"));
		} else {
			map.put("totalFundAmt", 0);
		}
		
		map.put("inProgressProjectSize",
				projectDAO.selectInProgressProjectSize(corpRegNo).get("INPROGRESS_PROJECT_SIZE"));
		map.put("writingProjectSize", projectDAO.selectWritingProjectSize(corpRegNo).get("WRITING_PROJECT_SIZE"));

		System.out.println(map);

		return map;
	}

	public List<Map<String, Object>> getAccumulatedFundAmtOfInprogressProjects(String corpRegNo) {

		ProjectVO projectVO = new ProjectVO();
		projectVO.setCorpRegNo(corpRegNo);
		projectVO.setProgressCode("3");
		List<ProjectVO> projectList = projectDAO.selectByCorpRegNoAndProgressCode(projectVO);

		List<Map<String, Object>> mapList = new ArrayList<>();
		for (ProjectVO project : projectList) {
			Map<String, Object> map = new HashMap<>();
			List<Map<String, Object>> AccomulateFundAmt = projectDAO
					.selectAccumulatedFundAmtByProjectSeq(project.getProjectSeq());
			map.put("projectSeq", project.getProjectSeq());
			map.put("title", project.getTitle());
			map.put("accomulateFundAmt", AccomulateFundAmt);

			System.out.println(AccomulateFundAmt);

			mapList.add(map);
		}

		return mapList;

	}

}
