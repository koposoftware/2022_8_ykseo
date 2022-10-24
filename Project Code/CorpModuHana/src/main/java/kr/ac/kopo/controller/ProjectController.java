package kr.ac.kopo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.service.CommCodeService;
import kr.ac.kopo.service.CorporationService;
import kr.ac.kopo.service.ProjectFileService;
import kr.ac.kopo.service.ProjectService;
import kr.ac.kopo.util.KopoFileNamePolicy;
import kr.ac.kopo.vo.CommCodeVO;
import kr.ac.kopo.vo.CorporationVO;
import kr.ac.kopo.vo.ProjectFileVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProjectController {

	private final ProjectService projectService;
	private final ProjectFileService projectFileService;
	private final CorporationService corporationService;
	private final CommCodeService commCodeService;

	@RequestMapping("project/test")
	public void test() {
	}

	@RequestMapping("project/info")
	public void info() {
	}

	@GetMapping("project/apply")
	public String step(HttpSession session) {

		// 내용이 비어있는 프로젝트 생성
		String corpRegNo = ((CorporationVO) session.getAttribute("user")).getRegNo();
		String projectSeq = projectService.createProject(corpRegNo);

		return "redirect:/project/apply/" + projectSeq + "/step1";
	}

	@GetMapping("project/apply/{projectSeq}/step1")
	public String step1Get(@PathVariable("projectSeq") String projectSeq, Model model) {
		
		model.addAttribute("projectSeq", projectSeq);
		
		return "project/step1";
	}

	@PostMapping("project/apply/{projectSeq}/step1")
	public String step1Post(@PathVariable("projectSeq") String projectSeq, CorporationVO corporationVO,
			HttpSession session, Model model) {

		System.out.println("step1Post - corporationVO : " + corporationVO);

		// user 정보 업데이트
		String regNo = ((CorporationVO) session.getAttribute("user")).getRegNo();
		corporationVO.setRegNo(regNo);
		corporationService.updateUserInfoEmailTelAndAddress(corporationVO);

		// session의 user 정보 업데이트
		CorporationVO user = corporationService.getCorporationVOByRegNo(regNo);
		session.setAttribute("user", user);

		return "redirect:/project/apply/" + projectSeq + "/step2";
	}

	@GetMapping("project/apply/{projectSeq}/step2")
	public String step2Get(@PathVariable("projectSeq") String projectSeq, Model model) {
		
		model.addAttribute("projectSeq", projectSeq);

		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);

		List<CommCodeVO> subjectList = commCodeService.getSubjectList();
		model.addAttribute("subjectList", subjectList);

		return "project/step2";
	}

	@PostMapping("project/apply/{projectSeq}/step2")
	public String step2Post(@PathVariable("projectSeq") String projectSeq, MultipartHttpServletRequest request,
			ProjectVO projectVO) {

		MultipartFile file = request.getFile("signImg");
		System.out.println(file.isEmpty());

		if (!file.isEmpty()) {
			String uploadPath = "D:/SpringLecture/spring-workspace/ModuHana/src/main/webapp/resources/upload/sign";
			System.out.println(uploadPath);

			File newFileName = KopoFileNamePolicy.rename(new File(uploadPath, file.getOriginalFilename()));
			ProjectFileVO projectFileVO = new ProjectFileVO();
			projectFileVO.setProjectSeq(projectSeq);
			projectFileVO.setOriName(file.getOriginalFilename());
			projectFileVO.setSaveName(newFileName.getName());
			projectFileVO.setPath("/resources/upload/sign");

			projectFileService.uploadSingImg(projectFileVO);

			try {
				file.transferTo(newFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 프로젝트 내용 정보 업데이트
		projectService.updateStep2Part(projectSeq, projectVO);

		return "redirect:/project/apply/" + projectSeq + "/step3";
	}

	@GetMapping("project/apply/{projectSeq}/step3")
	public String step3Get(@PathVariable("projectSeq") String projectSeq, Model model) {
		
		model.addAttribute("projectSeq", projectSeq);

		ProjectVO project = projectService.getProjectByProjectSeq(projectSeq);
		model.addAttribute("project", project);
		System.out.println(project);

		List<CommCodeVO> securityTypeList = commCodeService.getSecurityTypeList();
		model.addAttribute("securityTypeList", securityTypeList);

		List<CommCodeVO> repaymentCodeList = commCodeService.getRepaymentCodeList();
		model.addAttribute("repaymentCodeList", repaymentCodeList);

		return "project/step3";
	}

	@PostMapping("project/apply/{projectSeq}/step3")
	public String step3Post(@PathVariable("projectSeq") String projectSeq, ProjectVO projectVO) {

		System.out.println("step3Post - projectVO : " + projectVO);

		// 프로젝트 내용 정보 업데이트
		projectService.updateStep3Part(projectSeq, projectVO);
		
		// 신청
		projectService.apply(projectSeq);

		return "redirect:/mypage";
//		return "redirect:/project/apply/" + projectSeq + "/step4";
	}

	@GetMapping("project/apply/{projectSeq}/step4")
	public String step4Get(@PathVariable("projectSeq") String projectSeq, Model model) {
		
		model.addAttribute("projectSeq", projectSeq);

		return "project/step4";
	}

	@PostMapping("project/apply/{projectSeq}/step4")
	public String step4Post(@PathVariable("projectSeq") String projectSeq, MultipartHttpServletRequest request) {

		// 제출 서류 업로드
		Iterator<String> fileNames = request.getFileNames();
		List<ProjectFileVO> fileList = new ArrayList<>();

		while (fileNames.hasNext()) {

			MultipartFile file = request.getFile(fileNames.next());

			if (!file.isEmpty()) {
				String uploadPath = "D:/SpringLecture/webapps/wtpwebapps/ModuHana/resources/upload/reference";
				System.out.println(uploadPath);

				File newFileName = KopoFileNamePolicy.rename(new File(uploadPath, file.getOriginalFilename()));
				ProjectFileVO projectFileVO = new ProjectFileVO();
				projectFileVO.setProjectSeq(projectSeq);
				projectFileVO.setOriName(file.getOriginalFilename());
				projectFileVO.setSaveName(newFileName.getName());
				projectFileVO.setPath("/resources/upload/reference");
				projectFileVO.setTypeCode("2");

				fileList.add(projectFileVO);
				
				try {
					file.transferTo(newFileName);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		projectFileService.uploadReferenceFile(fileList);
		projectService.apply(projectSeq);

		return "redirect:/mypage";
	}
}
