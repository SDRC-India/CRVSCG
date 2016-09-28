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
					<h2 class="page-header">FAQ's</h2>

					<div class="col-md-8 mar-top-15">

						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"> <span
											class="glyphicon glyphicon-plus"></span>I am trying to
											install the EVM apk but am unable to do so. What could be the
											reason?
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Check for any instances of ODK Collect that are
											installed on the device. If ODK Collect is already installed,
											then you will not be able to install EVM.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"> <span
											class="glyphicon glyphicon-plus"></span>I have ODK Collect
											installed on my device. Can i use it for data collection?
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Yes. You may use the generic ODK Collect application.
											You need to provide the server configuration details to
											enable downloading the forms and pushing data to the server.
											Follow instructions in the user manual.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseFour"> <span
											class="glyphicon glyphicon-plus"></span>I have manually
											copied the xml data entry forms onto the device and completed
											data entry. I am getting error message while submitting data.
										</a>
									</h4>
								</div>
								<div id="collapseFour" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Please check if you have provided the correct
											credentials (server name, user name, password, etc).</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseFive"> <span
											class="glyphicon glyphicon-plus"></span>My android phone got
											reset to factory settings. From where can I download the
											installer file?
										</a>
									</h4>
								</div>
								<div id="collapseFive" class="panel-collapse collapse">
									<div class="panel-body">
										<p>
											You can download the EVM apk installer (<a
												href="resources/applications/EVM Collect.apk"
												download="resources/applications/EVM Collect.apk"
												title="click to download EVM Collect.apk">EVM Collection
												Android APK</a>) from the "Tools" section of the website. Follow
											instruction in the user manual to install.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseSix"> <span
											class="glyphicon glyphicon-plus"></span>Why I am unable to
											connect to the server?
										</a>
									</h4>
								</div>
								<div id="collapseSix" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Check whether the data connection is enabled in the
											phone and internet is available. Check the application
											credentials are correctly set.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseSeven"> <span
											class="glyphicon glyphicon-plus"></span>Why I am unable to
											download the forms from the server?
										</a>
									</h4>
								</div>
								<div id="collapseSeven" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Check whether the data connection is enabled in the
											phone and internet is available.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseEight"> <span
											class="glyphicon glyphicon-plus"></span>Why I am unable to
											send finalized form to server?
										</a>
									</h4>
								</div>
								<div id="collapseEight" class="panel-collapse collapse">
									<div class="panel-body">
										<p>
											Check whether the data connection is enabled in the phone and
											internet is available. Check the application credentials are
											correctly set. If still unable to send the data then, mail us
											the "odk" zipped folder with the name of the facility for
											which you want to send data to server to email id: <a
												href="mailto:evmsupport@sdrc.co.in?Subject=Hello"
												target="_top">evmsupport@sdrc.co.in</a>
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseNine"> <span
											class="glyphicon glyphicon-plus"></span>Why GPS is not
											recording the location address?
										</a>
									</h4>
								</div>
								<div id="collapseNine" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Try reading GPS under clear sky (e.g. outside of
											facility building).Check whether the GPS feature is enabled
											in the phone If GPS feature is enabled, manually set GPS
											configuration in the phone setting.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTen"> <span
											class="glyphicon glyphicon-plus"></span>What is the
											"Accuracy" range to which to which GPS is to be recorded?
										</a>
									</h4>
								</div>
								<div id="collapseTen" class="panel-collapse collapse">
									<div class="panel-body">
										<p>GPS feature automatically records location reading if
											Accuracy range comes below 5m. If it does not record location
											address automatically then, manually record it when Accuracy
											gives range of as less as possible (maximum of 20m).</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseEleven"> <span
											class="glyphicon glyphicon-plus"></span>Can I use the EVM
											data collection application on my personal phone?
										</a>
									</h4>
								</div>
								<div id="collapseEleven" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Yes, If you have an android device it can be installed
											on your personal phone.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwelve"> <span
											class="glyphicon glyphicon-plus"></span>My device has become
											unresponsive or crashed while I was collecting data. What
											should I do?
										</a>
									</h4>
								</div>
								<div id="collapseTwelve" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Restart the phone and check the problem still exists or
											not. If the problem still exists then please uninstall the
											EVM Application and re-install it. Provide the necessary
											credentials and start using the application.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThirteen"> <span
											class="glyphicon glyphicon-plus"></span>I do not have network
											coverage on my device. How do I send data to the server?
										</a>
									</h4>
								</div>
								<div id="collapseThirteen" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Ensure that the name of the form name is modified and
											the "Auto send with network" box is checked in "General
											settings". If still the problem persists then mail the
											"odk.zip" folder.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseForteen"> <span
											class="glyphicon glyphicon-plus"></span>What should be the
											ideal size of the image that I should be sending?
										</a>
									</h4>
								</div>
								<div id="collapseForteen" class="panel-collapse collapse">
									<div class="panel-body">
										<p>Set the camera to the lowest resolution.</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseFifteen"> <span
											class="glyphicon glyphicon-plus"></span> I have provided
											answer for a question but now I want to unselect the response
											and skip that question as blank. How to do this?
										</a>
									</h4>
								</div>
								<div id="collapseFifteen" class="panel-collapse collapse">
									<div class="panel-body">
										<p>To remove any response, hold on the screen for some
											seconds and wait for the "Remove Response" prompt to appear.</p>
									</div>
								</div>
							</div>
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
