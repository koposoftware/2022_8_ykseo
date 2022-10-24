package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.FundDAO;
import kr.ac.kopo.vo.FundVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class FundTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private FundDAO fundDAO;

	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Test
	public void procedureFundInfoByAccountNo() {
		ArrayList<FundVO> fundList = (ArrayList<FundVO>) fundDAO.selectInProgressFundByMemberAccountNo("41268802978822");
		for (FundVO fundVO : fundList) {
			System.out.println(fundVO);
		}

	}

	@Test
	public void selectCumulativeFundByAccountNo() {
		ArrayList<FundVO> fundList = (ArrayList<FundVO>) fundDAO.selectCumulativeFundByMemberAccountNo("41268802978822");
		for (FundVO fundVO : fundList) {
			System.out.println(fundVO);
		}

	}

	@Test
	public void selectInProgressSumCost() {
		String sumCost = fundDAO.selectInProgressSumCost("41268802978822");
		System.out.println("inprogress sumCost : " + sumCost);
	}

	@Test
	public void selectCumulativeSumCost() {
		String sumCost = fundDAO.selectCumulativeSumCost("41268802978822");
		System.out.println("Cumulative sumCost : " + sumCost);
	}
	
	@Test
	public void procedureFunding() {
		FundVO fundVO = new FundVO();
		fundVO.setProjectSeq("1");
		fundVO.setMemberAccountNo("41268802978822");
		fundVO.setAmount("10000");
		
		System.out.println(fundDAO.procedureFunding(fundVO));
	}

	@Test
	public void selectByFundSeq() {
		System.out.println(fundDAO.selectByFundSeq("1"));
	}

}