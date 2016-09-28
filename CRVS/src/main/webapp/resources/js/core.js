var appURL = rootURL;
var samiksha_progressbar = new function() {
	this.init = function() {

	};
	this.start = function() {

	};
	this.end = function() {

	};
};

$.urlParam = function(name, url) {
	if (!url) {
		url = window.location.href;
	}
	var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(url);
	if (!results) {
		return 0;
	}
	return results[1] || 0;
};

// this strictly for valueobject type collection.
$.getValueFromValueObect = function(keyattr, data) {
	var value = new ValueObject("", "");
	if (!data || !keyattr) {
		return value;
	}
	for (var i = 0; i < data.length; i++) {
		var obj = data[i];

		if (obj.key == keyattr) {
			value = obj;
			break;
		}
	}

	return value;
};

//this strictly for valueobject type collection for indicator.
$.getValueFromValueObectForIndicator = function(keyattr, data) {
	var value = new ValueObject("", "");
	if (!data || !keyattr) {
		return value;
	}
	for (var i = 0; i < data.length; i++) {
		var obj = data[i];

		if (obj.description == keyattr) {
			value = obj;
			break;
		}
	}

	return value;
};

// open close tree structure in workspace
// var isClick = false;
var processStatus = new function() {
	this.requestRunning = false;
	this.startProcess = function() {
		this.requestRunning = true;
	};
	this.endProcess = function() {
		this.requestRunning = false;
	};
};

// All the java script initialization happens here
// Dependency is jquery.
$(document).ready(
		function() {
			samiksha_progressbar.init();
			initLogout();
			// init export functionality
			sdrc_export.init(rootURL);

			// date picker initiation
			$('.input-daterange').datepicker({
				todayBtn : "linked"
			});

			// init presentation view.
			initPresentationView();

			initMailView();

			initShareView();
			
//			tooltip
//			$("[rel=tooltip]").tooltip({ placement: 'bottom',container: '.exportshare-section'});

			// initializing DCF workspace
			initDcfWorkshopView();

			$("#big-image img:eq(0)").nextAll().hide();
			$(".small-images img").click(function(e) {
				var index = $(this).index();
				$("#big-image img").eq(index).show().siblings().hide();
			});

			// navbar fix on top
//			var menu = $('.menu');
//			var origOffsetY = menu.offset().top;
//
//			function scroll() {
//				if ($(window).scrollTop() >= origOffsetY) {
//					$('.menu').removeClass('navbar-static-top').addClass(
//							'navbar-fixed-top');
//					$('#wrapper').addClass('menu-padding');
//				} else {
//					$('.menu').removeClass('navbar-fixed-top').addClass(
//							'navbar-static-top');
//					$('#wrapper').removeClass('menu-padding');
//				}
//
//			}

//			document.onscroll = scroll;

			// accordion open close
			$('.collapse').on(
					'shown.bs.collapse',
					function() {
						$(this).parent().find(".glyphicon-plus").removeClass(
								"glyphicon-plus").addClass("glyphicon-minus");
					}).on(
					'hidden.bs.collapse',
					function() {
						$(this).parent().find(".glyphicon-minus").removeClass(
								"glyphicon-minus").addClass("glyphicon-plus");
					});
		});

// presentation view
function initPresentationView() {

	// upload ppt file initiation
	$("#uploadTrigger").click(function() {
		$("#uploadFile").click();
	});

	// upload message initiation
	$("#message").show().delay(20000).queue(function(n) {
		$(this).hide();
		n();
	});
};

function initDcfWorkshopView() {

	$("#workspace tbody td .toggle-bcf-list")
			.click(
					function(e) {
						if (processStatus.requestRunning) { // don't do anything
							// if an AJAX
							// request is pending
							return;
						}

						// if start
						$imgClass = $(this).closest('tr').find(
								'td .toggle-bcf-list i').attr('class');
						$imgtd = $(this).closest('tr').find(
								'td .toggle-bcf-list i');
						$curRow = $(this).closest('tr');
						$nextTr = $(this).closest('tr').next();
						$nextCspn = $(this).closest('tr').next().find('td')
								.attr('colspan');

						if ($imgClass == 'fa fa-lg fa-plus-square plus') {
							$(this).closest("tr").next().show();
							$imgtd.attr('class',
									'fa fa-lg fa-minus-square plus');
						} else {
							$nextTr.hide();
							$imgtd
									.attr('class',
											'fa fa-lg fa-plus-square plus');
						}
						var newLine = '';

						// alert("rama"+$imgClass);
						if ($imgClass == 'fa fa-lg fa-plus-square plus'
								&& $(this).closest("tr").next().attr('class') != 'fetched') {
							processStatus.startProcess();
							// if next closest row is visible or means new child
							// row added
							var timePeriod = $(this).closest('tr').children(
									'td:eq(3)').text();
							$.ajax({
								url : "getActiveBCF?timePeriod=" + timePeriod,
								success : function(result) {
									processStatus.endProcess();
									newLine = result;
									$newRow = newLine;
									$curRow.after(newLine);
									$imgtd.attr('class',
											'fa fa-lg fa-minus-square plus');
									// $(this).closest("tr").next().attr('class','fetched');

								}
							});
						}
					});
};// end of function

/*
 * send mail
 */

function initMailView() {

	$("#sendMailBtn").click(function() {
		var fromUserName = $('#fromUserName').val();
		var toEmailId = $('#toEmailId').val();
		var toUserName = $('#toUserName').val();
		var cc = $('#cc').val();
		var subject = $('#subject').val();
		var msg = $('#msg').val();
		var json = {
			"fromUserName" : fromUserName,
			"toEmailId" : toEmailId,
			"toUserName" : toUserName,
			"cc" : cc,
			"subject" : subject,
			"msg" : msg
		};
		$.ajax({
			url : $("#mailForm").attr("action"),
			data : JSON.stringify(json),
			type : "POST",
			contentType : 'application/json',
			success : function(mailmsg) {
				$("#mailMsgBox").html(mailmsg.errorMessage);
			}
		});
	});
}

function initLogout() {
	$("#logoutid")
			.click(
					function(e) {
						e.preventDefault();
						$
								.ajax({
									url : "logout",
									success : function(result) {
										document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue="
												+ appURL;
									}
								});
					});
}
/*
 * send dpc mail
 */

function dpcMailFunction(blockcode, districtcode, timeperiod, status, remark) {
	var json = {
		"blockcode" : blockcode,
		"districtcode" : districtcode,
		"timeperiod" : timeperiod,
		"status" : status,
		"remark" : remark
	};
	$.ajax({
		url : 'dpcMail',

		data : JSON.stringify(json),

		type : "POST",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		success : function(mailobj) {

			$('#fromUserName').val(mailobj.fromUserName);
			$('#toEmailId').val(mailobj.toEmailId);
			$('#toUserName').val(mailobj.fromUserName);
			$('#cc').val(mailobj.cc);
			$('#subject').val(mailobj.subject);
			$('#msg').val(mailobj.msg);

			$('#myModal').modal('show');
		}
	});

}

// ptc Mail notification
function ptcMailFunction(areaCode, timePeriod, status, remark, areaName) {
	var json = {
		"areaCode" : areaCode,
		"timePeriod" : timePeriod,
		"status" : status,
		"remark" : remark,
		"areaName" : areaName
	};
	$.ajax({
		url : 'ptcMail',

		data : JSON.stringify(json),

		type : "POST",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		success : function(mailobj) {

			$('#fromUserName').val(mailobj.fromUserName);
			$('#toEmailId').val(mailobj.toEmailId);
			$('#toUserName').val(mailobj.toUserName);
			$('#cc').val(mailobj.cc);
			$('#subject').val(mailobj.subject);
			$('#msg').val(mailobj.msg);

			$('#myModal').modal('show');
		}
	});

}

// init share view
function initShareView() {
	$("#mailbutton")
			.click(
					function() {
						var fromUserName = 'CRVS Chhattisgarh';
						var toUserName = $('#toEmailId').val().split('@')[0];
						var toEmailId = $('#toEmailId').val();
//						var pageUrl = $('#dashpageurl').val();
						var cc = '';
						var subject = 'An interesting web link regarding CRVS Chhattisgarh';
						var msg = 'I am sharing a link below that may be of interest to you:'+'\n'
								   + app.currentStateMailUrl() + '';

						var json = {
							"fromUserName" : fromUserName,
							"toUserName" : toUserName,
							"toEmailId" : toEmailId,
							"cc" : cc,
							"subject" : subject,
							"msg" : msg
						};
						$
								.ajax({
									url : "submitMail",

									data : JSON.stringify(json),

									type : "POST",

									contentType : 'application/json',
									beforeSend : function() {
										$('#loader')
												.html(
														"<img src='resources/images/preloader.gif' />");
									},
									success : function() {
										$('#loader').html("");
										$("#mail_success")
												.html(
														'<div class="alert alert-success alert-dismissible" role="alert">'
																+ ' <button type="button" class="close" data-dismiss="alert">'
																+ '<span aria-hidden="true">&times;</span>'
																+ '<span class="sr-only">Close</span>'
																+ '</button>'
																+ ' Mail sent successfully!'
																+ '</div>');
										$("#toEmailId").val('');
										$( "#mail_success" ).delay(3000).fadeOut(1600);
									}
								});
					});
}

// ptc to brcc Mail notification
function ptcToBrccMailFunction(areaCode, areaName, timePeriod, status, remark) {
	var json = {
		"areaCode" : areaCode,
		"areaName" : areaName,
		"timePeriod" : timePeriod,
		"status" : status,
		"remark" : remark
	};
	$.ajax({
		url : 'ptcToBrccMail',

		data : JSON.stringify(json),

		type : "POST",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		success : function(mailobj) {

			$('#fromUserName').val(mailobj.fromUserName);
			$('#toEmailId').val(mailobj.toEmailId);
			$('#toUserName').val(mailobj.toUserName);
			$('#cc').val(mailobj.cc);
			$('#subject').val(mailobj.subject);
			$('#msg').val(mailobj.msg);

			$('#myModal').modal('show');
		}
	});
}

function ptcWorkshopView() {

	$("#workspacePtc tbody td .toggle-bcf-list")
			.click(
					function(e) {
						if (processStatus.requestRunning) { // don't do anything
							// if an AJAX
							// request is pending
							return;
						}
						// if start
						$imgClass = $(this).closest('tr').find(
								'td .toggle-bcf-list i').attr('class');
						$imgtd = $(this).closest('tr').find(
								'td .toggle-bcf-list i');
						$curRow = $(this).closest('tr');
						$nextTr = $(this).closest('tr').next();
						$nextCspn = $(this).closest('tr').next().find('td')
								.attr('colspan');

						if ($imgClass == 'fa fa-lg fa-plus-square plus') {
							$(this).closest("tr").next().show();
							$imgtd.attr('class',
									'fa fa-lg fa-minus-square plus');
						} else {
							$nextTr.hide();
							$imgtd
									.attr('class',
											'fa fa-lg fa-plus-square plus');
						}
						var newLine = '';

						// alert("rama"+$imgClass);
						if ($imgClass == 'fa fa-lg fa-plus-square plus'
								&& $(this).closest("tr").next().attr('class') != 'fetched') {
							processStatus.startProcess();
							// if next closest row is visible or means new child
							// row added
							var timePeriod = $(this).closest('tr').children(
									'td:eq(3)').text();
							var areaName = $(this).closest('tr').children(
									'td:eq(2)').text();
							$.ajax({
								url : "getBCF?timePeriod=" + timePeriod
										+ "&areaName=" + areaName,
								success : function(result) {
									processStatus.endProcess();
									newLine = result;
									$newRow = newLine;
									$curRow.after(newLine);
									$imgtd.attr('class',
											'fa fa-lg fa-minus-square plus');
									// $(this).closest("tr").next().attr('class','fetched');

								}
							});
						}
					});

}

function initWorkshopView(btnid, count, state, district, form_id) {

	if (processStatus.requestRunning) { // don't do anything
		// if an AJAX
		// request is pending
		return;
	}
	$curRow = $(btnid).closest('tr');
	$nextTr = $curRow.next();
	if ($nextTr.attr('id') != count) {
		$curRow.after("<tr id=" + count
				+ " class=\"fetched\"><td  colspan=\"6\"></td></tr>");
		$
				.ajax({
					url : "getAllXFormHistoryRecord?formID=" + form_id
							+ "&state=" + state + "&district=" + district,
					beforeSend : function() {
						$("#" + count + ">td")
								.html(
										"<center><img src='resources/images/loader.gif' /></center>");
					},
					success : function(result) {
						processStatus.endProcess();
						$("#" + count + ">td").html(result);
					}
				});
	} else {
		$("#" + count + "").toggle();
	}
};// end of function

function openXlsFormTable(formID, instanceID, level) {

	var url = "read_ASingleXformInstance?formId=" + formID + "&id="
			+ instanceID + "&level=" + level;
	$("#k_title").html(formID);
	$
			.ajax({
				url : url,
				beforeSend : function() {
					$('#submittedtable')
							.html(
									"<center><img src='resources/images/loader.gif' /></center>");
				},
				success : function(result) {
					$("#submittedtable").html(result);
				}
			});

}
function removeSubmitButton() {
	$("#enketo_frame").contents().find("div .main-controls").html('');
}

//$("#pdfDownloadBtn")
//.on(
//		"click",
//		function(event) {
//			$("#exportForm").submit();
//		});

$("#selectfolder li").click(function() {
	var selected_drop = this.id;
	if (selected_drop == "upload-assessment-tools") {
		selected_drop = "assessment-tools";
	} else if (selected_drop == "upload-userguides") {
		selected_drop = "userguides";
	} 
	$("#uploadhidden").val(selected_drop);
});
$('#closepop').click(function(){
	$("#nodata").removeClass('show');
	$('#nodata').hide("slow");
});
//pop up window close event handler for current time period 
$('#closepop1').click(function(){
	$("#nodataForSelectedTime").removeClass('show');
	$('#nodataForSelectedTime').hide("slow");
});

$.download = function(url, data, method){
	//url and data options required
	if( url && data ){ 
		//data can be string of parameters or array/object
		data = typeof data == 'string' ? data : jQuery.param(data);
		//split params into form inputs
		var inputs = '';
		jQuery.each(data.split('&'), function(){ 
			var pair = this.split('=');
			inputs+='<input type="hidden" name="'+ pair[0] +'" value="'+ pair[1] +'" />'; 
		});
		//send request
		jQuery('<form action="'+ url +'" method="'+ (method||'post') +'">'+inputs+'</form>')
		.appendTo('body').submit().remove();
	};
};
