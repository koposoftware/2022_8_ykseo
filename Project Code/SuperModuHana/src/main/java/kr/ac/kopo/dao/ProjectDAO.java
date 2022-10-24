package kr.ac.kopo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProjectDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public Map<String, Object> blockSelectProjectClassifiedByProgressCode() {
		Map<String, Object> map = new HashMap<>();
		map.put("awaitingProjectList", new ArrayList<ProjectVO>());
		map.put("inProgressProjectList", new ArrayList<ProjectVO>());
		map.put("successProjectList", new ArrayList<ProjectVO>());
		map.put("finishedProjectList", new ArrayList<ProjectVO>());
		map.put("cancelledProjectList", new ArrayList<ProjectVO>());
		map.put("countAwaitingProjects", new Integer(0));
		sqlSessionTemplate.selectOne("dao.ProjectDAO.blockSelectProjectClassifiedByProgressCode", map);
		return map;
	}

	public int updateProgressCodeByProjectSeq(ProjectVO projectVO) {
		return sqlSessionTemplate.update("dao.ProjectDAO.updateProgressCodeByProjectSeq", projectVO);
	}

	public ProjectVO selectByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectByProjectSeq", projectSeq);
	}

	public ProjectVO updateAccountNoByProjectSeq(ProjectVO projectVO) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.updateAccountNoByProjectSeq", projectVO);
	}

	public Map<String, String> blockGetHeadValues() {
		Map<String, String> map = new HashMap<>();
		map.put("totalFundAmt", new String());
		map.put("totalMember", new String());
		map.put("avgPayoff", new String());

		sqlSessionTemplate.selectOne("dao.ProjectDAO.blockGetHeadValues", map);
		return map;
	}

	public Map<String, Double> blockGetSexRatio(String projectSeq) {
		System.out.println(projectSeq);
		Map<String, Object> map = new HashMap<>();
		map.put("projectSeq", projectSeq);
		map.put("man", new Double(0));
		map.put("woman", new Double(0));

		sqlSessionTemplate.selectOne("dao.ProjectDAO.blockGetSexRatio", map);
		Map<String, Double> sexRatioMap = new HashMap<>();
		sexRatioMap.put("man", (Double) map.get("man"));
		sexRatioMap.put("woman", (Double) map.get("woman"));
		
		return sexRatioMap;
	}

	@SuppressWarnings("unchecked")
	public List<ProjectVO> blockGetSubjectRatio() {
		Map<String, Object> map = new HashMap<>();
		List<ProjectVO> subjectRatioList = new ArrayList<ProjectVO>();
		map.put("subjectRatioList", subjectRatioList);

		sqlSessionTemplate.selectOne("dao.ProjectDAO.blockGetSubjectRatio", map);
		return (List<ProjectVO>) map.get("subjectRatioList");
	}

	public List<Double> blockGetMonthFundAmt() {
		List<Double> monthFundAmt = sqlSessionTemplate.selectList("dao.ProjectDAO.blockGetMonthFundAmt");
		return monthFundAmt;
	}

	public List<ProjectVO> selectProjectListNeedRepayment() {
		return sqlSessionTemplate.selectList("dao.ProjectDAO.selectProjectListNeedRepayment");
	}

	public void updateRepaymentByProjectSeq(ProjectVO projectVO) {
		sqlSessionTemplate.selectList("dao.ProjectDAO.updateRepaymentByProjectSeq", projectVO);
	}

	public void updateProjectToScheduled() {
		sqlSessionTemplate.update("dao.ProjectDAO.updateProjectToScheduled");
	}

	public String selectCropEmailByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectCropEmailByProjectSeq", projectSeq);
	}
}
