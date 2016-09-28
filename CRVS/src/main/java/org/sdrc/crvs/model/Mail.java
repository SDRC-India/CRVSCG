package org.sdrc.crvs.model;

public class Mail {
	private StringBuffer fromUserName;
	private String toUserName;
	private String toEmailId;
	private String cc;
	private StringBuffer subject;
	private StringBuffer msg;
	

	public StringBuffer getFromUserName() {
		return fromUserName;
	}
	public void setFromUserName(StringBuffer fromUserName) {
		this.fromUserName = fromUserName;
	}
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	public String getToEmailId() {
		return toEmailId;
	}
	public void setToEmailId(String toEmailId) {
		this.toEmailId = toEmailId;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public StringBuffer getSubject() {
		return subject;
	}
	public void setSubject(StringBuffer subject) {
		this.subject = subject;
	}
	public StringBuffer getMsg() {
		return msg;
	}
	public void setMsg(StringBuffer msg) {
		this.msg = msg;
	}

}
