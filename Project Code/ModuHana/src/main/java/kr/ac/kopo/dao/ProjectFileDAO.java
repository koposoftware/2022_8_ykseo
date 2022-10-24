package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ProjectFileVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProjectFileDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProjectFileVO> selectByProjectSeqAndTypeCode(String projectSeq, List<String> typeCodeList) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectSeq", projectSeq);
		map.put("typeCodeList", typeCodeList);
		
		return sqlSessionTemplate.selectList("dao.ProjectFileDAO.selectByProjectSeqAndTypeCode", map);
	}

}
