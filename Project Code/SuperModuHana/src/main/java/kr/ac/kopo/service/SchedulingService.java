package kr.ac.kopo.service;

import java.util.List;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Service
@EnableScheduling
@EnableAsync
@RequiredArgsConstructor
public class SchedulingService {

	private final ProjectService projectService;
	private final AccountService accountService;

	@Async
	@Scheduled(cron="0 0 2 * * *")
//	@Scheduled(cron = "0/60 * * * * ?")
	public void repaymentCheckScheduling() {
		System.out.println("반환금액 확인");
		
		// securityExpire가 끝나고 정산완료가 되지 않은 프로젝트 리스트 가져오기
		List<ProjectVO> projectList = projectService.getProjectListNeedRepayment();
		System.out.println(projectList);
		
		// 해당 프로젝트의 회사에서 수익금을 보냈는지 repayment값 확인 및 업데이트
		// (progressCode도 바꿔야함!)
		for (ProjectVO projectVO : projectList) {
			AccountVO account = accountService.getAccountByAccountNoFromBankAPI(projectVO.getAccountNo());
			projectService.updateRepaymentAndProgressCode(projectVO.getProjectSeq(), account.getBalance());
		}

	}
	
	@Async
	@Scheduled(cron="0 0 0 * * *")
//	@Scheduled(cron = "0/60 * * * * ?")
	public void projectUploadScheduling() {
		System.out.println("프로젝트 업로드");
		
		projectService.updateProjectToScheduled();

	}
}
