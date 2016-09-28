package org.sdrc.crvs.model;

import java.util.List;
import java.util.Map;

public class UtDataModel implements Comparable<UtDataModel>{
 private String id;
 private String areaCode;
 private String areaName;
 private Integer areaNid;
 private String value;
 private String unit;
 private String rank;
 private String cssClass;
 private String percentageChange;
 private Boolean isPositiveTrend;
 private List<ValueObject> dataSeries;
 private List<LineSeries> lineSeries;
 private List<Map<Object, String>> columnSeries;
 private boolean isColumnVisible;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getAreaCode() {
	return areaCode;
}
public void setAreaCode(String areaCode) {
	this.areaCode = areaCode;
}
public String getAreaName() {
	return areaName;
}
public void setAreaName(String areaName) {
	this.areaName = areaName;
}
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}
public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	this.unit = unit;
}
public String getRank() {
	return rank;
}
public void setRank(String rank) {
	this.rank = rank;
}
public String getCssClass() {
	return cssClass;
}
public void setCssClass(String cssClass) {
	this.cssClass = cssClass;
}
public String getPercentageChange() {
	return percentageChange;
}
public void setPercentageChange(String percentageChange) {
	this.percentageChange = percentageChange;
}
public Boolean getIsPositiveTrend() {
	return isPositiveTrend;
}
public void setIsPositiveTrend(Boolean isPositiveTrend) {
	this.isPositiveTrend = isPositiveTrend;
}
public List<ValueObject> getDataSeries() {
	return dataSeries;
}
public void setDataSeries(List<ValueObject> dataSeries) {
	this.dataSeries = dataSeries;
}

public List<LineSeries> getLineSeries() {
	return lineSeries;
}
public void setLineSeries(List<LineSeries> lineSeries) {
	this.lineSeries = lineSeries;
}


public List<Map<Object, String>> getColumnSeries() {
	return columnSeries;
}
public void setColumnSeries(List<Map<Object, String>> columnSeries) {
	this.columnSeries = columnSeries;
}

public boolean isColumnVisible() {
	return isColumnVisible;
}
public void setColumnVisible(boolean isColumnVisible) {
	this.isColumnVisible = isColumnVisible;
}
@Override
public int compareTo(UtDataModel o) {
	// TODO Auto-generated method stub
	return 0;
}
@Override
public String toString() {
	return "UtDataModel [id=" + id + ", areaCode=" + areaCode + ", areaName="
			+ areaName + ", value=" + value + ", unit=" + unit + ", rank="
			+ rank + ", cssClass=" + cssClass + ", percentageChange="
			+ percentageChange + ", isPositiveTrend=" + isPositiveTrend
			+ ", dataSeries=" + dataSeries + ", lineSeries=" + lineSeries
			+ ", columnSeries=" + columnSeries + ", isColumnVisible="
			+ isColumnVisible + "]";
}
public Integer getAreaNid() {
	return areaNid;
}
public void setAreaNid(Integer areaNid) {
	this.areaNid = areaNid;
}

}

