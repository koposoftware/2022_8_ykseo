package kr.ac.kopo.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:coolsms.properties")
public class MailSendService {

	@Value("${email}")
	private String ModuHanaEmail;

	private final JavaMailSenderImpl mailSender;

	public void mailSend(String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(ModuHanaEmail);
			helper.setTo(toMail);
			helper.setSubject(title);

			helper.setText(content.toString(), true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
