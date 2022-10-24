package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.AccountService;
import kr.ac.kopo.service.FundService;
import kr.ac.kopo.service.ProjectService;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.FundVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FundController {

	private final FundService fundService;
	private final AccountService accountService;
	private final ProjectService projectService;

	@GetMapping("/fund/{projectSeq}")
	public String fund(@PathVariable("projectSeq") String projectSeq, HttpSession session, Model model) {

		AccountVO myAccount = (AccountVO) session.getAttribute("myAccount");

		// 회원 계좌 정보 가져오기
		myAccount = accountService.getAccountByAccountNoFromBankAPI(myAccount.getAccountNo());
		model.addAttribute("myAccount", myAccount);

		// 프로젝트 정보 가져오기
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);
		
		return "fund/fund";

	}
	
	@PostMapping("/fund/{projectSeq}")
	public String complete(@PathVariable("projectSeq") String projectSeq, String amount, String password, HttpSession session, Model model) {
		
		FundVO fundVO = new FundVO();
		String accountNo = ((AccountVO) session.getAttribute("myAccount")).getAccountNo();
		fundVO.setMemberAccountNo(accountNo);
		fundVO.setProjectSeq(projectSeq);
		fundVO.setAmount(amount);
		
		// 투자
		String fundSeq = accountService.fund((MemberVO)session.getAttribute("user"), fundVO, password);
		model.addAttribute("fundSeq", fundSeq);
		
		return "fund/complete";
		
	}
	
	@RequestMapping("/fund/detail/{fundSeq}")
	public String detail(@PathVariable("fundSeq") String fundSeq, Model model) {
		
		FundVO fund = fundService.getFundByFundSeq(fundSeq);
		model.addAttribute("fund", fund);
		
		ProjectVO project = projectService.getProjectByProjectSeq(fund.getProjectSeq());
		model.addAttribute("project", project);
		
		return "fund/detail";
		
	}
}
