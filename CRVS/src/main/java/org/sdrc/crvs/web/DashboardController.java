package org.sdrc.crvs.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.sdrc.crvs.model.LineSeries;
import org.sdrc.crvs.model.UtDataCollection;
import org.sdrc.crvs.model.ValueObject;
import org.sdrc.crvs.service.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DashboardController {

	private final DashboardService dashboardService;

	@Autowired
	public DashboardController(DashboardService dashboardService) {
		this.dashboardService = dashboardService;
	}

	@RequestMapping(value = { "/api/indicators" }, method = { RequestMethod.GET })
	@ResponseBody
	public List<ValueObject> fetchIndicators(
			@RequestParam(required = false) String sector) throws Exception {
		List<ValueObject> valueObjects = new ArrayList<>();
		if (sector != null ){
			valueObjects = dashboardService.fetchIndicators(sector);
		}
		return valueObjects;
	}
	
	@RequestMapping(value = { "/api/sources" }, method = { RequestMethod.GET })
	@ResponseBody
	public List<ValueObject> fetchSources(
			@RequestParam(required = false) String iusnid) throws Exception {
		List<ValueObject> valueObjects = new ArrayList<>();
		if (iusnid != null ){
			valueObjects = dashboardService.fetchSources(iusnid);
		}
		return valueObjects;
	}
	

//	@RequestMapping(value = { "/api/timeformats" }, method = { RequestMethod.GET })
//	@ResponseBody
//	public List<ValueObject> fetchTimeFormats() throws Exception {
//		return dashboardService.fetchTimeFormats();
//	}
	
	@RequestMapping(value = { "/api/timeperiod" }, method = { RequestMethod.GET })
	@ResponseBody
	public List<ValueObject> fetchUtTimeperiod(
			@RequestParam(required = false) String iusnid, @RequestParam(required = false) String sourceNid) throws Exception {
		
		List<ValueObject> valueObjects = new ArrayList<>();
		if (iusnid != null && sourceNid != null ){
//			valueObjects = new ArrayList<>();
			valueObjects = dashboardService.fetchUtTimeperiod(Integer.parseInt(iusnid),Integer.parseInt(sourceNid));
		}
		return valueObjects;
	}

	@RequestMapping(value = { "/api/sectors" }, method = { RequestMethod.GET })
	@ResponseBody
	public List<ValueObject> fetchAllSectors() throws Exception {
		System.out.println("Sectors---------");
		return dashboardService.fetchAllSectors("SC");
	}

	@RequestMapping(value = "/api/data", method = RequestMethod.GET)
	@ResponseBody
	public UtDataCollection fetchData(
			@RequestParam(required = false) String indicatorId,
			@RequestParam(required = false) String sourceNid,
			@RequestParam(required = false) String areaId,
			@RequestParam(required = false) String timeperiodId,
			@RequestParam(required = false) Integer childLevel) throws Exception {
		  
		UtDataCollection valList = new UtDataCollection();
		System.out.println("Checking the parameter values for UT DATA ====> "+ indicatorId + "  ==  "+ sourceNid + "  ==  " + areaId + "  ==  " + timeperiodId+ "  ==  " + childLevel);
		if (indicatorId != null && sourceNid !=null && timeperiodId != null) {
//			System.out
//					.println("Checking the parameter values for UT DATA ====> "
//							+ indicatorId + "  ==  "+ sourceId + "  ==  " + areaId + "  ==  "
//							+ timeperiodId);
			valList = dashboardService
					.fetchData(indicatorId,sourceNid, areaId, timeperiodId,childLevel);
//			System.out.println(valList);
		}

		return valList;
	}
	
	@RequestMapping(value = "/api/lineData", method = RequestMethod.GET)
	@ResponseBody
	public List<List<LineSeries>> fetchLineData(
			@RequestParam(required = false) Integer iusNid,
			@RequestParam(required = false) Integer areaNid) throws Exception {
//				iusNid = 2; 
//				int iCNid = 2; 
//				areaNid = 31;
//				int sourceNid = 28; 
//				String sourceNid = ResourceBundle.getBundle("spring/app").getString("rmnch.state.assam");
				return dashboardService.fetchChartData(iusNid, areaNid);
			}
	
	@RequestMapping(value = "/api/ColData", method = RequestMethod.GET)
	@ResponseBody
	public List<List<Map<Object, String>>> fetchColData(
			@RequestParam(required = false) Integer iusNid,
			@RequestParam(required = false) Integer areaNid) throws Exception {
//				iusNid = 2; 
//				int iCNid = 2; 
//				areaNid = 31;
//				int sourceNid = 28; 
//				String sourceNid = ResourceBundle.getBundle("spring/app").getString("rmnch.state.assam");
				return dashboardService.fetchColChartData(iusNid, areaNid);
			}
	
	@RequestMapping(value = { "/api/stateData" }, method = { RequestMethod.GET })
	@ResponseBody
	public ValueObject fetchStateData(
			@RequestParam(required = false) String indicatorId,
			@RequestParam(required = false) String areaId,
			@RequestParam(required = false) String timeperiodId,
			@RequestParam(required = false) String sourceNid
			) throws Exception {
		
		
		
		return dashboardService.getStateAggregate(indicatorId, timeperiodId, Integer.parseInt(sourceNid), areaId);
		
	}
	
	
}