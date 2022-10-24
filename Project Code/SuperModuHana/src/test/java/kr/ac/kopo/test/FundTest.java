package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
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

	@Ignore
	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Test
	public void blockGetTrendsInFund() {
		List<HashMap<String, Object>> monthFundAmt = fundDAO.blockGetTrendsInFund("18");

		System.out.println(monthFundAmt.size());
		for (Map<String, Object> map : monthFundAmt) {
			System.out.println(map.get("DAY") + " : " + map.get("COUNT"));
		}
	}
	
	@Test
	public void procedureCalProjectPayoff() {
		List<FundVO> fundList = fundDAO.procedureCalProjectPayoff("18");
		
		System.out.println(fundList.size());
		for (FundVO fund : fundList) {
			System.out.println(fund);
		}
	}

}