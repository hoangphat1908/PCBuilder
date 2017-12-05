package com.cs157a.PCBuilder.model;

public class Storage extends Component{
	private String type;
	private String form;
	private String series;
	private String capacity;
	private String cache;
	@Override
	public String getName() {
		return manufacturer+" - "+series+" "+capacity+" "+form+" "+type;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getCache() {
		return cache;
	}
	public void setCache(String cache) {
		this.cache = cache;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %s - %s - %s - %s - %s]", id, manufacturer, model,  price, type, form, series, capacity, cache);
	}
}
