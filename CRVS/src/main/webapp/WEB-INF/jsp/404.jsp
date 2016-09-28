<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<jsp:include page="fragments/headTag.jsp"/>

<body>
<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">
			<div class="container-fluid">
    <spring:url value="/resources/images/exception.png" var="petsImage"/>
    <img src="${petsImage}"/>

    <h2>Oops !!! Looks like the page you are looking for is missing ...</h2>
    <h4>Please ensure that the URL is correct or contact the Admin. if you may need any further assistance.</h4>

</div>

    <jsp:include page="fragments/footer.jsp"/>

</div></div>
</body>

</html>
