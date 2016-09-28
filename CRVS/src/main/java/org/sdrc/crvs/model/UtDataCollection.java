package org.sdrc.crvs.model;

import java.util.ArrayList;
import java.util.List;

public class UtDataCollection{

	public List<UtDataModel> dataCollection;
	//private static final long serialVersionUID = 1L;
	private List<ValueObject> legends;
	private List<String> topPerformers ;	
	private List<String> bottomPerformers ;
	
	public List<UtDataModel> getDataCollection() {
		return dataCollection;
	}
	public void setDataCollection(List<UtDataModel> dataCollection) {
		this.dataCollection = dataCollection;
	}
	public List<String> getTopPerformers() {
		return topPerformers;
	}
	public void setTopPerformers(List<String> topPerformers) {
		this.topPerformers = topPerformers;
	}
	public List<String> getBottomPerformers() {
		return bottomPerformers;
	}
	public void setBottomPerformers(List<String> bottomPerformers) {
		this.bottomPerformers = bottomPerformers;
	}
	public List<ValueObject> getLegends() {
		return legends;
	}
	public void setLegends(List<ValueObject> legends) {
		this.legends = legends;
	}
	public UtDataCollection(){
		dataCollection = new ArrayList<UtDataModel>();
	}
	@Override
	public String toString() {
		return "UtDataCollection [dataCollection=" + dataCollection
				+ ", legends=" + legends + ", topPerformers=" + topPerformers
				+ ", bottomPerformers=" + bottomPerformers + "]";
	}
	
}