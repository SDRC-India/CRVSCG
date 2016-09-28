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
				<h2 class="page-header evm-font-blue">Resources</h2>
				<div class="row source-page">
					
					 <div class="inner-page-title">
          				<h2>1. Weblinks</h2>
        			</div>
					<table class="table table-responsive table-striped factsheet">
            <thead>
              <tr>
                <th>Title</th>
                <th style="width:34%;">Weblink</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td> Act and Rule</td>
                <td><a href="http://crsorgi.gov.in/annual-report.html" target="_blank">
                <i class="fa fa-external-link evm-font-blue icon-resource"></i></a></td>
              </tr>
             <tr>
                <td> Annual report</td>
                <td><a href="http://descg.gov.in/cgcrs/RBDActRulesE.aspx" target="_blank">
                <i class="fa fa-external-link evm-font-blue icon-resource"></i></a>
                </td>
              </tr>
              </tbody>
              </table>
					
					
					<div class="inner-page-title">
          				<h2>2. USER GUIDES  &amp; Manual</h2>
        			</div>
					<table class="table table-responsive table-striped">
							<tr>
								<th>Resource Details</th>
								
								<th>Download</th>
							</tr>
							<tr>
								<td>CRVS Training Manual</td>
								
								<td><a
									href="http://crsorgi.gov.in/web/uploads/download/CRS_mannual_Hindi_English.pdf" download>
											<i class="fa fa-download evm-font-blue  icon-resource"></i>
										</a></td>
							</tr>
							
						</table>				
			</div>

		</div>
	</div>
	<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
