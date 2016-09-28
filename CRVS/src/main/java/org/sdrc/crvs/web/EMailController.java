package org.sdrc.crvs.web;
import java.util.ArrayList;
import java.util.List;

import org.sdrc.crvs.model.ContactUs;
import org.sdrc.crvs.model.Error;
import org.sdrc.crvs.model.Mail;
import org.sdrc.crvs.service.UserService;
import org.sdrc.crvs.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller

public class EMailController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ResourceBundleMessageSource applicationMessageSource;
	
	@Autowired
	private ResourceBundleMessageSource workspaceMessageSource;
	
	@RequestMapping("/mail")
	public ModelAndView showMailWindow(){
		ModelAndView modelAndView = new ModelAndView("mailwindow");
		Mail mail=new Mail();
		mail.setFromUserName(new StringBuffer("Kamal"));
		mail.setToUserName("Admin");
		mail.setToEmailId("kamallochan095@gmail.com");
		mail.setCc("");
		mail.setSubject(new StringBuffer("subject"));
		mail.setMsg(new StringBuffer("message"));
		modelAndView.addObject("mailModel", mail);
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/submitMail",headers = {"Content-type=application/json"})
	@ResponseBody
	public Error submitMail(@RequestBody Mail mail){
		Error error=new Error();
		try {
			userService.sendMail(mail);
		} catch (Exception e) {
			error.setErrorMessage("Mail sent failed!");
			return error;
		}
		error.setErrorMessage("Mail sent successfully");
		return error;
	}
	
	
}
