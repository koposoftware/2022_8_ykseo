package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.FundVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class FundDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public List<FundVO> selectInProgressFundByMemberAccountNo(String memberAccountNo) {
		return sqlSessionTemplate.selectList("dao.FundDAO.selectInProgressFundByMemberAccountNo", memberAccountNo);
	}

	public List<FundVO> selectCumulativeFundByMemberAccountNo(String memberAccountNo) {
		return sqlSessionTemplate.selectList("dao.FundDAO.selectCumulativeFundByMemberAccountNo", memberAccountNo);
	}

	public String selectInProgressSumCost(String memberAccountNo) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectInProgressSumCost", memberAccountNo);
	}

	public String selectCumulativeSumCost(String memberAccountNo) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectCumulativeSumCost", memberAccountNo);
	}

	public String procedureFunding(FundVO fundVO) {
		sqlSessionTemplate.selectOne("dao.FundDAO.procedureFunding", fundVO);
		return fundVO.getFundSeq();
	}

	public FundVO selectByFundSeq(String fundSeq) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectByFundSeq", fundSeq);
	}

	public String selectSumProceeds(String accountNo) {
		return sqlSessionTemplate.selectOne("dao.FundDAO.selectSumProceeds", accountNo);
	}

}
