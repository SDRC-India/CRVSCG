<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.StringWriter"%>

<html lang="en">
<jsp:include page="fragments/headTag.jsp"/>

<body>
<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">
			<div class="container-fluid">
    <spring:url value="/resources/images/exception.png" var="petsImage"/>
    <img src="${petsImage}"/>

    <h2>Oops !!! Looks like you are caught in a wrong place ...</h2>
    <h4>Please try again in sometime, while we are fixing this up.</h4>

    <p>${exception.message}</p>

	<%Logger logger = Logger.getLogger(Exception.class);
	
	RuntimeException rte = (RuntimeException)(request.getAttribute("exception"));
	StackTraceElement[] stes = rte != null ? rte.getStackTrace() : null;
	
	if(stes != null && stes.length >0){
		
		 StringWriter stringWritter = new StringWriter();
	     PrintWriter printWritter = new PrintWriter(stringWritter, true);
	     ((RuntimeException)(request.getAttribute("exception"))).printStackTrace(printWritter);
	     printWritter.flush();
	     stringWritter.flush(); 
		
	     logger.error("An exception occourred , Stack Trace :" + stringWritter.toString());
	     
// 		logger.error(((RuntimeException)(request.getAttribute("exception"))).printStackTrace(logger));
// 		for(StackTraceElement ste : stes)
// 		logger.error(ste);
	}%>
    <!-- Exception: ${exception.message}.
		  	<c:forEach items="${exception.stackTrace}" var="stackTrace"> 
				${stackTrace} 
			</c:forEach>
	  	-->
</div>

    <jsp:include page="fragments/footer.jsp"/>

</div></div>
</body>

</html>
