package icia.kotlin.service;


import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.kotlin.beans.MailBean;

@Service
public class Mail {
	@Autowired
	private JavaMailSenderImpl sendmail;
	
	ModelAndView mav;
	
	public Mail() {}
	
	public  ModelAndView entrance(MailBean mail) {
		mav = this.sendTextMail(mail);
		return mav;
	}

	private ModelAndView sendTextMail(MailBean sendmail) {
		System.out.println(sendmail.getMailReceiver());
		System.out.println(sendmail.getMailSubject());
		System.out.println(sendmail.getMailContent());
	mav = new ModelAndView();
	try {	
		MimeMessage mailMessage = this.sendmail.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mailMessage,true,"UTF-8");
		
		helper.setTo(sendmail.getMailReceiver());
		helper.setSubject(sendmail.getMailSubject());
		helper.setText(sendmail.getMailContent());
		helper.setFrom("qlalqkd2@naver.com");
		
		this.sendmail.send(mailMessage);
		mav.addObject("receiver",sendmail.getMailReceiver());
		mav.setViewName("sendResult");
		
	
	} catch (Exception e) {
		e.printStackTrace();
		mav.setViewName("mail");
	}

	return mav;
	}
}
