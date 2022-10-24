package kr.ac.kopo.dao;

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
	
	public String blockInsertReturnProjectSeq(ProjectVO projectVO) {
		sqlSessionTemplate.selectOne("dao.ProjectDAO.blockInsertReturnProjectSeq", projectVO);
		return projectVO.getProjectSeq();
	}

	public ProjectVO selectByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectByProjectSeq", projectSeq);
	}

	public void updateStep2PartByProjectSeq(ProjectVO projectVO) {
		sqlSessionTemplate.update("dao.ProjectDAO.updateStep2PartByProjectSeq", projectVO);
	}

	public void updateStep3PartByProjectSeq(ProjectVO projectVO) {
		sqlSessionTemplate.update("dao.ProjectDAO.updateStep3PartByProjectSeq", projectVO);
	}
	
	public List<ProjectVO> selectByCorpRegNoAndProgressCode(ProjectVO projectVO) {
		return sqlSessionTemplate.selectList("dao.ProjectDAO.selectByCorpRegNoAndProgressCode", projectVO);
	}

	public List<ProjectVO> selectByCorpRegNo(String corpRegNo) {
		return sqlSessionTemplate.selectList("dao.ProjectDAO.selectByCorpRegNo", corpRegNo);
	}

	public int updateProgressCodeByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.update("dao.ProjectDAO.updateProgressCodeByProjectSeq", projectSeq);
	}

	public Map<String, Object> selectTotalFundAmt(String corpRegNo) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectTotalFundAmt", corpRegNo);
	}
	
	public Map<String, Object> selectInProgressProjectSize(String corpRegNo) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectInProgressProjectSize", corpRegNo);
	}
	
	public Map<String, Object> selectWritingProjectSize(String corpRegNo) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectWritingProjectSize", corpRegNo);
	}
	
	public List<Map<String, Object>> selectAccumulatedFundAmtByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectList("dao.ProjectDAO.selectAccumulatedFundAmtByProjectSeq", projectSeq);
	}
}
