package kr.ac.kopo.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.vo.AccountVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class AccountTest {

	@Autowired
	private AccountDAO accountDAO;
	
	@Test
	public void procedureCreateAccount() {
		Map<String, Object> accountVO = new HashMap<>();
		accountVO.put("customerId", "1");
		accountVO.put("name", "구이경의 예치금 계좌");
		accountVO.put("password", "1111");
		accountVO.put("typeCode", "02");
		
		String accountNo = accountDAO.procedureCreateAccount(accountVO);
		System.out.println("new accountNo : " + accountNo);
	}

	@Test
	public void selectByAccountNo() {
		AccountVO account = accountDAO.selectByAccountNo("41268802978822");
		System.out.println(account);
	}
	
	@Test
	public void createAccount() {
		Map<String, Object> accountVO = new HashMap<>();
		accountVO.put("name", "구이경의 예치금 계좌");
		accountVO.put("password", "1111");
		accountVO.put("typeCode", "02");
		
		String accountNo = accountDAO.procedureCreateAccount(accountVO);
		System.out.println("new accountNo : " + accountNo);
	}

}