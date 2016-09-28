package org.sdrc.crvs.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sdrc.crvs.model.LineSeries;
import org.sdrc.crvs.model.UtDataCollection;
import org.sdrc.crvs.model.UtDataModel;
import org.sdrc.crvs.model.ValueObject;
import org.sdrc.crvs.util.Constants;
import org.sdrc.devinfo.domain.UtAreaEn;
import org.sdrc.devinfo.domain.UtData;
import org.sdrc.devinfo.domain.UtIcIus;
import org.sdrc.devinfo.domain.UtIndicatorClassificationsEn;
import org.sdrc.devinfo.domain.UtIndicatorEn;
import org.sdrc.devinfo.domain.UtSubgroupValsEn;
import org.sdrc.devinfo.domain.UtTimeperiod;
import org.sdrc.devinfo.domain.UtUnitEn;
import org.sdrc.devinfo.repository.IndicatorRepository;
import org.sdrc.devinfo.repository.SectorRepository;
import org.sdrc.devinfo.repository.SourceRepository;
import org.sdrc.devinfo.repository.UtAreaEnRepository;
import org.sdrc.devinfo.repository.UtDataRepository;
import org.sdrc.devinfo.repository.UtTimeperiodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private IndicatorRepository indicatorRepository;

	@Autowired
	private UtTimeperiodRepository utTimeperiodRepository;

	@Autowired
	private SectorRepository SectorRepository;

	@Autowired
	private SourceRepository sourceRepository;

	@Autowired
	private UtDataRepository dataRepository;
	
	@Autowired
	private UtAreaEnRepository utAreaEnRepository;
	
	private Map<String, Integer> ranks = null;

	private Map<String, List<LineSeries>> dataByArea = null;

	private Map<String, Map<String, List<ValueObject>>> dataByTPBYSource = null;

	private List<String> topPerformers = null;

	private List<String> bottomPerformers = null;

	@Override
	public List<ValueObject> fetchIndicators(String sector) {
		List<Object[]> listofIndicators = indicatorRepository
				.findByIC_Type(new Integer(sector));
		List<ValueObject> list = new ArrayList<ValueObject>();

		for (int i = 0; i < listofIndicators.size(); i++) {

			Object[] objects = listofIndicators.get(i);

			ValueObject vObject = new ValueObject();
			String indName = "";
			String unitName = "";
			String subName = "";
			for (Object obj : objects) {

				if (obj instanceof UtIndicatorEn) {
					UtIndicatorEn utIUS = (UtIndicatorEn) obj;
					indName = utIUS.getIndicator_Name();
					vObject.setKey(Integer.toString(utIUS.getIndicator_NId()));
					// vObject.setValue(utIUS.getIndicator_Name());
				} else if (obj instanceof UtUnitEn) {
					UtUnitEn unitEn = (UtUnitEn) obj;
					unitName = unitEn.getUnit_Name();
				} else if (obj instanceof UtSubgroupValsEn) {
					UtSubgroupValsEn subgroupValsEn = (UtSubgroupValsEn) obj;
					subName = subgroupValsEn.getSubgroup_Val();
				} else if (obj instanceof UtIcIus) {
					UtIcIus utIUS = (UtIcIus) obj;
					vObject.setDescription(Integer.toString(utIUS.getIUSNId()));
				}
			}
			vObject.setValue(indName + ", " + subName + " (" + unitName + ")");
			list.add(vObject);
		}
		return list;
	}

	// @Override
	// public List<ValueObject> fetchTimeFormats() throws ParseException {
	// List<UtTimeperiod> listofTimeFormats = utTimeperiodRepository.findAll();
	// List<ValueObject> list = new ArrayList<ValueObject>();
	// String tp;
	// for (UtTimeperiod utTimeperiod : listofTimeFormats) {
	// tp = utTimeperiod.getTimePeriod();
	// tp = getFormattedTP(tp);
	// list.add(new ValueObject(utTimeperiod.getTimePeriod_NId(), tp));
	// }
	//
	// return list;
	// }

	@Override
	public List<ValueObject> fetchAllSectors(String ic_type) {
		// TODO Auto-generated method stub
		List<UtIndicatorClassificationsEn> listofSectors = SectorRepository
				.findByIC_Type(ic_type);
		List<ValueObject> list = new ArrayList<ValueObject>();
		for (UtIndicatorClassificationsEn utIndicatorClasssificationsEn : listofSectors) {
			list.add(new ValueObject(utIndicatorClasssificationsEn.getIC_NId(),
					utIndicatorClasssificationsEn.getIC_Name()));
		}
		return list;

	}

	@Override
	public UtDataCollection fetchData(String indicatorId, String sourceId,
			String parentAreaCode, String timeperiodId, Integer childLevel)
			throws ParseException {
		dataByArea = null;
		ranks = null;
		dataByTPBYSource = null;
		// get all areas less than or equal to the selected level
		UtAreaEn[] utAreas = dataRepository.getAreaNid(parentAreaCode,
				childLevel);

		// get parentArea from the area list
		UtAreaEn area = getParentUtArea(utAreas, parentAreaCode);

		ArrayList<UtAreaEn> list = new ArrayList<UtAreaEn>();
		// get children of the select area.
		getChildren(utAreas, childLevel, area.getArea_NId(), list);

		Integer[] areaNids = new Integer[list.size()];

		int i = 0;
		for (UtAreaEn utAreaEn : list) {
			areaNids[i] = utAreaEn.getArea_NId();
			i++;
		}

		UtDataCollection utDataCollection = getUtdataCollection(indicatorId,
				timeperiodId, sourceId, areaNids);

		return utDataCollection;
	}

	private UtAreaEn getParentUtArea(UtAreaEn[] utAreas, String areaId) {
		UtAreaEn utAreaen = null;
		for (UtAreaEn utAreaEn : utAreas) {
			if (utAreaEn.getArea_ID().equalsIgnoreCase(areaId)) {
				utAreaen = utAreaEn;
				break;
			}
		}
		return utAreaen;
	}

	private void getChildren(UtAreaEn[] utAreas, int i, int parentNid,
			ArrayList<UtAreaEn> list) {

		for (UtAreaEn utAreaEn : utAreas) {
			if (utAreaEn.getArea_Parent_NId() == parentNid) {
				if (utAreaEn.getArea_Level() == i)
					list.add(utAreaEn);
				else
					getChildren(utAreas, i, utAreaEn.getArea_NId(), list);
			}
		}

	}

	public UtDataCollection getUtdataCollection(String indicatorId,
			String timePeriodNid, String sourceId, Integer[] areaNid)
			throws ParseException {

		UtDataCollection collection = new UtDataCollection();

		// this will fetch the data for the selected time-period
		// fetch the data for the selected time-period

		List<Object[]> data = dataRepository.findDataByTimePeriod(
				Integer.parseInt(indicatorId), Integer.parseInt(timePeriodNid),
				Integer.parseInt(sourceId), areaNid);

		if (data != null && !data.isEmpty()) {
			List<ValueObject> list = new ArrayList<ValueObject>();
			// this will fetch the data for the selected time-period and
			// populate the legend
			list = populateLegends(data, indicatorId);
			collection.setLegends(list);
			collection.setTopPerformers(topPerformers);
			collection.setBottomPerformers(bottomPerformers);

			UtData utData = null;
			UtAreaEn utAreaEn = null;
			Double value = null;

			for (Object[] dataObject : data) {
				UtDataModel utDataModel = new UtDataModel();

				utData = (UtData) dataObject[0];
				utAreaEn = (UtAreaEn) dataObject[1];

				value = getFormattedDouble(utData != null
						&& utData.getUnit_NId() == 2 ? utData.getData_Value()
						: new Double(Math.round(utData.getData_Value())));

				utDataModel.setValue(value.toString());
				utDataModel.setAreaCode(utAreaEn.getArea_ID());
				utDataModel.setAreaName(utAreaEn.getArea_Name());
				utDataModel.setAreaNid(utAreaEn.getArea_NId());

				utDataModel.setRank(ranks != null
						&& ranks.get(utAreaEn.getArea_ID()) != null ? Integer
						.toString(ranks.get(utAreaEn.getArea_ID())) : null);
				if (list != null) {
					setCssForDataModel(list, utDataModel, value, indicatorId);
				}
				utDataModel.setUnit("percent");

				collection.dataCollection.add(utDataModel);

			}

		}
		return collection;
	}

	private void setCssForDataModel(List<ValueObject> list, UtDataModel data,
			Double value, String indicatorId) {

		for (int index = 0; index < list.size(); index++) {
			ValueObject vObject = list.get(index);
			String[] vArray = vObject != null ? ((String) vObject.getKey())
					.split(" - ") : null;
			if (index == 4
					|| (vArray != null
							&& new Double(vArray[0]).doubleValue() <= value && value <= new Double(
							vArray[1]).doubleValue())) {

				if (isPositveIndicator(indicatorId)) {
					switch (index) {
					case 0:
						data.setCssClass(Constants.Slices.FIRST_SLICE);
						break;
					case 1:
						data.setCssClass(Constants.Slices.SECOND_SLICE);
						break;
					case 2:
						data.setCssClass(Constants.Slices.THIRD_SLICE);
						break;
					case 3:
						data.setCssClass(Constants.Slices.FOUTRH_SLICE);
						break;
					}
				} else {
					switch (index) {
					case 0:
						data.setCssClass(Constants.Slices.FOUTRH_SLICE);
						break;
					case 1:
						data.setCssClass(Constants.Slices.THIRD_SLICE);
						break;
					case 2:
						data.setCssClass(Constants.Slices.SECOND_SLICE);
						break;
					case 3:
						data.setCssClass(Constants.Slices.FIRST_SLICE);
						break;
					}
				}

			}
		}

	}

	private boolean isPositveIndicator(String indicatorId) {

		UtIndicatorEn indicatorEn = indicatorRepository
				.findByIndicator_NId(Integer.parseInt(indicatorId));
		return indicatorEn.getHighIsGood() == 0 ? false : true;

	}

	private List<ValueObject> populateLegends(List<Object[]> data,
			String indicatorId) throws ParseException {
		// TO DO: make this configuration based.
		int range = 4;
		Double minDataValue = null;
		Double maxDataValue = null;
		String firstslices = Constants.Slices.FIRST_SLICE;
		String secondslices = Constants.Slices.SECOND_SLICE;
		String thirdslices = Constants.Slices.THIRD_SLICE;
		String fourthslices = Constants.Slices.FOUTRH_SLICE;
		String fifthslices = Constants.Slices.FIFTHSLICES;
		List<ValueObject> list = new ArrayList<ValueObject>();

		if (data != null && !data.isEmpty()) {
			minDataValue = getFormattedDouble(((UtData) data.get(0)[0])
					.getData_Value());
			maxDataValue = getFormattedDouble(((UtData) data
					.get(data.size() - 1)[0]).getData_Value());
			Double difference = (maxDataValue - minDataValue) / range;
			difference =  new BigDecimal(difference).setScale(0,RoundingMode.HALF_UP).doubleValue();
			if (difference == 0) {
				String firstSliceValue = Double.toString(minDataValue)
						+ " - "
						+ Double.toString(getFormattedDouble(minDataValue
								+ difference));
				list.add(isPositveIndicator(indicatorId) ? new ValueObject(
						firstSliceValue, firstslices) : new ValueObject(
						firstSliceValue, fourthslices));

			} else {
				String firstSliceValue = Double.toString(minDataValue
						.intValue())
						+ " - "
						+ Double.toString(getFormattedDouble(minDataValue
								+ difference));
				String secondSliceValue = Double
						.toString(getFormattedDouble(minDataValue + difference
								+ 1))
						+ " - "
						+ Double.toString(getFormattedDouble(minDataValue + 2
								* difference));
				String thirdSliceValue = Double
						.toString(getFormattedDouble(minDataValue + 2
								* difference + 1))
						+ " - "
						+ Double.toString(getFormattedDouble(minDataValue + 3
								* difference));
				String fourthSliceValue = Double
						.toString(getFormattedDouble(minDataValue + 3
								* difference + 1))
						+ " - "
						+ Double.toString(Math.round(maxDataValue.intValue() + 1));

				if (isPositveIndicator(indicatorId)) {
					list.add(new ValueObject(firstSliceValue, firstslices));
					list.add(new ValueObject(secondSliceValue, secondslices));
					list.add(new ValueObject(thirdSliceValue, thirdslices));
					list.add(new ValueObject(fourthSliceValue, fourthslices));
					list.add(new ValueObject("Not Available", fifthslices));
				} else {
					list.add(new ValueObject(firstSliceValue, fourthslices));
					list.add(new ValueObject(secondSliceValue, thirdslices));
					list.add(new ValueObject(thirdSliceValue, secondslices));
					list.add(new ValueObject(fourthSliceValue, firstslices));
					list.add(new ValueObject("Not Available", fifthslices));
				}
			}
		}

		// calculates the rank for the area codes for the selected time-period
		populateRank(data, indicatorId);

		return list != null && !list.isEmpty() ? list : null;

	}

	private void populateRank(List<Object[]> data, String indicatorId) {

		ranks = new HashMap<String, Integer>();
		topPerformers = new ArrayList<String>();
		bottomPerformers = new ArrayList<String>();
		if (data != null && !data.isEmpty()) {
			int rank = 0;
			double dataValue = 0.0;
			UtAreaEn utArea = null;
			UtData utData = null;
			if (isPositveIndicator(indicatorId)) {
				for (int index = data.size() - 1; index >= 0; index--) {
					utData = (UtData) data.get(index)[0];
					utArea = (UtAreaEn) data.get(index)[1];

					// populate the performance by area list
					if (data.size() >= 6) {
						if (index >= data.size() - 3) {

							topPerformers.add(utArea.getArea_Name() + " - "
									+ utData.getData_Value());
						}
						if (index < 3) {
							bottomPerformers.add(utArea.getArea_Name() + " - "
									+ utData.getData_Value());
						}
					} else if (index <= 2) {
						topPerformers.add(utArea.getArea_Name() + " - "
								+ utData.getData_Value());
					} else {
						bottomPerformers.add(utArea.getArea_Name() + " - "
								+ utData.getData_Value());
					}

					if (dataValue == utData.getData_Value()
							&& index != data.size() - 1) {
						ranks.put(utArea.getArea_ID(), rank);
						continue;
					}
					rank = data.size() - index;
					dataValue = utData.getData_Value();

					ranks.put(utArea.getArea_ID(), rank);

				}
			} else {
				for (int index = 0; index < data.size(); index++) {
					utData = (UtData) data.get(index)[0];
					utArea = (UtAreaEn) data.get(index)[1];

					// populate the performance by area list
					if (data.size() >= 6) {
						if (index < 3) {

							topPerformers.add(utArea.getArea_Name() + " - "
									+ utData.getData_Value());
						}
						if (index >= data.size() - 3) {
							bottomPerformers.add(utArea.getArea_Name() + " - "
									+ utData.getData_Value());
						}
					} else if (index <= 2) {
						topPerformers.add(utArea.getArea_Name() + " - "
								+ utData.getData_Value());
					} else {
						bottomPerformers.add(utArea.getArea_Name() + " - "
								+ utData.getData_Value());
					}

					if (dataValue == utData.getData_Value() && index != 0) {
						ranks.put(utArea.getArea_ID(), rank);
						continue;
					}
					rank++;
					dataValue = utData.getData_Value();

					ranks.put(utArea.getArea_ID(), rank);

				}
			}

		}
		// TODO Auto-generated method stub
	}

	private void populateDataByTimePeroid(List<Object[]> listData)
			throws ParseException {
		// TODO Auto-generated method stub

		dataByArea = new HashMap<String, List<LineSeries>>();

		dataByTPBYSource = new HashMap<>();

		if (listData != null && !listData.isEmpty()) {
			UtData utData = null;
			UtAreaEn utAreaEn = null;
			UtTimeperiod utTimeperiod = null;
			UtIndicatorClassificationsEn classificationsEn = null;

			for (Object[] dataObject : listData) {
				utData = (UtData) dataObject[0];
				utAreaEn = (UtAreaEn) dataObject[1];
				utTimeperiod = (UtTimeperiod) dataObject[2];
				classificationsEn = (UtIndicatorClassificationsEn) dataObject[3];

				if (dataByTPBYSource.containsKey(utAreaEn.getArea_ID())) {
					Map<String, List<ValueObject>> dataByTPMap = dataByTPBYSource
							.get(utAreaEn.getArea_ID());

					if (dataByTPMap.containsKey(classificationsEn
							.getIC_Short_Name())) {
						List<ValueObject> objects = dataByTPMap
								.get(classificationsEn.getIC_Short_Name());
						objects.add(new ValueObject(getFormattedTP(utTimeperiod
								.getTimePeriod()), utData.getData_Value()));
					} else {
						List<ValueObject> objects = new ArrayList<>();
						objects.add(new ValueObject(getFormattedTP(utTimeperiod
								.getTimePeriod()), utData.getData_Value()));
						dataByTPMap.put(classificationsEn.getIC_Short_Name(),
								objects);
					}

				} else {

					Map<String, List<ValueObject>> dataByTPMap = new HashMap<>();
					List<ValueObject> objects = new ArrayList<>();
					objects.add(new ValueObject(getFormattedTP(utTimeperiod
							.getTimePeriod()), utData.getData_Value()));
					dataByTPMap.put(classificationsEn.getIC_Short_Name(),
							objects);

					dataByTPBYSource.put(utAreaEn.getArea_ID(), dataByTPMap);

				}

				if (dataByArea.containsKey(utAreaEn.getArea_ID())) {
					List<LineSeries> lineSeries = dataByArea.get(utAreaEn
							.getArea_ID());
					lineSeries.add(new LineSeries(classificationsEn
							.getIC_Short_Name(), getFormattedTP(utTimeperiod
							.getTimePeriod()), utData.getData_Value()));
				} else {
					List<LineSeries> lineSeries = new ArrayList<>();
					lineSeries.add(new LineSeries(classificationsEn
							.getIC_Short_Name(), getFormattedTP(utTimeperiod
							.getTimePeriod()), utData.getData_Value()));
					dataByArea.put(utAreaEn.getArea_ID(), lineSeries);
				}
			}// end of for
		}// end of if

	}

	public String getFormattedTP(String timePeriod) throws ParseException {

		// Date date = null;
		// try {
		// date = timePeriod != null ? new SimpleDateFormat("yyyy.MM")
		// .parse(timePeriod) : null;
		// } catch (ParseException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// date = timePeriod != null ? new SimpleDateFormat("yyyy.MMM")
		// .parse(timePeriod) : null;
		// }
		// String formattedTP = date != null ? new SimpleDateFormat("MMM yyyy")
		// .format(date) : null;

		return timePeriod;
	}

	public Double getFormattedDouble(Double value) {
		Double formattedValue = value != null ? new BigDecimal(value).setScale(
				2, BigDecimal.ROUND_HALF_UP).doubleValue() : null;
		return formattedValue;
	}

	@Override
	public List<ValueObject> fetchSources(String param) {
		List<UtIndicatorClassificationsEn> classificationsEns = sourceRepository
				.findByIUS_Nid(Integer.parseInt(param));
		List<ValueObject> valueObjects = new ArrayList<>();
		for (UtIndicatorClassificationsEn classificationsEn : classificationsEns) {
			ValueObject object = new ValueObject();
			object.setKey(new Integer(classificationsEn.getIC_NId()).toString());
			object.setValue(classificationsEn.getIC_Name());
			valueObjects.add(object);
		}

		return valueObjects;
	}

	@Override
	public List<ValueObject> fetchUtTimeperiod(Integer iusNid, Integer SourceNid) {

		List<UtTimeperiod> utTimeperiods = utTimeperiodRepository
				.findBySource_Nid(iusNid, SourceNid);
		List<ValueObject> valueObjects = new ArrayList<>();
		for (UtTimeperiod utTimeperiod : utTimeperiods) {
			ValueObject object = new ValueObject();
			object.setKey(new Integer(utTimeperiod.getTimePeriod_NId())
					.toString());
			object.setValue(utTimeperiod.getTimePeriod());
			valueObjects.add(object);
		}
		return valueObjects;
	}

	@Override
	public List<List<LineSeries>> fetchChartData(Integer iusNid,Integer areaNid ) throws ParseException {
		List<List<LineSeries>> LineCharts = new ArrayList<>();
		List<LineSeries> dataSeries = new ArrayList<>();
		
		
		List<Object[]> listData = dataRepository.findData(iusNid, areaNid);
		populateDataByTimePeroid(listData);
		if(listData != null && !listData.isEmpty()){
			for (int i = 0; i < listData.size(); i++) {
				Object[] dataObjects = listData.get(i);
				LineSeries lineChat = new LineSeries();
				for(Object dataObject : dataObjects){
					if(dataObject instanceof UtIndicatorClassificationsEn){
						UtIndicatorClassificationsEn classificationsEn = (UtIndicatorClassificationsEn) dataObject;
						lineChat.setSource(classificationsEn.getIC_Short_Name());
					}
					else if(dataObject instanceof UtData){
						UtData data = (UtData) dataObject;
						lineChat.setValue(data.getData_Value());
					}	
					else if(dataObject instanceof UtTimeperiod){
						UtTimeperiod timeperiod = (UtTimeperiod) dataObject;
						lineChat.setDate(timeperiod.getTimePeriod());
					}
				}
				dataSeries.add(lineChat);
				}
		}
		LineCharts.add(dataSeries);
		return LineCharts;
		
	
}

	@Override
	public List<List<Map<Object, String>>> fetchColChartData(Integer iusNid,
			Integer areaNid) {
		List<List<Map<Object, String>>> ColCharts = new ArrayList<>();
		List<Map<Object, String>> columnSeries = new ArrayList<>();

		List<Object[]> listData = dataRepository.findData(iusNid, areaNid);

		if (listData != null && !listData.isEmpty()) {
			for (int i = 0; i < listData.size(); i++) {
				Object[] dataObjects = listData.get(i);
				Map<Object, String> map = new HashMap<>();
				Double dataw = null;
				String source = null;
				String tm = null;
				for (Object dataObject : dataObjects) {
					if (dataObject instanceof UtIndicatorClassificationsEn) {
						UtIndicatorClassificationsEn classificationsEn = (UtIndicatorClassificationsEn) dataObject;
						source = classificationsEn.getIC_Short_Name();
					} else if (dataObject instanceof UtData) {
						UtData data = (UtData) dataObject;
						dataw = data.getData_Value();
					} else if (dataObject instanceof UtTimeperiod) {
						UtTimeperiod timeperiod = (UtTimeperiod) dataObject;
						tm = timeperiod.getTimePeriod();
					}
				}
				map.put(source, dataw.toString());
				map.put("timePeriod", tm);
				columnSeries.add(map);
			}

		}
		ColCharts.add(columnSeries);
		return ColCharts;

	}

	@Override
	public List<UtDataModel> fetchPdfData(String indicatorId, String sourceId,
			String areaId, String timePeriodId, Integer childLevel) {

		List<UtDataModel> dataModels = new ArrayList<>();
		UtAreaEn[] utAreas = dataRepository.getAreaNid(areaId, childLevel);

		// get parentArea from the area list
		UtAreaEn area = getParentUtArea(utAreas, areaId);

		ArrayList<UtAreaEn> listArea = new ArrayList<UtAreaEn>();
		// get children of the select area.
		getChildren(utAreas, childLevel, area.getArea_NId(), listArea);

		Integer[] areaNids = new Integer[listArea.size()];

		int i = 0;
		for (UtAreaEn utAreaEn : listArea) {
			areaNids[i] = utAreaEn.getArea_NId();
			i++;
		}

		// UtDataCollection collection = new UtDataCollection();

		// this will fetch the data for the selected time-period
		// fetch the data for the selected time-period

		List<Object[]> data = dataRepository.findDataByTimePeriod(
				Integer.parseInt(indicatorId), Integer.parseInt(timePeriodId),
				Integer.parseInt(sourceId), areaNids);

		if (data != null && !data.isEmpty()) {

			UtData utData = null;
			UtAreaEn utAreaEn = null;
			Double value = null;

			for (Object[] dataObject : data) {
				UtDataModel utDataModel = new UtDataModel();

				utData = (UtData) dataObject[0];
				utAreaEn = (UtAreaEn) dataObject[1];

				value = getFormattedDouble(utData != null
						&& utData.getUnit_NId() == 2 ? utData.getData_Value()
						: new Double(Math.round(utData.getData_Value())));

				utDataModel.setValue(value.toString());
				utDataModel.setAreaCode(utAreaEn.getArea_ID());
				utDataModel.setAreaName(utAreaEn.getArea_Name());
				utDataModel.setAreaNid(utAreaEn.getArea_NId());

				utDataModel.setRank(ranks != null
						&& ranks.get(utAreaEn.getArea_ID()) != null ? Integer
						.toString(ranks.get(utAreaEn.getArea_ID())) : null);
				dataModels.add(utDataModel);

			}

		}

		return dataModels;

	}
	
	@Override
	public ValueObject getStateAggregate(String ius,
			String timePeriodNid,Integer source,String areaId){
		
		 UtAreaEn area = utAreaEnRepository.findByAreaID("IND022");
		UtData data =  dataRepository.findByIUSNIdAndAreaNidAndTimePeriodNidAndSourcNid(Integer.parseInt(ius),area.getArea_NId(),Integer.parseInt(timePeriodNid),source);
		
		return new ValueObject("data", data !=  null ? data.getData_Value() : "Not Available");
	}

}
