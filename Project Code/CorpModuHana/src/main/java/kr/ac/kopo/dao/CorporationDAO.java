package kr.ac.kopo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.CorporationVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CorporationDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public CorporationVO selectByRegNoAndPwd(CorporationVO corporationVO) {
		return sqlSessionTemplate.selectOne("dao.CorporationDAO.selectByRegNoAndPwd", corporationVO);
	}
	
	public CorporationVO selectByRegNo(String regNo) {
		return sqlSessionTemplate.selectOne("dao.CorporationDAO.selectByRegNo", regNo);
	}

	public void updateEmailTelAndAddressByRegNo(CorporationVO corporationVO) {
		sqlSessionTemplate.update("dao.CorporationDAO.updateEmailTelAndAddressByRegNo", corporationVO);
	}

	public String getCropEmailByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.CorporationDAO.getCropEmailByProjectSeq", projectSeq);
	}
}
