package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.AccountService;
import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final AccountService accountService;

	@GetMapping("/login")
	public String loginGet() {
		return "member/login";
	}

	@PostMapping("/login")
	public String loginPost(MemberVO memberVO, HttpSession session) {

		MemberVO user = memberService.login(memberVO);
		System.out.println(user);
		if (user != null) {
			AccountVO myAccount = accountService.getAccountByMemberId(user.getId());
			session.setAttribute("user", user);
			session.setAttribute("myAccount", myAccount);
			return "redirect:/";
		} else {
			return "redirect:/login";
		}

	}

	@PostMapping("/apiLogin")
	public String apiLogin(MemberVO memberVO, HttpSession session) {

		MemberVO user = memberService.apiLogin(memberVO);
		System.out.println(user);
		System.out.println("hihi");
		
		if (user != null) {
			System.out.println("user id : " + user.getId());
			AccountVO myAccount = accountService.getAccountByMemberId(user.getId());
			session.setAttribute("user", user);
			session.setAttribute("myAccount", myAccount);
		} else {
			memberService.apiLogon(memberVO);
		}
		return "redirect:/";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

}
