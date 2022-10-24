package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.CommCodeService;
import kr.ac.kopo.service.NoticeFileService;
import kr.ac.kopo.service.NoticeService;
import kr.ac.kopo.service.ProjectFileService;
import kr.ac.kopo.service.ProjectService;
import kr.ac.kopo.service.ReplyService;
import kr.ac.kopo.vo.CommCodeVO;
import kr.ac.kopo.vo.NoticeFileVO;
import kr.ac.kopo.vo.NoticeVO;
import kr.ac.kopo.vo.ProjectVO;
import kr.ac.kopo.vo.ReplyVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProjectController {

	private final ProjectService projectService;
	private final ProjectFileService projectFileService;
	private final CommCodeService commCodeService;
	private final NoticeService noticeService;
	private final NoticeFileService noticeFileService;
	private final ReplyService replyService;

	@GetMapping("project/list")
	public void listGet(Model model) {
		// 콘텐츠 목록
		List<CommCodeVO> subjectList = commCodeService.getCommCodeByCodeId("210");
		model.addAttribute("subjectList", subjectList);
		System.out.println(subjectList);

		// 프로젝트 리스트
		List<ProjectVO> projectList = projectService.getProjectList("all");
		model.addAttribute("projectList", projectList);
	}

	@PostMapping("project/list")
	public void listPost(@ModelAttribute("selectedSubject") String selectedSubject, Model model) {
		// 콘텐츠 목록
		List<CommCodeVO> subjectList = commCodeService.getCommCodeByCodeId("210");
		System.out.println(subjectList);
		model.addAttribute("subjectList", subjectList);

		// 프로젝트 리스트
		System.out.println("selectedSubject : " + selectedSubject);
		List<ProjectVO> projectList = projectService.getProjectList(selectedSubject);
		model.addAttribute("projectList", projectList);
	}

	@GetMapping("project/detail/{projectSeq}")
	public String detail(@PathVariable("projectSeq") String projectSeq, Model model) {

		System.out.println("projectSeq : " + projectSeq);

		// 프로젝트
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);

		// 프로젝트 파일
		List<String> typeCodeList = new ArrayList<String>();
		typeCodeList.add("0");
		typeCodeList.add("1");
		typeCodeList.add("2");

		Map<String, Object> projectFileMap = projectFileService.getProjectFileListByProjectSeq(projectSeq,
				typeCodeList);
		model.addAttribute("projectFileMap", projectFileMap);
		System.out.println("projectFileMap : " + projectFileMap);

		// 공지 전체
		List<NoticeVO> noticeList = noticeService.getNoticeListByProjectSeq(projectSeq);
		model.addAttribute("noticeList", noticeList);

		// 댓글 전체
		List<ReplyVO> replyList = replyService.getReplyListByProjectSeq(projectSeq);
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyListCnt", replyList.size());

		return "project/detail";
	}

	@RequestMapping("project/notice/{projectSeq}/{noticeSeq}")
	public String notice(@PathVariable("projectSeq") String projectSeq, @PathVariable("noticeSeq") String noticeSeq,
			Model model) {
		// 프로젝트
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);
		
		// 프로젝트 파일
		List<String> typeCodeList = new ArrayList<String>();
		typeCodeList.add("0");
		typeCodeList.add("1");
		typeCodeList.add("2");

		Map<String, Object> projectFileMap = projectFileService.getProjectFileListByProjectSeq(projectSeq,
				typeCodeList);
		model.addAttribute("projectFileMap", projectFileMap);

		// 공지
		NoticeVO notice = noticeService.getNoticeByNoticeSeq(noticeSeq);
		model.addAttribute("notice", notice);

		// 공지 파일
		List<NoticeFileVO> noticefileList = noticeFileService.getNoticeFileListByNoticeSeq(noticeSeq);
		model.addAttribute("noticefileList", noticefileList);

		return "project/notice";
	}

	@PostMapping("project/detail/{projectSeq}")
	public String replyPost(@PathVariable("projectSeq") String projectSeq, ReplyVO replyVO, Model model) {
		// 댓글 등록
		replyService.registerReply(replyVO);

		// 프로젝트
		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);

		// 프로젝트 파일
		List<String> typeCodeList = new ArrayList<String>();
		typeCodeList.add("0");
		typeCodeList.add("1");
		typeCodeList.add("2");

		Map<String, Object> projectFileMap = projectFileService.getProjectFileListByProjectSeq(projectSeq,
				typeCodeList);
		model.addAttribute("projectFileMap", projectFileMap);
		
		// 공지
		List<NoticeVO> noticeList = noticeService.getNoticeListByProjectSeq(projectSeq);
		model.addAttribute("noticeList", noticeList);

		// 댓글 전체
		List<ReplyVO> replyList = replyService.getReplyListByProjectSeq(projectSeq);
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyListCnt", replyList.size());

		return "project/detail";
	}
}
