package org.sdrc.crvs.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.sdrc.crvs.model.Mail;
import org.sdrc.crvs.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	private final ResourceBundleMessageSource messageSource;
	
    @Autowired
    public UserServiceImpl(ResourceBundleMessageSource messageSource) {
        this.messageSource = messageSource;
    }

	
	@Override
	public String sendMail(Mail mail) throws Exception{
	try {
		 	System.out.println("**************************Mail Method is called**************************");
		 	System.out.println("**************************Mail Method is called************"+mail.getToEmailId() +mail.getToUserName());
			Properties props = new Properties();
			props.put(messageSource.getMessage(Constants.SMTP_HOST_KEY, null, null), messageSource.getMessage(Constants.SMTP_HOST, null, null));
			props.put(messageSource.getMessage(Constants.SOCKETFACTORY_PORT_KEY, null, null), messageSource.getMessage(Constants.SOCKETFACTORY_PORT, null, null));
			props.put(messageSource.getMessage(Constants.SOCKETFACTORY_CLASS_KEY, null, null), messageSource.getMessage(Constants.SOCKETFACTORY_CLASS, null, null));
			props.put(messageSource.getMessage(Constants.SMTP_AUTH_KEY, null, null), messageSource.getMessage(Constants.SMTP_AUTH, null, null));
			props.put(messageSource.getMessage(Constants.SMTP_PORT_KEY, null, null), messageSource.getMessage(Constants.SMTP_PORT, null, null));

			javax.mail.Session session = javax.mail.Session.getDefaultInstance(
					props, new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(
									messageSource.getMessage(Constants.AUTHENTICATION_USERID, null, null),
									messageSource.getMessage(Constants.AUTHENTICATION_PASSWORD, null, null));
						}
					});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(messageSource.getMessage(Constants.MESSAGE_SETFORM, null, null)));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(mail.getToEmailId()));
			message.setRecipients(Message.RecipientType.CC,InternetAddress.parse(mail.getCc()));
			message.setSubject(mail.getSubject().toString());
			message.setText("Dear User" + "\n\n"
					+ mail.getMsg()
					+ "\n\n" + "Regards," + "\n" + mail.getFromUserName());
			Transport.send(message);
			System.out.println("Done");
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return "Done";
	}
	
	@Override
	public String sendMail(String fromUserName,String toUserName,String toEmailId,StringBuffer subject,StringBuffer msg) {
	try {
			Properties props = new Properties();
			props.put(messageSource.getMessage(Constants.SMTP_HOST_KEY, null, null), messageSource.getMessage(Constants.SMTP_HOST, null, null));
			props.put(messageSource.getMessage(Constants.SOCKETFACTORY_PORT_KEY, null, null), messageSource.getMessage(Constants.SOCKETFACTORY_PORT, null, null));
			props.put(messageSource.getMessage(Constants.SOCKETFACTORY_CLASS_KEY, null, null), messageSource.getMessage(Constants.SOCKETFACTORY_CLASS, null, null));
			props.put(messageSource.getMessage(Constants.SMTP_AUTH_KEY, null, null), messageSource.getMessage(Constants.SMTP_AUTH, null, null));
			props.put(messageSource.getMessage(Constants.SMTP_PORT_KEY, null, null), messageSource.getMessage(Constants.SMTP_PORT, null, null));

			javax.mail.Session session = javax.mail.Session.getDefaultInstance(
					props, new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(
									messageSource.getMessage(Constants.AUTHENTICATION_USERID, null, null),
									messageSource.getMessage(Constants.AUTHENTICATION_PASSWORD, null, null));
						}
					});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(messageSource.getMessage(Constants.MESSAGE_SETFORM, null, null)));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(toEmailId));
			message.setSubject(subject.toString());
			message.setText("Dear User" + "\n\n"
					+ "NOTIFICATION DETAILS:" + "\n" + "Message : " + msg
					+ "\n\n" + "Regards," + "\n" + fromUserName);
			Transport.send(message);
			System.out.println("Done");
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return "Done";
	}
}
