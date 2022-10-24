package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.CommCodeService;
import kr.ac.kopo.service.FundService;
import kr.ac.kopo.service.MailSendService;
import kr.ac.kopo.service.ProjectService;
import kr.ac.kopo.vo.CommCodeVO;
import kr.ac.kopo.vo.CorporationVO;
import kr.ac.kopo.vo.FundVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MypageController {

	private final ProjectService projectService;
	private final CommCodeService commCodeService;
	private final FundService fundService;
	private final MailSendService mailSendService;

	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {

		String corpRegNo = ((CorporationVO) session.getAttribute("user")).getRegNo();

		Map<String, Object> mypageMap = projectService.getMypageMap(corpRegNo);
		model.addAttribute("mypageMap", mypageMap);

		List<Map<String, Object>> inprogressProjects = projectService
				.getAccumulatedFundAmtOfInprogressProjects(corpRegNo);
		model.addAttribute("inprogressProjects", inprogressProjects);

		return "mypage/mypage";
	}

	@GetMapping("/mypage/projects")
	public void projectsGet(HttpSession session, Model model) {

		// 진행상태 목록
		List<CommCodeVO> ProgressList = commCodeService.getProgressList();
		model.addAttribute("ProgressList", ProgressList);

		// 프로젝트 리스트
		List<ProjectVO> projectList = projectService
				.getProjectList(((CorporationVO) session.getAttribute("user")).getRegNo(), "all");
		model.addAttribute("projectList", projectList);
	}

	@PostMapping("/mypage/projects")
	public void projectsPost(@ModelAttribute("selectedProgress") String selectedProgress, HttpSession session,
			Model model) {
		// 진행상태 목록
		List<CommCodeVO> ProgressList = commCodeService.getProgressList();
		model.addAttribute("ProgressList", ProgressList);

		// 프로젝트 리스트
		System.out.println("selectedProgress : " + selectedProgress);
		List<ProjectVO> projectList = projectService
				.getProjectList(((CorporationVO) session.getAttribute("user")).getRegNo(), selectedProgress);
		model.addAttribute("projectList", projectList);
	}

	@GetMapping("/mypage/detail/{projectSeq}")
	public String detailGet(@PathVariable("projectSeq") String projectSeq, HttpSession session, Model model) {
		// 프로젝트 가져오기
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);

		// 남여 비율
		Map<String, Double> sexRatio = fundService.getSexRatio(projectSeq);
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

		return "mypage/detail";
	}
	
	@GetMapping("/mypage/detail/mail/{projectSeq}")
	public String mailGet(@PathVariable("projectSeq") String projectSeq, Model model) {

		// 프로젝트 가져오기
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);
		
		return "/mypage/mail";
	}
	@PostMapping("/mypage/detail/mail/{projectSeq}")
	public String mailPost(@PathVariable("projectSeq") String projectSeq, String title, String content) {
		
		mailSendService.mailSendToFunder(projectSeq, title, content);
		
		return "redirect:/mypage/detail/mail/" + projectSeq;
	}

}
