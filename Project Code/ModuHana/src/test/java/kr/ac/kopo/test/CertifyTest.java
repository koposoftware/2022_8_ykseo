package kr.ac.kopo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.service.CertifyService;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class CertifyTest {

	@Autowired
	private CertifyService certifyService;

	@Test
	public void createDepositAccount() {
		MemberVO user = new MemberVO();
		user.setId("1");
		user.setName("구이경");

		String password = "1111";
		AccountVO accountVO = certifyService.createDepositAccount(user, password);
		System.out.println(accountVO);
	}

}