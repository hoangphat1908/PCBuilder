package com.cs157a.PCBuilder.model;

public class PSU extends Component{
	private String series;
	private String formFactor;
	private String watts;
	private String efficiency;
	private String modular;
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getFormFactor() {
		return formFactor;
	}
	public void setFormFactor(String formFactor) {
		this.formFactor = formFactor;
	}
	public String getWatts() {
		return watts;
	}
	public void setWatts(String watts) {
		this.watts = watts;
	}
	public String getEfficiency() {
		return efficiency;
	}
	public void setEfficiency(String efficiency) {
		this.efficiency = efficiency;
	}
	public String getModular() {
		return modular;
	}
	public void setModular(String modular) {
		this.modular = modular;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %s - %s - %s - %s - %s]", id, manufacturer, model,  price, series, formFactor, watts, efficiency, modular);
	}
}
