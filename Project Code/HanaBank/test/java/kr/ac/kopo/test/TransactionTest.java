package kr.ac.kopo.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.TransactionDAO;
import kr.ac.kopo.vo.TransactionVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class TransactionTest {

	@Autowired
	private TransactionDAO transactionDAO;

	@Test
	public void selectByTransactionNo() {
		List<TransactionVO> transactionList = transactionDAO.selectAllByAccountNo("41268802978822");
		for (TransactionVO transactionVO : transactionList) {
			System.out.println(transactionVO);
		}
	}
	
	@Test
	public void procedureTransfer() {
//		TransactionVO transactionVO = new TransactionVO();
//		transactionVO.setActiveAcctNo("41268802978822");
//		transactionVO.setTypeCode("1");
//		transactionVO.setName("서유경에게 출금");
//		transactionVO.setAmount("10000");
//		transactionVO.setDealBankCode("81");
//		transactionVO.setDealAcctNo("41238541723630");
//		transactionVO.setDealName("구이경으로부터 입금");
//		
//		transactionDAO.procedureTransfer(transactionVO, "1111");
	}

}