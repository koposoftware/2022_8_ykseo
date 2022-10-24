package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.ProjectDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class ProjectTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private ProjectDAO projectDAO;

	@Ignore
	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Ignore
	@Test
	public void blockGetSubjectRatio() {
		projectDAO.blockGetSubjectRatio();

	}
	
	@Ignore
	@Test
	public void blockGetMonthFundAmt() {
		projectDAO.blockGetMonthFundAmt();
		
	}
	
	@Test
	public void blockGetSexRatio() {
		Map<String, Double> sexRatioMap = projectDAO.blockGetSexRatio(null);
		System.out.println(sexRatioMap.get("man"));
		System.out.println(sexRatioMap.get("woman"));
		Map<String, Double> sexRatioMap2 = projectDAO.blockGetSexRatio("22");
		System.out.println(sexRatioMap2.get("man"));
		System.out.println(sexRatioMap2.get("woman"));
	}

}