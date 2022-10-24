package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.CommCodeVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CommCodeDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommCodeVO> selectByCodeId(String codeId){
		List<CommCodeVO> commCodeList = sqlSessionTemplate.selectList("dao.CommCodeDAO.selectByCodeId", codeId);
		return commCodeList;
	}
}
