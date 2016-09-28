<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import = "java.util.ResourceBundle" %>

<!--
crvs :: a Spring Framework demonstration
-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<link rel="shortcut icon" type="image/png" href="resources/images/favicon.ico"/>
<title>CRVS</title>
<%
	ResourceBundle resource = ResourceBundle.getBundle("spring/app");
%>
<spring:url value="/webjars/bootstrap/3.1.1/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/resources/css/datepicker.css"
	var="bootstrapCss_datepick" />
<link href="${bootstrapCss_datepick}" rel="stylesheet" />

<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300'
	rel='stylesheet' type='text/css'>

<spring:url value="/webjars/font-awesome/4.0.3/css/font-awesome.min.css"
	var="fontawesomeCss" />
<link href="${fontawesomeCss}" rel="stylesheet" />

<spring:url
	value="/webjars/angular-loading-bar/0.4.3/loading-bar.min.css"
	var="loadingbarmincss" />
<link href="${loadingbarmincss}" rel="stylesheet"></link>

<spring:url value="/resources/css/style.css" var="styleCss" />
<link href="${styleCss}" rel="stylesheet" />

<!-- jquery-ui.css file is not that big so we can afford to load it -->
<spring:url value="/webjars/jquery-ui/1.10.3/themes/base/jquery-ui.css"
	var="jQueryUiCss" />
<link href="${jQueryUiCss}" rel="stylesheet"></link>
<!-- added for photo gallery -->
<link rel="stylesheet" href="resources/css/blueimp-gallery.min.css">

<!-- Only Jquery added for certain wireups donot move it to footer rest of  -->
<spring:url value="/webjars/jquery/2.0.3/jquery.min.js" var="jQuery" />
<script src="${jQuery}"></script>
<script>
var rootURL = '<%=(String)resource.getObject("root_url") %>' ;
</script>
</head>