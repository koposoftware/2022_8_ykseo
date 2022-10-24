package kr.ac.kopo.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.ProjectService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProjectController {

	private final ProjectService projectService;
	
	@RequestMapping(value = "/project/approve", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public void approve(@RequestBody String jsonData) {
		System.out.println("approve : " + jsonData);
		projectService.approveProject(jsonData);
	}
	
	@RequestMapping(value = "/project/cancelApprove", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public void cancelApprove(@RequestBody String jsonData) {
		System.out.println("cancelApprove : " + jsonData);
		projectService.cancelApprovedProject(jsonData);
	}
	
	@RequestMapping(value = "project/upload", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public void upload(@RequestBody String jsonData) {
		System.out.println("upload : " + jsonData);
		projectService.uploadProject(jsonData);
	}
	
	@RequestMapping(value = "project/refuse", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public void refuse(@RequestBody String jsonData) {
		System.out.println("refuse : " + jsonData);
		projectService.refuseProject(jsonData);
	}
	
	@RequestMapping(value = "project/pay", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public void pay(@RequestBody String jsonData) {
		System.out.println("pay : " + jsonData);
		projectService.pay(jsonData);
	}
}
