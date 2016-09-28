package org.sdrc.crvs.util;

public class Constants {
      public static final  String USER_PRINCIPAL="UserPrincipal"; 
      public static final  String REFERER ="referer"; 
      public static final  String REDIRECT ="redirect:";
      public static final  String ATTRIBUTE_EMAIL ="email";
      public static final  String BAD_CREDENTIALS_LOGIN="badCredentials.login";
      public static final  String ACCESS_DENIED="accessDenied";
      
      //Notification Constants
      public static final  String SMTP_HOST_KEY ="smtp.host.key";
      public static final  String SOCKETFACTORY_PORT_KEY ="socketFactory.port.key";
      public static final  String SOCKETFACTORY_CLASS_KEY ="socketFactory.class.key";
      public static final  String SMTP_AUTH_KEY ="smtp.auth.key";
      public static final  String SMTP_PORT_KEY ="smtp.port.key";
      
      public static final  String SMTP_HOST ="smtp.host";
      public static final  String SOCKETFACTORY_PORT ="socketFactory.port";
      public static final  String SOCKETFACTORY_CLASS ="socketFactory.class";
      public static final  String SMTP_AUTH ="smtp.auth";
      public static final  String SMTP_PORT ="smtp.port";
      public static final  String AUTHENTICATION_USERID ="authentication.userid";
      public static final  String AUTHENTICATION_PASSWORD ="authentication.password";
      public static final  String MESSAGE_SETFORM ="message.setFrom";
      
	  
	  //Regarding WORKSPACE constants
	  //file validation categories
	  public static final String VALIDATE_AREACODE = "validate.areacode";
	  public static final String VALIDATE_FORMCODE = "validate.formcode";
	  public static final String VALIDATE_DATE = "validate.date";
	  
	  //file validation error message
	  public static final String FILE_UNSELECTED = "file.unselected";
	  public static final String FILE_WRONGCODE = "file.worngcode";
	  public static final String FILE_WRONGMONTH = "file.wrongmonth";
	  public static final String FILE_WRONGYEAR = "file.worngyear";
	  public static final String FILE_WRONGFILE = "file.wrongfile";
	  public static final String FILE_INVALIDFILE = "file.invalidfile";
	  public static final String FILE_WRONGAREA = "file.worngarea";
	  public static final String FILE_NOT_FOUND = "file.notfound";
	  
	  //Forgot password mail .
	  public static final String FORGOT_PASSWORD_MAIL_MSG = "forgot.password.mail.msg";
	  public static final String FORGOT_PASSWORD_MAIL_FROM_USER = "forgot.password.mail.from.user";
	  public static final String FORGOT_PASSWORD_MAIL_SUBJECT = "forgot.password.mail.subject";
	  public static final String FORGOT_PASSWORD_MAIL_SUCCESS_MSG = "forgot.password.mail.success.msg";
	  public static final String FORGOT_PASSWORD_MAIL_ERR_MSG = "forgot.password.mail.err.msg";
	  public static final String FORGOT_PASSWORD_MAIL_ID_NOT_EXIST_ERR = "forgot.password.mail.Id.not.exist.err";
	  
	  //Login Error .
	  public static final String LOGIN_ERROR_MSG = "login.error.msg";
	  
      
	 public static class Features
	 {
		 public static final String FEATURE_HOMESCREEN = "Home_Screen";
		 public static final String FEATURE_ABOUTSCREEN = "About_Screen";
		 public static final String FEATURE_PRESENTATIONS = "Presentations";
		 public static final String FEATURE_PHOTOGRAPHS = "Photographs";
		 public static final String FEATURE_REPORTS = "Reports";
		 public static final String FEATURE_LOGIN = "Login";
		 public static final String FEATURE_DASHBOARD = "Dashboard";
		 public static final String FEATURE_CONTACT = "Contact";
		 public static final String FEATURE_USERMANAGEMENT = "User_Management";
		 public static final String FEATURE_LOGSGENERATION = "Logs_Generation";
		 public static final String FEATURE_WORKSPACE = "Workspace";
		 public static final String FEATURE_ROLEMANAGEMENT = "Role_Management";


	 }
//	  public static final String FEATURE_WORKSPACE = "workspace";
//	  public static final String FEATURE_AUDIT = "audit";
	  
	
	public static class Slices{
		public static String FIRST_SLICE = "firstslices";
		public static String SECOND_SLICE = "secondslices";
		public static String THIRD_SLICE = "thirdslices";
		public static String FOUTRH_SLICE = "fourthslices";
		public static final String FIFTHSLICES = "fifthslices";
	}
	
} 
