package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.AccountService;
import kr.ac.kopo.service.CommCodeService;
import kr.ac.kopo.service.FundService;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.CommCodeVO;
import kr.ac.kopo.vo.TransactionVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MypageController {

	private final FundService fundService;
	private final AccountService accountService;
	private final CommCodeService commCodeService;

	@RequestMapping("mypage")
	public String mypageFund(HttpSession session, Model model) {

		AccountVO myAccount = (AccountVO) session.getAttribute("myAccount");
		System.out.println(myAccount);
		
		// 은행 리스트
		List<CommCodeVO> bankList = commCodeService.getCommCodeByCodeId("100");
		model.addAttribute("bankList", bankList);
		
		// 투자 내역 및 금액
		Map<String, Object> fundMap = fundService.getFundListWithAccountNo(myAccount.getAccountNo());
		model.addAttribute("fundMap", fundMap);

		// 예치금 현황 - 계좌 정보
		myAccount = accountService.getAccountByAccountNoFromBankAPI(myAccount.getAccountNo());
		model.addAttribute("myAccount", myAccount);

		// 예치금 현황 - 거래내역
		List<TransactionVO> transactionList = accountService.getTransactionListByAccountNoFromBankAPI(myAccount.getAccountNo());
		model.addAttribute("transactionList", transactionList);
		
		return "member/mypage";
	}
}
