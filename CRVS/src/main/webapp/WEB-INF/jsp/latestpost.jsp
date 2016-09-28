<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<jsp:include page="fragments/headTag.jsp" />
<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">

			<section id="gallery">
				<div class="container-fluid ">
					<h2 class="page-header">Latest Posts</h2>
				</div>
			</section>


		</div>
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
