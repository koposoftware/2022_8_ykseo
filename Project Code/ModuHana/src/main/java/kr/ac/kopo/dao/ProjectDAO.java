package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProjectDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProjectVO> selectBySubjectNo(String subjectNo) {
		return sqlSessionTemplate.selectList("dao.ProjectDAO.selectBySubjectNo", subjectNo);
	}

	public List<ProjectVO> selectAll() {
		return sqlSessionTemplate.selectList("dao.ProjectDAO.selectAll");
	}

	public ProjectVO selectByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.ProjectDAO.selectByProjectSeq", projectSeq);
	}

}
