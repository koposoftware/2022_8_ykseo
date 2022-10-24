package kr.ac.kopo.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.service.CertifyService;
import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.util.KopoFileNamePolicy;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CertifyController {

	private final CertifyService certifyService;
	private final MemberService memberService;

	@GetMapping("/certify/phone")
	public String phoneGet() {
		return "certify/phone";
	}

	@PostMapping("/certify/phone")
	public String phonePost(MemberVO memberVO, @RequestParam("authNum") String authNum, HttpSession session) {

		String num = String.valueOf(session.getAttribute("authNum"));
		System.out.println(num);
		
		if (authNum != null && authNum.equals(num)) {
			return "redirect:/certify/idcard";
		}
		
		return "redirect:/certify/phone";
	}

	@GetMapping("/certify/idcard")
	public String idcardGet() {
		return "certify/idcard";
	}

	@PostMapping("/certify/idcard")
	public String idcardPost(MultipartFile[] uploadfile, HttpServletRequest request) {

		String uploadPath = "D:/SpringLecture/webapps/wtpwebapps/ModuHana/resources/upload/idcard";
		System.out.println(uploadPath);

		for (MultipartFile file : uploadfile) {
			File newFileName = KopoFileNamePolicy.rename(new File(uploadPath, file.getOriginalFilename()));

			try {
				file.transferTo(newFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println(newFileName.getPath().replace('/', '/'));
			Map<String, String> idcardInfo = certifyService.cerificationWithIdCard(newFileName.getPath());

			request.setAttribute("idcardInfo", idcardInfo);
			request.setAttribute("idcard", newFileName.getName());
		}

		return "certify/idcard";
	}

	@RequestMapping("/certify/account")
	public void account(@RequestParam("regNoFront") String regNoFront, @RequestParam("regNoBack") String regNoBack,
			HttpSession session) {
		// 1. 주민등록번호 정보 등록
		System.out.println(regNoFront + "-" + regNoBack);

		MemberVO user = (MemberVO) session.getAttribute("user");

		user.setRegNoFront(regNoFront);
		user.setRegNoBack(regNoBack);

		System.out.println(user);
		memberService.uploadRegNo(user);

	}

	@RequestMapping("/certify/account/create")
	public String create(@RequestParam("password") String password, @RequestParam("repassword") String repassword,
			HttpSession session) {

		if (password.equals(repassword)) {
			// 비밀번호로 계좌 생성
			System.out.println("password : " + password);
			System.out.println("repassword : " + repassword);

			MemberVO user = (MemberVO) session.getAttribute("user");
			AccountVO myAccount = certifyService.createDepositAccount(user, password);

			// 만들어진 계좌 session에 업로드
			session.setAttribute("myAccount", myAccount);

			return "certify/create";
		}

		return "certify/account";
	}
}
