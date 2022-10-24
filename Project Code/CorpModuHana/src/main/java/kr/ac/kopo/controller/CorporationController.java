package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.CorporationService;
import kr.ac.kopo.vo.CorporationVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CorporationController {

	private final CorporationService corporationService;
	
	@GetMapping("/login")
	public String loginGet() {
		return "corporation/login";
	}

	@PostMapping("/login")
	public String loginPost(CorporationVO corporationVO, HttpSession session) {

		CorporationVO user = corporationService.login(corporationVO);
		System.out.println(user);
		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:/";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/mypage";
	}

}
