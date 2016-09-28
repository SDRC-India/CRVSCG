<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="serror" uri="/WEB-INF/ErrorDescripter.tld"%>
<%@ page import="org.sdrc.crvs.util.Constants"%>
<html lang="en">

<jsp:include page="fragments/headTag.jsp" />
<%!String role;%>
<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />

		<spring:url value="/resources/images/blank_photo1.png"
			htmlEscape="true" var="BlankPhoto" />
		<div class="content">

			<div class="container-fluid">
				<h2 class="page-header">Photographs</h2>
				<serror:Error errorList="${formSuccess}"
					cssInfClass="alert alert-success">
				</serror:Error>
				<serror:Error errorList="${formErrors}"
					cssInfClass="alert alert-danger">
				</serror:Error>
				<div class="modal fade bs-example-modal-sm" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" aria-hidden="true" data-dismiss="modal"
									type="button">×</button>
								<h4 id="mySmallModalLabel" class="modal-title">Upload
									Photos</h4>
							</div>
							<form:form method="post" enctype="multipart/form-data"
								modelAttribute="uploadedFile" action="photographupload">
								<input type="file" name="file" multiple="multiple"
									id="photo_upload" required="required" />
								<form:errors path="file" />
								<input type="submit" value="Upload" class="btn btn-primary"
									id="upload" />
							</form:form>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-10">
						<div id="links" style="display: inline">
							<c:forEach items="${allfiles}" var="filename">
								<a href="uploaded_files/PHOTO/${filename.getName()}"
									data-gallery> <img alt="${filename.getName()}"
									src="uploaded_files/PHOTO/${filename.getName()}"
									title="${filename.getName()}" width="20%" /></a>
							</c:forEach>
						</div>
						<div id="blueimp-gallery" class="blueimp-gallery">
							<div class="slides"></div>
							<h3 class="title"></h3>
							<a class="prev">&lt;</a> <a class="next">&gt;</a> <a
								class="close">×</a> <a class="play-pause"></a>
							<ol class="indicator"></ol>
							<!-- The modal dialog, which will be used to wrap the lightbox content -->
							<div class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" aria-hidden="true">&times;</button>
											<h4 class="modal-title"></h4>
										</div>
										<div class="modal-body next"></div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default pull-left prev">
												<i class="glyphicon glyphicon-chevron-left"></i> Previous
											</button>
											<button type="button" class="btn btn-primary next">
												Next <i class="glyphicon glyphicon-chevron-right"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="pull-right">
							<button class="btn btn-primary" data-toggle="modal"
								data-target=".bs-example-modal-sm" id="uploadppt">
								<i class="fa fa-lg fa-cloud-upload"></i>Upload New
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />

</body>

</html>
