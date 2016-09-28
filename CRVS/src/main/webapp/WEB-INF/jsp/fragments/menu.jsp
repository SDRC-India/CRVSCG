<%@page import="org.apache.catalina.connector.Request"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="org.sdrc.crvs.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<button class="navbar-toggle" data-toggle="collapse"
	data-target=".navHeaderCollapse2">
	<span class="icon-bar"></span> <span class="icon-bar"></span> <span
		class="icon-bar"></span>
</button>
<div
	class="collapse navbar-collapse navHeaderCollapse2 pull-left navbar-width min-height300">
	<ul class="nav navbar-nav navbar-left samikshya-main-nav">
		<li><a
			class="<%=request.getRequestURI().contains("welcome") ? "menu-active"
					: ""%>"
			href="<spring:url value="/" htmlEscape="true" />"
			style="padding-left: 0px"> Home </a></li>


		<li><a
			class="<%=request.getRequestURI().contains("about") ? "menu-active"
					: ""%>"
			href="<spring:url value="/about" htmlEscape="true" />"> About </a></li>
		<!--  <li><a -->
		<%-- 			class="<%=request.getRequestURI().contains("") ? "menu-active" --%>
		<%-- 					: ""%>" --%>
		<%-- 			href="<spring:url value="" htmlEscape="true" />"> Dataentry </a></li> --%>


		<li><a
			class="<%=request.getRequestURI().contains("source") ? "menu-active"
					: ""%>"
			href="<spring:url value="source" htmlEscape="true" />"> Resources
		</a></li>

		<li><a
			class="<%=request.getRequestURI().contains("dashboard") ? "menu-active"
					: ""%>"
			href="<spring:url value="dashboard" htmlEscape="true" />">
				Dashboard </a></li>
	</ul>
	<div class="pull-right">
		<form class="navbar-form navbar-right searchform" role="search"
			action="gcsearch" method="post">
			<input class="form-control" type="text" placeholder="Enter Keyword"
				name="search">
			<button type="submit" class="btn btn-sm mainnav-form-btn">
				<i class="fa fa-lg fa-search ripas_blue"></i>
			</button>
		</form>
	</div>
</div>


