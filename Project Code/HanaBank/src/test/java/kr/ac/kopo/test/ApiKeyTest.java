package kr.ac.kopo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.ApiKeyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class ApiKeyTest {

	@Autowired
	private ApiKeyDAO apiKeyDAO;
	
	@Test
	public void selectByUserIdAndApikey() {
//		String apiKey = "LESNG48LEW5BGAPGSJSS";
		String apiKey = "LESNG48LE";
		
		System.out.println(apiKeyDAO.selectByApikey(apiKey));
	}

}