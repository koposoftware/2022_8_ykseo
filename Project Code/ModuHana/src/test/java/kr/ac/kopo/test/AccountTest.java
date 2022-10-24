package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.service.AccountService;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.TransactionVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class AccountTest {

	@Autowired
	private AccountDAO accountDAO;
	@Autowired
	private AccountService accountService;

	@Ignore
	@Test
	public void selectByMemberId() {
		AccountVO account = accountDAO.selectByMemberId("1");
		System.out.println(account);
	}

	@Test
	public void getAccountByAccountNoFromBankAPI() {
		AccountVO accountVO = accountService.getAccountByAccountNoFromBankAPI("41268802978822");
		System.out.println(accountVO);
		assertNotNull(accountVO);
	}
	
	@Test
	public void getTransactionListByAccountNoFromBankAPI() {
		List<TransactionVO> transactionList = accountService.getTransactionListByAccountNoFromBankAPI("41268802978822");
		for (TransactionVO transactionVO : transactionList) {
			System.out.println(transactionVO);
		}
		assertNotNull(transactionList);
	}

}