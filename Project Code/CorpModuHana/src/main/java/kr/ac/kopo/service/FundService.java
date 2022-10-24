package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.FundDAO;
import kr.ac.kopo.vo.FundVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FundService {

	private final FundDAO fundDAO;

	public Map<String, Double> getSexRatio(String projectSeq) {
		return fundDAO.blockGetSexRatio(projectSeq);
	}

	public List<HashMap<String, Object>> getTrendsInFund(String projectSeq) {
		return fundDAO.blockGetTrendsInFund(projectSeq);
	}

	public List<FundVO> getFundListByProjectSeq(String projectSeq) {
		return fundDAO.selectByProjectSeq(projectSeq);
	}

	public String getFundListCountByProjectSeq(String projectSeq) {
		return fundDAO.selectCountByProjectSeq(projectSeq);
	}
	
}
