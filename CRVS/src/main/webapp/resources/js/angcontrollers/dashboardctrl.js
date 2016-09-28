function ValueObject(key, value) {
	this.key = key;
	this.value = value;
}
function DashboardController($scope, $http, $window, $timeout, cfpLoadingBar) {

	var w = angular.element($window);
	$scope.getWindowDimensions = function() {
		return {
			"h" : w.height(),
			"w" : (w.width() * 90 / 100)
		};
	};
	// this is to make sure that scope gets changes as window get resized.
    w.bind('resize', function () {
		$scope.$apply();
	});
	// Scope properties
	// $scope.indicators = [ new ValueObject("1", "Select Indicator") ];---
	$scope.indicators = [];
	$scope.timeformats = [];
	$scope.sectors = [];// [ new ValueObject("1", "Basic Info") ];
	$scope.utdata = [];
	$scope.legends = [];
	$scope.topPerformers = [];
	$scope.bottomPerformers = [];
	$scope.sources = [];
	$scope.ldata = [];
	$scope.PCldata = "";
	$scope.cldata = [];

	// select the first user of the list
	$scope.selectedMapAreaType = "District";
	$scope.selectedTimeperiod = $scope.timeformats[0];
	$scope.selectedSector = $scope.sectors[0];
	$scope.selectedIndicator = $scope.indicators[0];
	$scope.selectedSource = $scope.sources[0];
	$scope.selectedGranularity = new ValueObject("IND022", "Chhattisgarh");
	$scope.selectedChildAreaLevel = 3;
	$scope.isTrendVisible = true;
	$scope.selectedArea = "[]";
	$scope.show = false;
	$scope.shouldDrilldown = false;
	$scope.disablePdf = false;
	$scope.shoulddisappear=true;
	$scope.isColumnVisible = false;
	$scope.isLineVisible = false;
	$scope.primary_url = "";
	$scope.query = "";
	$scope.stateData = new ValueObject("data", 0);
	// Scope methods
	// expose a callable method for sectors
	$scope.selectSector = function(sector) {
		cfpLoadingBar.start();
		$scope.selectedSector = sector;
		$scope.getindicators();
	};
	// expose a callable method to the view
	$scope.selectIndicator = function(indicator) {
		cfpLoadingBar.start();
		$scope.selectedIndicator = indicator;
		$scope.getsources();
	};
	// expose a callable method to the source
	$scope.selectSource = function(source) {
		cfpLoadingBar.start();
		$scope.selectedSource = source;
		$scope.gettimeperiods();
	};
	// expose a callable method for time period
	$scope.selectTimeperiod = function(timeformat) {
		cfpLoadingBar.start();
		$scope.selectedTimeperiod = timeformat;
		$scope.getutdata();
	};
	
	$scope.clearList = function(){
		$("#searchText")[0].value = "";
		$scope.query = "";
		
//		$scope.$apply();
	};
	
	// expose a callable method Map areaType
	$scope.selectMapAreaType = function(mapAreaType, sg, sl, sd) {
		$scope.closeViz();
		$scope.selectedMapAreaType = mapAreaType;
		var mapUrl = "";
		switch (mapAreaType) {
		case "District":
			mapUrl = "resources/geomaps/Chhattisgarh.json";

			$scope.selectedChildAreaLevel = 3;
			$scope.shouldDrilldown = true;
			$scope.selectedGranularity = new ValueObject("IND022", "Chhattisgarh");
			break;
		default:
			mapUrl = "resources/geomaps/odisha_map.json";
			break;
		}
		$(".backbtn").toggleClass("hidden", true);

		$scope.primary_url = mapUrl;

		if (sg && sl) {

			$scope.selectedChildAreaLevel = sl;
			$scope.shouldDrilldown = sd;
			$scope.selectedGranularity = sg;
			$scope.primary_url = "resources/geomaps/"
					+ $scope.selectedGranularity.value + ".json";
		}
		$scope.mapSetup($scope.primary_url, function() {
			cfpLoadingBar.start();
			$scope.getutdata();
		});
	};
	$scope.showViz = function(areacode) {
		if (areacode && $scope.selectedArea != areacode) {
			
			$scope.isTrendVisible = true;
			document.getElementsByClassName("trend-viz animate-show")[0].style.display = "block";
			// TODO: this is fishy i am changing
			// visualization in angular context. i should
			// not be doing $scope.$apply().
			$scope.selectedArea = areacode;
			$scope.cldata = [];
			$scope.ldata = [];
			$scope.PCldata ="";
			if( $scope.timeformats.length >1){
				$scope.lineChartValue($scope.selectedArea.properties.utdata.areaNid);
				$scope.isColumnVisible = false;
				

			}
			else{
				$scope.columnChartdataValue($scope.selectedArea.properties.utdata.areaNid);
				$scope.isColumnVisible = true;
			

			}
			
		} else {

			$scope.isTrendVisible = false;
			$scope.selectedArea = [];
		}
		$scope.$apply();
	};
	$scope.closeViz = function() {
		$scope.isTrendVisible = false;
		$scope.cldata = [];
		$scope.ldata = [];
		$scope.PCldata ="";
	};

	$scope.start = function() {
		cfpLoadingBar.start();
		$(".right-arrow").click(function() {
			if (processStatus.requestRunning) {
				return;
			}
			processStatus.startProcess();
			if ($(".active-sector").length == 0) {
				$(".sectorlist").first().addClass("active-sector");
			}
			var activeElement = $(".active-sector");
			$visiblesec_width = $(".sector_wrap").outerWidth(true);

			$prevWidth = 0;
			activeElement.prevAll().each(function() {
				$prevWidth += parseInt($(this).outerWidth(true), 10);
			});

			$ulwidth = 0;
			$(".sectorlist").each(function(index) {
				$ulwidth += parseInt($(this).outerWidth(true), 10);
			});

			// get length of all lists present before active lists
			if ($visiblesec_width + $prevWidth < $ulwidth) {
				$(".sectorlists").animate({
					"left" : "-=" + activeElement.outerWidth(true)
				}, 300, function() {
					activeElement.removeClass("active-sector");
					activeElement.next().addClass("active-sector");
					processStatus.endProcess();
				});
			} else {
//				$(".right-arrow").addClass("disable");
				processStatus.endProcess();
			}
		});
		$(".left-arrow").click(function() {

			if (processStatus.requestRunning) {
				return;
			}
			processStatus.startProcess();

			var activeElement = $(".active-sector");
			if (activeElement.prev()) {
				$prevWidth = 0;
				activeElement.prevAll().each(function() {
					$prevWidth += parseInt($(this).outerWidth(true), 10);
				});

				if ($prevWidth > 0) {
					$(".sectorlists").animate({
						"left" : "+=" + activeElement.prev().outerWidth(true)
					}, 300, function() {
						activeElement.removeClass("active-sector");
						activeElement.prev().addClass("active-sector");
						processStatus.endProcess();
					});
				} else {
//					$(".left-arrow").addClass("disable");
					processStatus.endProcess();
				}
			} else {
//				$(".left-arrow").addClass("disable");
				processStatus.endProcess();
			}

		});

					$http.get("sectors").success(function(data) {
										$scope.sectors = data;
										if ($scope.sectors) {
											$scope.selectedSector = $.urlParam("ss") != 0 ? $.getValueFromValueObect($.urlParam("ss"),$scope.sectors): $scope.sectors[0];
											
											$http.get("indicators?sector="+ $scope.selectedSector.key)
													.success(function(data) {
																$scope.indicators = data;
																if ($scope.indicators) {
																	
																	$scope.selectedIndicator = $.urlParam("si") != 0 ? $.getValueFromValueObectForIndicator($.urlParam("si"),$scope.indicators): $scope.indicators[0];
																	
																	$http.get("sources?iusnid="+ $scope.selectedIndicator.description).success(function(data) {
																		$scope.sources = data;
																		if($scope.sources && $scope.sources.length>0) {
																			$scope.selectedSource = $.urlParam("so") != 0 ? $.getValueFromValueObect($.urlParam("so"),$scope.sources): $scope.sources[0];
																			$http.get("timeperiod?iusnid="+ $scope.selectedIndicator.description + "&sourceNid="+ $scope.selectedSource.key).success(function(data){
																				$scope.timeformats = data;
																				if($scope.timeformats && $scope.timeformats.length>0){
																					
																					$scope.selectedTimeperiod = $.urlParam("st") != 0 ? $.getValueFromValueObect($.urlParam("st"),$scope.timeformats): $scope.timeformats[0];
																					var sl = $.urlParam("sl") != 0 ? $.urlParam("sl"): $scope.selectedChildAreaLevel;
																					
																					var smap = $.urlParam("smap") != 0 ? $.urlParam("smap"): $scope.selectedMapAreaType;
																					
																					var sg = $.urlParam("sg") != 0 ? new ValueObject($.urlParam("sg"),$.urlParam("sgn"))
																							: $scope.selectedGranularity;
																					var sd = $.urlParam("sd") != 0 ? $.urlParam("sd"): $scope.shouldDrilldown;
																					
																					$scope.selectMapAreaType(smap,sg,sl,sd);
																				}else{
																					var sl = $.urlParam("sl") != 0 ? $.urlParam("sl"): $scope.selectedChildAreaLevel;
																					
																					var smap = $.urlParam("smap") != 0 ? $.urlParam("smap"): $scope.selectedMapAreaType;
																					
																					var sg = $.urlParam("sg") != 0 ? new ValueObject($.urlParam("sg"),$.urlParam("sgn"))
																							: $scope.selectedGranularity;
																					var sd = $.urlParam("sd") != 0 ? $.urlParam("sd"): $scope.shouldDrilldown;
																					
																					$scope.selectMapAreaType(smap,sg,sl,sd);
																				}
																				
																			});
																			
																		}
																	});
																	
																}
															});
										}
									});

//				});

	};

	$scope.getindicators = function() {
		var url= "indicators";
		var query = "";
		if ($scope.selectedSector)
			query += "sector=" + $scope.selectedSector.key + "&";
		if (query != "")
			url += "?" + query.trim("&");
		$http.get(url).success(function(data) {
					$scope.indicators = data;
					if ($scope.indicators) {
						$scope.selectedIndicator = $scope.indicators[0];
						$scope.getsources();
					}else{
						$scope.getsources();
					}
				});
	};
	
	$scope.getsources = function() {
		var url= "sources";
		var query = "";
		if ($scope.selectedIndicator)
			query += "iusnid=" + $scope.selectedIndicator.description+ "&";
		if (query != "")
			url += "?" + query.trim("&");
		$http.get(url).success(function(data) {
					$scope.sources = data;
					if ($scope.sources) {
						$scope.selectedSource = $scope.sources[0];
						$scope.gettimeperiods();
					}else{
						$scope.gettimeperiods();
					}
				});

	};
	
	$scope.gettimeperiods = function() {
		var url= "timeperiod";
		var query = "";
		if ($scope.selectedIndicator)
			query += "iusnid=" + $scope.selectedIndicator.description+ "&";
		if ($scope.selectedSource)
			query += "sourceNid=" + $scope.selectedSource.key+ "&";
		if (query != "")
			url += "?" + query.trim("&");
		$http.get(url).success(function(data) {
					$scope.timeformats = data;
					if ($scope.timeformats) {
						$scope.selectedTimeperiod = $scope.timeformats[0];
						$scope.getutdata();
					}else{
						$scope.getutdata();
					}
				});

	};

	$scope.getutdata = function() {
		// resetting all the data
		cfpLoadingBar.start();
		$scope.utdata = [];
		$scope.legends = [];
		$scope.topPerformers = [];
		$scope.bottomPerformers = [];
		var url = "data";

		var query = "";
		if ($scope.selectedIndicator)
			query += "indicatorId=" + $scope.selectedIndicator.description
					+ "&";
		if ($scope.selectedGranularity)
			query += "areaId=" + $scope.selectedGranularity.key + "&";
		if ($scope.selectedSource)
			query += "sourceNid=" + $scope.selectedSource.key+ "&";
		if ($scope.selectedTimeperiod)
			query += "timeperiodId=" + $scope.selectedTimeperiod.key + "&";
		
		if ($scope.selectedChildAreaLevel)
			query += "childLevel=" + $scope.selectedChildAreaLevel + "&";
		if (query != "")
			url += "?" + query.trim("&");
		$http.get(url).success(function(data) {
			$scope.utdata = data;
			$scope.legends = data.legends ? data.legends : [];
			
			if ($scope.legends && $scope.legends.length > 0) {
				for (var i = 0; i < data.legends.length; i++) {
					$scope.legends[i].key = data.legends[i].key == 'Not Available' ? data.legends[i].key
							: parseFloat(data.legends[i].key
									.split(' - ')[0])
									+ ' - '
									+ parseFloat(data.legends[i].key
											.split(' - ')[1]);
				}
			}
			$scope.topPerformers = data.topPerformers;
			if($scope.topPerformers ){
				for (var i = 0; i < data.topPerformers.length; i++) {
					$scope.topPerformers[i] = data.topPerformers[i].split(' - ')[0] + ' - ' + parseFloat(data.topPerformers[i].split(' - ')[1]);
				}
			}
			$scope.bottomPerformers = data.bottomPerformers;
			if($scope.bottomPerformers){
				for (var i = 0; i < data.bottomPerformers.length; i++) {
					$scope.bottomPerformers[i] = data.bottomPerformers[i].split(' - ')[0] + ' - ' + parseFloat(data.bottomPerformers[i].split(' - ')[1]);
				}
			}
			
			var query1 = "";
			if ($scope.selectedIndicator)
				query1 += "indicatorId=" + $scope.selectedIndicator.description
						+ "&";
			if ($scope.selectedGranularity)
				query1 += "areaId=" + $scope.selectedGranularity.key + "&";
			if ($scope.selectedSource)
				query1 += "sourceNid=" + $scope.selectedSource.key+ "&";
			if ($scope.selectedTimeperiod)
				query1 += "timeperiodId=" + $scope.selectedTimeperiod.key + "&";
			
			var url1 = "stateData";
			if (query != "")
				url1 += "?" + query.trim("&");
			
			$scope.stateData = new ValueObject("data", "") ;
			$http.get(url1).success(function(data) {
				
				$scope.stateData = data ;
			});
			
			
			document.getElementById("legendsection").style.display = $scope.legends.length > 0 ? 'block' : 'none'; 
			document.getElementById("tbsection").style.display = $scope.legends.length > 0 ? 'block' : 'none'; 
			
			cfpLoadingBar.complete();
		});
	};
	
	$scope.lineChartValue = function() {
		$http.get(

				'lineData?iusNid=' + $scope.selectedIndicator.description
						+ '&areaNid=' + $scope.selectedArea.properties.utdata.areaNid)

				.success(function(data) {
//					 $scope.isnodata = false;
					$scope.ldata = data;
					$scope.PCldata = data[0][0];
					$scope.isColumnVisible = false;
//					$scope.lineChartValue();
					if(data.length == 0){
						$scope.closeViz();
					}

					// console.log(data);
				});
	};

	$scope.columnChartdataValue = function() {
		$http.get(

				'ColData?iusNid=' + $scope.selectedIndicator.description
						+ '&areaNid=' + $scope.selectedArea.properties.utdata.areaNid)

				.success(function(data) {
//					 $scope.isnodata = false;
				
					$scope.cldata = data;
					$scope.PCldata ="";
					$scope.isColumnVisible = true;
//					$scope.columnChartdataValue();
					if(data.length == 0){
						$scope.closeViz();
					}
					// console.log(data);
				});
	};

	$scope.complete = function() {
		cfpLoadingBar.complete();
	};

	// fake the initial load so first time users can see the bar right away:
	$scope.start();
//	$scope.fakeIntro = true;
//	$timeout(function() {
//		$scope.complete();
//		$scope.fakeIntro = false;
//	}, 30000);
	$scope.style = function() {

	};
	
	$scope.downloadExcel = function() {
		$('#excelDownloadBtn').html('<img src="resources/images/wheel.svg" /> Excel ');
		$http.get(
				'exportToExcel?areaId=' + $scope.selectedGranularity.key
						+ '&indicatorId=' + $scope.selectedIndicator.description
						+ '&sourceId=' + $scope.selectedSource.key
						+ '&timePeriodId=' + $scope.selectedTimeperiod.key
						+ '&childLevel=' + $scope.selectedChildAreaLevel
						+ '&indicatorName=' + $scope.selectedIndicator.value
						+ '&source=' + $scope.selectedSource.value
						+ '&timePeriod=' +$scope.selectedTimeperiod.value)
				.success(function(data) {
					var file = {"fileName" :data};
					$.download("downloadPDF",file,'POST');
					$('#excelDownloadBtn').html('<i class="fa fa-lg fa-arrow-circle-down"></i> Excel ');
				});
	};
}
