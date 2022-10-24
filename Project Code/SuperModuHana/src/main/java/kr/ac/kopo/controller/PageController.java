package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.service.FundService;
import kr.ac.kopo.service.MailSendService;
import kr.ac.kopo.service.ProjectService;
import kr.ac.kopo.vo.FundVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PageController {

	private final ProjectService projectService;
	private final FundService fundService;
	private final MailSendService mailSendService;

	@GetMapping("/main")
	public String index(Model model) {

		// 3개
		Map<String, String> headValues = projectService.getHeadValues();
		model.addAttribute("totalFundAmt", headValues.get("totalFundAmt"));
		model.addAttribute("totalMember", headValues.get("totalMember"));
		model.addAttribute("avgPayoff", headValues.get("avgPayoff"));

		// 성별
		Map<String, Double> sexRatio = projectService.getSexRatio();
		model.addAttribute("sexRatio", sexRatio);

		// 컨텐츠 비율
		List<ProjectVO> subjectRatio = projectService.getSubjectRatio();
		model.addAttribute("subjectRatio", subjectRatio);

		// 월별 투자 금액
		List<Double> monthFundAmt = projectService.getMonthFundAmt();
		model.addAttribute("monthFundAmt", monthFundAmt);

		// inprogress projects 가져오기
		Map<String, Object> projects = projectService.getClassifiedProjects();
		model.addAttribute("countAwaitingProjects", projects.get("countAwaitingProjects"));
		model.addAttribute("inProgressProjects", projects.get("inProgressProjectList"));
//		for (ProjectVO project : projects.get("inProgressProjectList")) {
//			System.out.println(project);
//		}
		return "page/main";
	}

	@GetMapping("/projects")
	public String projectsGet(Model model) {

		// 프로젝트 가져오기
		Map<String, Object> projects = projectService.getClassifiedProjects();
		model.addAttribute("projects", projects);

		return "page/projects";
	}

	@GetMapping("/detail/{projectSeq}")
	public String detail(@PathVariable("projectSeq") String projectSeq, Model model) {

		// 프로젝트 가져오기
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);

		// 남여 비율
		Map<String, Double> sexRatio = projectService.getSexRatio(projectSeq);
		model.addAttribute("sexRatio", sexRatio);

		// 누적 투자금
		List<HashMap<String, Object>> trendsInFund = fundService.getTrendsInFund(projectSeq);
		model.addAttribute("trendsInFund", trendsInFund);

		// 펀드 상태 가져오기
		List<FundVO> fundList = fundService.getFundListByProjectSeq(projectSeq);
		model.addAttribute("fundList", fundList);

		// 투자자 수
		String countFundList = fundService.getFundListCountByProjectSeq(projectSeq);
		model.addAttribute("countFundList", countFundList);

		return "page/detail";
	}
	
	@GetMapping("/detail2/{projectSeq}")
	public String detail2(@PathVariable("projectSeq") String projectSeq, Model model) {
		
		// 프로젝트 가져오기
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);
		
		return "page/detail2";
	}
	
	
	@GetMapping("/mail/{projectSeq}")
	public String mailGet(@PathVariable("projectSeq") String projectSeq, Model model) {
		
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);
		
		String corpEmail = projectService.getCorpEmail(projectSeq);
		System.out.println("corpEmail : " + corpEmail);
		model.addAttribute("corpEmail", corpEmail);
		
		return "page/mail";
	}
	
	@PostMapping("/mail/{projectSeq}")
	public String mailPost(@PathVariable("projectSeq") String projectSeq, String toMail, String title, String content) {
		mailSendService.mailSend(toMail, title, content);
		
		return "redirect:/detail2/" + projectSeq;
	}
}
