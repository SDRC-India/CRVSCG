<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="org.sdrc.crvs.util.Constants"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<jsp:include page="fragments/headTag.jsp" />
<body>
	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />

		<div class="content">
			<section id="banner">
				<div id="carousel-banner-slide" class="carousel slide"
					data-ride="carousel">

					<div class="carousel-inner">
						<div class="item active">
							<img alt="Placeholder1" src="resources/images/slide_1.jpg"
								class="img-responsive" width="100%">
						</div>
						<div class="item">
							<img alt="Placeholder2" src="resources/images/slide_2.jpg"
								class="img-responsive" width="100%">
						</div>
						<div class="item">
							<img alt="Placeholder3" src="resources/images/slide_3.jpg"
								class="img-responsive" width="100%">
						</div>
						<div class="item">
							<img alt="Placeholder4" src="resources/images/slide_4.jpg"
								class="img-responsive" width="100%">
						</div>
<!-- 						<div class="item"> -->
<!-- 							<img alt="evm_bg" src="resources/images/banner3_400.jpg" -->
<!-- 								class="img-responsive" width="100%"> -->
<!-- 						</div> -->
<!-- 						<div class="item"> -->
<!-- 							<img alt="evm_bg" src="resources/images/banner5_400.jpg" -->
<!-- 								class="img-responsive" width="100%"> -->
<!-- 						</div> -->
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-banner-slide"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel-banner-slide"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</section>
			<div class="content ">

				<!-- 				<section id="EVM_site_menu"> -->
				<!-- 					<div class="container-fluid"> -->
				<!-- 						<h3> -->
				<!-- 							<i class="fa fa-arrow-circle-o-right fa-lg"></i>EVM Site Menu -->
				<!-- 						</h3> -->
				<div class="row">
					<!-- 							<div class="col-md-3 text-center"> -->
					<!-- 								<a href="about"> -->
					<!-- 									<div class="site_menu"> -->
					<!-- 										<i class="fa fa-info-circle fa-3x"></i> -->
					<!-- 									</div> -->
					<!-- 								</a> <a href="about"><h4>About EVM</h4></a> -->
					<!-- 							</div> -->
					<!-- 							<div class="col-md-3 text-center"> -->
					<!-- 								<a href="resource"> -->
					<!-- 									<div class="site_menu"> -->
					<!-- 										<i class="fa fa-files-o fa-3x"></i> -->
					<!-- 									</div> -->
					<!-- 								</a><a href="resource"> -->


					<!-- 									<h4>Resources</h4> -->
					<!-- 								</a> -->

					<!-- 							</div> -->
					<!-- 							<div class="col-md-3 text-center"> -->
					<!-- 								<a href="sops"> -->
					<!-- 									<div class="site_menu"> -->
					<!-- 										<i class="fa fa-bars fa-3x "></i> -->
					<!-- 									</div> -->
					<!-- 								</a> <a href="sops"> -->
					<!-- 									<h4>SOPs</h4> -->
					<!-- 								</a> -->
					<!-- 							</div> -->
					<!-- 							<div class="col-md-3 text-center"> -->
					<!-- 								<a href="tools"> -->
					<!-- 									<div class="site_menu"> -->
					<!-- 										<i class="fa fa-gears fa-3x"></i> -->
					<!-- 									</div> -->
					<!-- 								</a> <a href="tools"> -->
					<!-- 									<h4>Tools</h4> -->
					<!-- 								</a> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 				</section> -->
					<section id="devinfo_section">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-4 text-center">
									<h4 class="mar-bot-15">
										<i class="fa fa-file-text fa-2x evm-font-blue"></i>GALLERY
									</h4>
									<a
										href="http://prod1.sdrc.co.in/crvs/libraries/aspx/Gallery.aspx"
										target="_blank"><img
										alt="factsheets" class="img-responsive"
										src="resources/images/crvs_gallery_nw.png"></a>
								</div>
								<div class="col-md-4 text-center">
									<h4>
										<i class="fa fa-hand-o-up fa-2x evm-font-blue"></i>DASHBOARD
									</h4>
									<a href="dashboard"><img alt="dashboard"  
										src="resources/images/CRVS_map_nw.png"></a>
								</div>
								<div class="col-md-4 text-center">
									<h4>
										<i class="fa fa-align-left fa-2x evm-font-blue"></i>DEVINFO
									</h4>
									<a
										href="http://prod1.sdrc.co.in/crvs/libraries/aspx/home.aspx"
										target="_blank" title="www.devinfo.org"><img alt="di" class="img-responsive"
										src="resources/images/crvs_devinfo_nw.png"></a>
								</div>
							</div>
						</div>
					</section>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
