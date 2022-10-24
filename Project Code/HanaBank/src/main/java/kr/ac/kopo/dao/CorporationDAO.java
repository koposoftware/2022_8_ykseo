package kr.ac.kopo.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.CorporationVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CorporationDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public CorporationVO selectByRegNo(Map<String, Object> corporationVO) {
		return sqlSessionTemplate.selectOne("dao.CorporationDAO.selectByRegNo", corporationVO);
	}

	public void processCreateCorporation(CorporationVO corporationVO) {
		sqlSessionTemplate.selectOne("dao.CorporationDAO.processCreateCorporation", corporationVO);
	}
}
