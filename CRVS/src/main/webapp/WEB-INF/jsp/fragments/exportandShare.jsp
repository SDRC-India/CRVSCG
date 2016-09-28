<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="org.sdrc.crvs.model.Mail"%>
<div class="exportshare-section">

	<button id="pdfDownloadBtn" class="btn btn-default btn-sm"
		type="button"
		data-html2canvas-ignore="true" ng-class="{'disabled': utdata.dataCollection.length == 0 || utdata.length == 0 || disablePdf}">
		<i class="fa fa-lg fa-download"></i> PDF
	</button>
	<button id="shareBtn" class="btn btn-default btn-sm" type="button"
		  data-toggle="modal" data-target="#shareModal"
		data-html2canvas-ignore="true" >
		<i class="fa fa-lg fa-share"></i>Share
	</button>
	<button id="excelDownloadBtn" class="btn btn-default btn-sm"
		type="button" ng-click='downloadExcel()'
		data-html2canvas-ignore="true" ng-class="{'disabled': utdata.dataCollection.length == 0 || utdata.length == 0 || disablePdf}">
		<i class="fa fa-lg fa-arrow-circle-down"></i>Excel
	</button>
	
<form id="exportForm" method="post">
		<input type="hidden" name="imgPath" id="imgPath" /> 
		<input type="hidden" name="imageTopBottomBase64" id="imageTopBottomBase64" /> 
		<input type="hidden" name="imageLegendBase64" id="imageLegendBase64" /> 
		<input type="hidden" name="areaId" value="${param.areaId}" id="areaId" /> 
		<input type="hidden" name="indicatorId" value="${param.indicatorId}" id="indicatorId" /> 
		<input type="hidden" name="timePeriodId" value="${param.timePeriodId}" id="timePeriodId" /> 
		<input type="hidden" name="sourceId" value="${param.sourceId}" id="sourceId"/> 
		<input type="hidden" name="childLevel" value="${param.childAreaLevel}" id="childLevel" /> 
		<input type="hidden" name="area" value="${param.area}" id="area" /> 
		<input type="hidden" name="indicator" value="${param.indicator}" id="indicator" /> 
		<input type="hidden" name="timePeriod" value="${param.timePeriod}" id="timePeriod" /> 
		<input type="hidden" name="source" value="${param.source}" id="source"/> 
		<input type="hidden" name="sectorId" value="${param.sectorId}" id="sectorId" /> 
		<input type="hidden" name="secondTimeperiodId" value="${param.secondTimeperiodId}" id="secondTimeperiodId" /> 
		<input type="hidden" name="secondTimeperiod" value="${param.secondTimeperiod}" id="secondTimeperiod" />
		<input type="hidden" name="sectorName" value="${param.sectorName}" id="sectorName" /> 
		<input type="hidden" name="subSectorName" value="${param.subSectorName}" id="subSectorName" /> 
		<input type="hidden" name="subSectorKey" value="${param.subSectorKey}" id="subSectorKey" /> 
		<input type="hidden" name="granularitySpiderKey" value="${param.granularitySpiderKey}" id="granularitySpiderKey" /> 
		<input type="hidden" name="granularitySpiderValue" value="${param.granularitySpiderValue}" id="granularitySpiderValue" />
	</form>

	<script>
		$(document).ready(
				function() {
					sdrc_export.export_pdf("${param.exportcontainer}",
							"pdfDownloadBtn");
				});
	</script>
</div>



<div class="modal fade" id="shareModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<strong>Share</strong>
				</h4>
			</div>
			<div class="modal-body">
				<div id="email_sec">
					<div id="mail_success"></div>
					<span class="glyphicon glyphicon-envelope env_color"></span> Email
					to(use comma to separate multiple email ids)<br />
					<div class="row">
						<form role="form" method="post" id="mailform">

							<div class="col-sm-8">
								<textarea rows="1" name="toEmailId" class="form-control"
									id="toEmailId" autofocus="autofocus" required="required"></textarea>
								<input name="pageurl" type="hidden" id="dashpageurl"
									value="<%=request.getRequestURL()%>" />
							</div>
							<div class="col-sm-2">
								<button class="btn btn-link" id="mailbutton">
									<i class="fa fa-lg fa-envelope"></i>Mail
								</button>
							</div>
							<div id="loader" class="col-sm-1"></div>
						</form>

					</div>
				</div>
				<div class="mar-bot-15"></div>
				<div id="twitter_sec">
					<i class="fa fa-lg fa-twitter-square twitter_color"></i> Share on
					Twitter<br />
					<div class="row">
						<div class="col-sm-8">
							<textarea rows="2" name="twittershare" class="form-control"
								id="shareittwitter"></textarea>
						</div>
						<div class="col-sm-2">
							<button class="btn btn-link" data-lang="en" onclick="opnWindow()">
								<i class="fa fa-lg fa-twitter"></i>Tweet
							</button>

							<!-- 							<a href="https://twitter.com/intent/tweet?text=You should check this out! - eSamiksha" class="twitter-share-button">Tweet</a> -->
							<script>
								function opnWindow() {
									var tweettext = document
											.getElementById('shareittwitter').value;

									window
											.open(
													"https://twitter.com/intent/tweet?text="
															+ tweettext
															+ "%0D%0A&url="
															+ app
																	.currentStateUrl()
															+ "", "_blank",
													"top=500,left=400,width=500, height=500");
									$("#shareittwitter").val('');
								}
								function opnfbWindow() {
									var fbtext = document
											.getElementById('postitfb').value;
									curnturl = app.currentStateUrl();
									window
											.open(
													"http://www.facebook.com/sharer.php?p[url]="
															+ curnturl + "",
													"_blank",
													"top=500,left=400,width=500, height=500");
									$("#postitfb").val('');
								}
							</script>
						</div>
					</div>
				</div>
				<div class="mar-bot-15"></div>
				<div id="facebook_sec">
					<i class="fa fa-lg fa-facebook-square fb_color"></i> Share on
					Facebook<br />
					<div class="row">
						<div class="col-sm-8">
							<textarea rows="2" name="facebookshare" class="form-control"
								id="postitfb"></textarea>
						</div>
						<div class="col-sm-2">
							<!-- 							<a class="btn btn-primary act" href="" data-lang="en">Post</a> -->
							<button class="btn btn-link" data-lang="en"
								onclick="opnfbWindow()">
								<i class="fa fa-lg fa-facebook"></i>Wall Post
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modal_cancel act"
					data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>
