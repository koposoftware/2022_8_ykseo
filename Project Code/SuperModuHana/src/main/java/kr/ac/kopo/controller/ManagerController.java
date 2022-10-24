package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.ManagerService;
import kr.ac.kopo.vo.ManagerVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ManagerController {
	
	private final ManagerService managerService;
	
	@GetMapping("/login")
	public String loginGet() {
		return "manager/login";
	}

	@PostMapping("/login")
	public String loginPost(ManagerVO managerVO, HttpSession session) {

		ManagerVO user = managerService.login(managerVO);
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
		return "redirect:/";
	}

}
