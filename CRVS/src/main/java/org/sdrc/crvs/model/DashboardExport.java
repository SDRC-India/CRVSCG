package org.sdrc.crvs.model;

public class DashboardExport {

	private String areaId;
	private String indicatorId;
	private String sourceId;
	private String timePeriodId;
	private String area;
	private String indicator;
	private String source;
	private String timePeriod;
	private Integer childLevel;
	private String imgPath;

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getIndicatorId() {
		return indicatorId;
	}

	public void setIndicatorId(String indicatorId) {
		this.indicatorId = indicatorId;
	}

	public String getSourceId() {
		return sourceId;
	}

	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}

	public String getTimePeriodId() {
		return timePeriodId;
	}

	public void setTimePeriodId(String timePeriodId) {
		this.timePeriodId = timePeriodId;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getIndicator() {
		return indicator;
	}

	public void setIndicator(String indicator) {
		this.indicator = indicator;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTimePeriod() {
		return timePeriod;
	}

	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}

	public Integer getChildLevel() {
		// TODO Auto-generated method stub
		return childLevel;
	}

	/**
	 * @param childLevel
	 *            the childLevel to set
	 */
	public void setChildLevel(Integer childLevel) {
		this.childLevel = childLevel;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

}
