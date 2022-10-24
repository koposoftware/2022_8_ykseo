package kr.ac.kopo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.CorporationVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CorporationDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public CorporationVO selectByRegNo(String corpRegNo) {
		return sqlSessionTemplate.selectOne("dao.CorporationDAO.selectByRegNo", corpRegNo);
	}
}
