package com.kh.groomingProject.mail.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.groomingProject.mail.model.vo.Mail;

@Controller
public class MailController {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping("sendCertiEmail.do")
	public String sendMail(final Mail mail) {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				helper.setFrom(mail.getMailFrom());
//				helper.setTo(mail.getMailTo());
//				helper.setSubject(mail.getMailSubject());
//				helper.setText(mail.getMailContent(), true);
				helper.setFrom("kks <kangkwangsan@gmail.com>");
				helper.setTo("kangkwangsan@naver.com");
				helper.setSubject("mail전송 테스트");
				helper.setText("메일 send test", true);
			}
		};
		
		mailSender.send(preparator);
		
		return "result";
		
	}
}
