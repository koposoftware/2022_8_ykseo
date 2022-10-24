package kr.ac.kopo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.FundDAO;
import kr.ac.kopo.vo.FundVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FundService {

	private final FundDAO fundDAO;

	public Map<String, Object> getFundListWithAccountNo(String accountNo) {

		Map<String, Object> fundMap = new HashMap<>();

		ArrayList<FundVO> inProgressFund = (ArrayList<FundVO>) fundDAO.selectInProgressFundByMemberAccountNo(accountNo);
		String inProgressCost = fundDAO.selectInProgressSumCost(accountNo);
		if (inProgressCost == null) {
			inProgressCost = "0";
		}

		ArrayList<FundVO> cumulativeFund = (ArrayList<FundVO>) fundDAO.selectCumulativeFundByMemberAccountNo(accountNo);
		String cumulativeCost = fundDAO.selectCumulativeSumCost(accountNo);
		if (cumulativeCost == null) {
			cumulativeCost = "0";
		}
		
		String sumProceeds = fundDAO.selectSumProceeds(accountNo);

		fundMap.put("inProgressFund", inProgressFund);
		fundMap.put("inProgressCost", inProgressCost);
		fundMap.put("inProgressFundSize", inProgressFund.size());

		fundMap.put("cumulativeFund", cumulativeFund);
		fundMap.put("cumulativeCost", cumulativeCost);
		fundMap.put("cumulativeFundSize", cumulativeFund.size());
		
		fundMap.put("sumProceeds", sumProceeds);

		return fundMap;

	}

	public String fund(FundVO fundVO) {
		// 투자 내역 로그 & 프로젝트 fundAmt update
		return fundDAO.procedureFunding(fundVO);
	}

	public FundVO getFundByFundSeq(String fundSeq) {
		return fundDAO.selectByFundSeq(fundSeq);
	}
}
