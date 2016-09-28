<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="serror" uri="/WEB-INF/ErrorDescripter.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="org.sdrc.crvs.util.Constants"%>
<html lang="en">

<jsp:include page="fragments/headTag.jsp" />
<%!String role ; %>
<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div id="fixed-thumb-size-demo" class="default-skin scrollable"
			tabindex="-1">
			<div class="scroll-bar vertical">
				<div class="thumb"></div>
			</div>
			<div class="viewport">

				<div class="overview">

					<div class="container-fluid">
						<h2 class="page-header">Reports</h2>
						<serror:Error errorList="${formSuccess}"
							cssInfClass="alert alert-success">
						</serror:Error>
						<serror:Error errorList="${formErrors}"
							cssInfClass="alert alert-danger">
						</serror:Error>
						<div class="ppts">
							<div class="modal fade bs-example-modal-sm" tabindex="-1"
								role="dialog" aria-labelledby="mySmallModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button class="close" aria-hidden="true" data-dismiss="modal"
												type="button">×</button>
											<h4 id="mySmallModalLabel" class="modal-title">Upload
												Reports</h4>
										</div>
										<form:form method="POST" commandName="uploadedFile"
											enctype="multipart/form-data" action="reportUpload">
											<input type="file" name="file" multiple="multiple"
												required="required" />
											<input type="submit" value="Upload" class="btn btn-primary"
												id="upload" />
										</form:form>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-10">

									<ul class="list-inline">
										<c:forEach items="${allfiles}" var="filename">
											<li><a
												href="<c:out value="uploaded_files/REPORT/${filename.getName()}"/>"
												download="${filename.getName()}"> <c:set var="name"
														value="${filename.getName()}" /> <c:if
														test="${fn:endsWith(name,'doc')}">
														<img src="resources/images/word_document_icon.png">
													</c:if> <c:if test="${fn:endsWith(name,'docx')}">
														<img alt="document_icon" src="resources/images/word_document_icon.png" title="Click to download">
													</c:if>
													<c:if test="${fn:endsWith(name,'pdf')}">
														<img alt="pdf_icon" src="resources/images/pdficon.jpg" title="Click to download">
													</c:if> <c:if test="${fn:endsWith(name,'xls')}">
														<img alt="excel_icon" src="resources/images/excel-icon.jpg" title="Click to download">
													</c:if> <c:if test="${fn:endsWith(name,'xlsx')}">
														<img alt="excel_icon" src="resources/images/excel-icon.jpg" title="Click to download">
													</c:if>
											</a><br /> ${filename.getName()}</li>
										</c:forEach>
									</ul>
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
				</div>
			</div>
		</div>
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>
</html>
