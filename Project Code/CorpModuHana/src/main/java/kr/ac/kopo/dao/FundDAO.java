package kr.ac.kopo.dao;

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
	
	public Map<String, Double> blockGetSexRatio(String projectSeq) {
		System.out.println(projectSeq);
		Map<String, Object> map = new HashMap<>();
		map.put("projectSeq", projectSeq);
		map.put("man", new Double(0));
		map.put("woman", new Double(0));

		sqlSessionTemplate.selectOne("dao.FundDAO.blockGetSexRatio", map);
		Map<String, Double> sexRatioMap = new HashMap<>();
		sexRatioMap.put("man", (Double) map.get("man"));
		sexRatioMap.put("woman", (Double) map.get("woman"));
		
		return sexRatioMap;
	}
	
	public List<FundVO> selectByProjectSeq(String projectSeq) {
		List<FundVO> list = sqlSessionTemplate.selectList("dao.FundDAO.selectByProjectSeq", projectSeq);
		return list;
	}

	public List<HashMap<String, Object>> blockGetTrendsInFund(String projectSeq) {
		List<HashMap<String, Object>> monthFundAmt = sqlSessionTemplate.selectList("dao.FundDAO.blockGetTrendsInFund", projectSeq);
		return monthFundAmt;
	}

	public String selectCountByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectCountByProjectSeq", projectSeq);
	}
}
