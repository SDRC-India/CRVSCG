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
				<h2 class="page-header evm-font-blue">About</h2>
				<div class="row">
				<div class="col-md-7">
				<p class="about-text">
				Civil registration is defined by the United Nations as the "Universal, 
					continuous, permanent and compulsory recording of vital events provided 
					through decree or regulation in accordance with the legal requirements
					 of each country." (UNSD). It is the act of recording and documenting of 
					 vital events in a person's life (including birth, marriage, divorce,
					  adoption, and death) and is a fundamental function of governments. 
					  </p>
					  <p class="about-text">
					  The civil registry provides individuals with the documentary evidence
					   required to secure recognition of their legal identity, their family
					   relationships, their nationality and their ensuing rights, such as
					   to social protection and inheritance. It can help facilitate access to
					   essential services, such as health, education, and social welfare and
					   can contribute to activities such as gaining formal employment,
					   exercising electoral rights, transferring property, and opening \
					   bank accounts. Unlike other sources of vital statistics, such as 
					   censuses and household surveys, the data from Civil Registration
					    and Vital Statistics (CRVS) systems permit the production of 
					    statistics on population dynamics, health, and inequities in
					     service delivery on a continuous basis for the country as a
					      whole and for local administrative subdivisions. 
					      This provides more accurate information and the 'denominator'
					       for assessing progress with plans across sectors for improving 
					       economic growth and reducing poverty.</p>
				</div>
				<div class="col-md-5">
				<img src="resources/images/about_pix.jpg" class="about-img">
				</div>
					
				</div>

			</div>
		</div>
		
		
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
