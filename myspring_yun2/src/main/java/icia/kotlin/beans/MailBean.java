package icia.kotlin.beans;

import org.springframework.web.servlet.ModelAndView;

import lombok.Data;

@Data
public class MailBean {
	
	String mailReceiver;
	String mailSubject;
	String mailContent;

}
