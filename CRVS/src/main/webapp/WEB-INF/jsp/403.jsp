<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<jsp:include page="fragments/headTag.jsp"/>

<body>
<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">
			<div class="container-fluid text-center mar-top-15">
    <spring:url value="/resources/images/oops.jpg" var="exceptionImage"/>
    <img src="${exceptionImage}"/>

    <h2>Oops !!! Looks like You don't have permission to access on this server</h2>
    <h4>Contact the Admin. if you may need any further assistance.</h4>

</div>

    <jsp:include page="fragments/footer.jsp"/>

</div></div>
</body>

</html>