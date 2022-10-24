package kr.ac.kopo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.service.CertifyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class NaverClovaTest {

	@Autowired
	private CertifyService certifyService;
	
	@Test
	public void imgTest() {
		certifyService.cerificationWithIdCard("D:/idcard.jpg");
	}
}
