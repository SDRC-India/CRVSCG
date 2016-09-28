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
					<h2 class="page-header">Gallery</h2>
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div id="carousel-banner-slide" class="carousel slide"
							data-ride="carousel">

							<div class="carousel-inner">
								<div class="item active">
									<img alt="evm-gallry-image" src="resources/images/10.jpg"
										class="img-responsive">
									<div class="carousel-caption">
										<h4>EVM BIHAR</h4>
										<p>First Slide</p>
									</div>
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/11.jpg"
										class="img-responsive">
									<div class="carousel-caption">
										<h4>EVM BIHAR</h4>
										<p>Second Slide</p>
									</div>
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/12.jpg"
										class="img-responsive">
									<div class="carousel-caption">
										<h4>EVM BIHAR</h4>
										<p>Third Slide</p>
									</div>
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/13.jpg"
										class="img-responsive">
									<div class="carousel-caption">
										<h4>EVM BIHAR</h4>
										<p>Four Slide</p>
									</div>
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/14.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/15.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/16.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/17.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/18.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/19.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/2.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/20.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/3.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/4.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/8.jpg"
										class="img-responsive">
								</div>
								<div class="item">
									<img alt="evm-gallry-image" src="resources/images/9.jpg"
										class="img-responsive">
								</div>



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
					</div>
				</div>
			</section>


		</div>
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
