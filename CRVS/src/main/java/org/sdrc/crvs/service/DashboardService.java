package org.sdrc.crvs.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.sdrc.crvs.model.LineSeries;
import org.sdrc.crvs.model.UtDataCollection;
import org.sdrc.crvs.model.UtDataModel;
import org.sdrc.crvs.model.ValueObject;

public interface DashboardService {

	List<ValueObject> fetchIndicators(String param);
	
	List<ValueObject> fetchSources(String param);	

//	List<ValueObject> fetchTimeFormats() throws ParseException;
	
	List<ValueObject> fetchUtTimeperiod(Integer iusNid,Integer SourceNid);
	
	List<ValueObject> fetchAllSectors(String ic_type);
	
	UtDataCollection fetchData(String indicatorId,String sourceId, String parentAreaCode, String timeperiodId , Integer childLevel) throws ParseException;

	List<List<LineSeries>> fetchChartData(Integer iusNid, Integer areaNid) throws ParseException;

	List<List<Map<Object, String>>> fetchColChartData(Integer iusNid, Integer areaNid);

	List<UtDataModel> fetchPdfData(String indicatorId, String sourceId,
			String areaId, String timePeriodId, Integer childLevel);

	ValueObject getStateAggregate(String ius, String timePeriodNid,
			Integer source, String areaId);
	
}
