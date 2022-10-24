package kr.ac.kopo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.FundVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class FundDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public FundVO selectByFundSeq(String fundSeq) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectByFundSeq", fundSeq);
	}

	public List<FundVO> selectByProjectSeq(String projectSeq) {
		List<FundVO> list = sqlSessionTemplate.selectList("dao.FundDAO.selectByProjectSeq", projectSeq);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<FundVO> procedureCalProjectPayoff(String projectSeq) {
		List<FundVO> calFundList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("projectSeq", projectSeq);
		map.put("calFundList", calFundList);
		
		System.out.println(projectSeq);
		
		sqlSessionTemplate.selectList("dao.FundDAO.procedureCalProjectPayoff", map);
		return (List<FundVO>) map.get("calFundList");
	}

	public void blockUpdatePayoffStatus(Map<String, Object> map) {
		sqlSessionTemplate.selectOne("dao.FundDAO.blockUpdatePayoffStatus", map);
	}

	public List<HashMap<String, Object>> blockGetTrendsInFund(String projectSeq) {
		List<HashMap<String, Object>> monthFundAmt = sqlSessionTemplate.selectList("dao.FundDAO.blockGetTrendsInFund", projectSeq);
		return monthFundAmt;
	}

	public String selectCountByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectCountByProjectSeq", projectSeq);
	}

	public List<String> selectPhoneListByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectList("dao.FundDAO.selectPhoneListByProjectSeq", projectSeq);
	}

}
