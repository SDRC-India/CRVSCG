<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html lang="en">

<jsp:include page="fragments/headTag.jsp" />

<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">
			<div class="container-fluid">
				<h2 class="page-header">demo</h2>
				<p class="about_line-height" id="about_para">Samiksha is a state-wide
							monitoring mechanism used by the department of school and mass
							education (DSME) to track access to elementary education in
							Odisha. The system captures data from around 40 thousand schools
							collected every month by 5000 cluster resource coordinators (CRC)
							using data collection formats and reports progress across 44
							indicators spread over six themes :</p>
						<ul class="about_lists">
							<li>School Environment</li>
							<li>Curricular Programme</li>
							<li>Co-curricular Programme</li>
							<li>School-Community Linkage</li>
							<li>School Management</li>
							<li>Mid-Day Meal</li>
						</ul><div class="pull-right">
						<img src="resources/images/about_img.jpg" alt="about_img" class="img-responsive">
						</div>
						<p class="about_line-height" id="about_para">In addition, a quarterly assessment known as continuous and comprehensive evaluation (CCE) is also undertaken at the elementary stage. CCE data collection format involves assessment of the children on curricular (language and mathematics), extra-curricular (physical education, scientific skills, arts etc.), and socio-personal qualities.
						
						</p>
			</div>
		</div>
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
