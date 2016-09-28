package org.sdrc.crvs.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ErrorTagHandler extends SimpleTagSupport {
	
	private String message;
	private List<String> errorList;
	private String cssInfClass;
	private String id;
	
	

	StringWriter sw=new StringWriter();
	
	public void doTag() throws JspException, IOException{
		JspWriter writer=getJspContext().getOut();
		writer.println("<div id='"+id+"' style='height: auto;' >");
		if(errorList!=null && !errorList.isEmpty()){
			/* Use errors from attribute*/
			writer.println("<div  class='"+cssInfClass+"'> <button type='button' class='close' data-dismiss='alert'>&times;</button>");
			for(String error:errorList){
				
				writer.println(error);
			}
			writer.println("</div>");
		}else{
			/* use message from the body */
			getJspBody().invoke(sw);
			getJspContext().getOut().println(sw.toString());
		}
		writer.println("</div>");
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<String> getErrorList() {
		return errorList;
	}

	public void setErrorList(List<String> errorList) {
		this.errorList = errorList;
	}

	public String getCssInfClass() {
		return cssInfClass;
	}

	public void setCssInfClass(String cssInfClass) {
		this.cssInfClass = cssInfClass;
	}
	
	
}
