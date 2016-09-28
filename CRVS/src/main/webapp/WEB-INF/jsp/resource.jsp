<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="serror" uri="/WEB-INF/ErrorDescripter.tld"%>
<%@ page import="org.sdrc.crvs.util.Constants"%>
<html lang="en">
<jsp:include page="fragments/headTag.jsp" />
<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">

			<section>
				<div class="container-fluid ">
					<h2 class="page-header evm-font-blue">Resources</h2>
					<div class="col-md-6">
						<serror:Error errorList="${formSuccess}"
							cssInfClass="alert alert-success">
						</serror:Error>
						<serror:Error errorList="${formErrors}"
							cssInfClass="alert alert-danger">
						</serror:Error>
						<h4 class="evm-gray">EVM background and training resources</h4>
						<table class="table table-condensed">
							<tr>
								<th>Resource Details</th>
								<th>Description</th>
								<th>Download</th>
							</tr>
							<tr>
								<td>EVM field assessor training materials zip, 19.73Mb</td>
								<td>Presentations and practical exercises on the EVM
									criteria in English</td>
								<td><a
									href="http://www.who.int/entity/immunization/programmes_systems/supply_chain/effective_vaccine_management_criteria.zip?ua=1"><h3>
											<i class="fa fa-download evm-font-blue  "></i>
										</h3></a></td>
							</tr>
							<tr>
								<td>EVM background pdf, 620kb</td>
								<td>The principles and approach of the EVM initiative.</td>
								<td><a
									href="http://www.who.int/entity/immunization/programmes_systems/supply_chain/EVM-background.pdf?ua=1"
									target="_blank"><h3>
											<i class="fa fa-download evm-font-blue  "></i>
										</h3></a></td>
							</tr>
							<tr>
								<td>EVM introduction pdf, 874kb</td>
								<td>The EVM process from start to finish.</td>
								<td><a
									href="http://www.who.int/immunization/programmes_systems/supply_chain/EVM-Introduction.pdf?ua=1"
									target="_blank"><h3>
											<i class="fa fa-download evm-font-blue  "></i>
										</h3></a></td>
							</tr>
							<tr>
								<td>EVM Master questionnaire for training and reference
									pdf, 532kb</td>
								<td>EVM Master questionnaire, formatted for easy printing
									and reading. This master questionnaire is to be used in EVM
									training courses.</td>
								<td><a
									href="http://www.who.int/immunization/programmes_systems/supply_chain/Training_MasterFile_EN.pdf?ua=1"
									target="_blank"><h3>
											<i class="fa fa-download evm-font-blue  "></i>
										</h3></a></td>
							</tr>
							<tr>
								<td>EVM tips and lessons learned pdf, 3.06Mb</td>
								<td>Tips and lessons learned from past EVM assessments.</td>
								<td><a
									href="http://www.who.int/entity/immunization/programmes_systems/supply_chain/EVM-Tips-lessons.pdf?ua=1"
									target="_blank"><h3>
											<i class="fa fa-download evm-font-blue  "></i>
										</h3></a></td>
							</tr>
							<c:forEach items="${resourcesList}" var="resources">
								<%-- 							<c:set var="string" value="${fn:split(resources, '.')}" /> --%>
								<tr>
									<td>${resources}</td>
									<td>N/A</td>
									<td><c:set var="name" value="${resources}" /> <c:if
											test="${fn:endsWith(name,'pdf') || fn:endsWith(name,'PDF')}">
										</c:if> <c:set var="name" value="${factsheet}" /> <c:if
											test="${fn:endsWith(name,'xls') || fn:endsWith(name,'XLS') || fn:endsWith(name,'xlsx') || fn:endsWith(name,'XLSX')}">
										</c:if> <c:set var="name" value="${factsheet}" /> <c:if
											test="${fn:endsWith(name,'docx') || fn:endsWith(name,'DOCX') || fn:endsWith(name,'doc') || fn:endsWith(name,'DOC')}">
										</c:if> <a title="click to download ${resources}"
										download="${resources}"
										href="resources/RESOURCES/${resources}"><h3>
												<i class="fa fa-download evm-font-blue"></i>
											</h3></a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target=".modal">
									<i class="fa fa-lg fa-cloud-upload"></i>Upload New
								</button>
							</div>


							<div class="modal fade" tabindex="-1" role="dialog"
								aria-labelledby="mySmallModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button class="close" aria-hidden="true" data-dismiss="modal"
												type="button">×</button>
											<h4 id="mySmallModalLabel" class="modal-title">Select
												File(s)</h4>
										</div>
										<form:form method="POST" commandName="uploadedFile"
											enctype="multipart/form-data" action="resourceUpload">
											<input type="file" name="file" multiple="multiple"
												required="required" />
											<input type="submit" value="Upload" class="btn btn-primary"
												id="upload" />
										</form:form>
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
