<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.sdrc.crvs.util.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/images/bilogo.png"
	var="bilogo" />
<!-- Top bar -->

<header class="navbar-static-top bar" id="head1">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="./"> 
			<img alt="evm_logo"
				src="resources/images/crvs_logo1.png" class="img-responsive img-height" style="margin-left: -3%">
					
				
			</a>
		</div>
				<ul class="nav navbar-nav navbar-right evm-nav">
					<li><a class="" href="http://prod1.sdrc.co.in/crvs/libraries/aspx/ContactUs.aspx?T=C&PN=diorg/di_contacts.html" target="_blank"> <i
							class="fa fa-lg fa-envelope-o"> </i> Contact
					</a></li>
				</ul>
	</div>

</header>
<!-- END Top Bar	 -->
<div class="navbar navbar-default navbar-static-top bar menu" id="head2">
	<div class="container-fluid">
		<jsp:include page="menu.jsp" />
	</div>
</div>