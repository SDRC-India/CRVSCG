<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<footer class="navbar navbar-default"  id="foot">
<!-- 	<section class="bottomfooter"> -->
<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 text-left">
				<span class="footerfont">Supported by &nbsp;</span><a
					href="http://www.unicef.org/" target="_blank"
					class="text_deco_none"><img
					src="resources/images/Unicef_logo.png" alt="unicef_logo"
					class="unicef_img"> </a>
			</div>
			<div class="col-md-6 text-center"></div>
			
			<div class="col-md-3 text-right">
				<span class="footerfont">Powered by </span><a href="http://sdrc.co.in/"
					target="_blank" class="text_deco_none"><span
					class="poweredbysdrc">SDRC</span></a>
			</div>
		</div>
		</div>
	

<!-- 	</section> -->

</footer>






<!-- Keep your java scripts down bellow -->


<!-- jquery-ui.js file is really big so we only load what we need instead of loading everything -->
<spring:url value="/webjars/jquery-ui/1.10.3/ui/jquery.ui.core.js"
	var="jQueryUiCore" />
<script src="${jQueryUiCore}"></script>

<spring:url value="/webjars/bootstrap/3.1.1/js/bootstrap.min.js"
	var="bootstrapjs" />
<script src="${bootstrapjs}"></script>

<script src="resources/js/topojson.v1.min.js"></script>

<script src="resources/js/html2canvas.js"></script>

<!--  Site specific scripts down bellow -->

<script src="resources/js/sdrc.export.js"></script>

<script src="resources/js/bootstrap-datepicker.js"></script>

<script src="resources/js/core.js"></script>

<script src="resources/js/blueimp.gallery.min.js"></script>
<script src="resources/js/bootstrapimage.gallery.js"></script>
