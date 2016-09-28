<!DOCTYPE html>

<%@page import="java.util.ResourceBundle"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html lang="en">

<jsp:include page="fragments/headTag.jsp" />

<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">
			<div class="container-fluid">
				<h2 class="page-header">Search Results</h2>
				<div>
					<script src="https://www.google.com/jsapi"></script>
					<script src="http://www.google.com/jsapi" type="text/javascript"></script>
					<script type="text/javascript">
						function parseQueryFromUrl() {
							var queryParamName = "q";
							var search = window.location.search.substr(1);
							var parts = search.split('&');
							for (var i = 0; i < parts.length; i++) {
								var keyvaluepair = parts[i].split('=');
								if (decodeURIComponent(keyvaluepair[0]) == queryParamName) {
									return decodeURIComponent(keyvaluepair[1]
											.replace(/\+/g, ' '));
								}
							}
							return '';
						}
						google.load('search', '1', {
							language : 'en',
							style : ""
						});
						google
								.setOnLoadCallback(
										function() {
											var customSearchControl = new google.search.CustomSearchControl(
													'<%= ResourceBundle.getBundle("spring/app").getString("gcs_key")%>');
											customSearchControl
													.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
											var options = new google.search.DrawOptions();
											options.enableSearchResultsOnly();
											customSearchControl.draw('cse',
													options);
											var queryFromUrl = parseQueryFromUrl();
											if (queryFromUrl) {
												customSearchControl
														.execute(queryFromUrl);
											}
										}, true);
					</script>
					<div id="cse" style="width: 100%;">Loading...</div>



				</div>
			</div>
		</div>
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>
