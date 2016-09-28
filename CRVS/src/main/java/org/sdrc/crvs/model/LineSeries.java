package org.sdrc.crvs.model;

public class LineSeries {

	private String source;
	private String date;
	private Object value;
	private String rank;
	private String percentageChange;
	private Boolean isPositive;

	
	public LineSeries() {
		super();
	}

	public LineSeries(String source, String date, Object value) {
		super();
		this.source = source;
		this.date = date;
		this.value = value;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getPercentageChange() {
		return percentageChange;
	}

	public void setPercentageChange(String percentageChange) {
		this.percentageChange = percentageChange;
	}

	@Override
	public String toString() {
		return "LineSeries [source=" + source + ", date=" + date + ", value="
				+ value + ", rank=" + rank + ", percentageChange="
				+ percentageChange + "]";
	}

	public Boolean getIsPositive() {
		return isPositive;
	}

	public void setIsPositive(Boolean isPositive) {
		this.isPositive = isPositive;
	}
	

}
