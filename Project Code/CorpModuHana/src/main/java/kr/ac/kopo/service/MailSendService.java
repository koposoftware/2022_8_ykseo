package kr.ac.kopo.service;

import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.CorporationDAO;
import kr.ac.kopo.vo.FundVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailSendService {

	private final JavaMailSenderImpl mailSender;
	private final FundService fundService;
	private final CorporationDAO corporationDAO;

	private void mailSend(String toMail, String fromEmail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(fromEmail);
			helper.setTo(toMail);
			helper.setSubject(title);

			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void mailSendToFunder(String projectSeq, String title, String content) {
//		List<FundVO> fundList = fundService.getFundListByProjectSeq(projectSeq);
		String fromEmail = corporationDAO.getCropEmailByProjectSeq(projectSeq);
		
		FundVO fundVO = new FundVO();
		fundVO.setMemberEmail("syk332@naver.com");
		List<FundVO> fundList = new ArrayList<>();
		fundList.add(fundVO);
		
		for (FundVO fund : fundList) {
			mailSend(fund.getMemberEmail(), fromEmail, title, content);
		}
	}

}
