package com.cs157a.PCBuilder.model;

public class Case extends Component{
	private String type;
	private String psuIncluded;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPsuIncluded() {
		return psuIncluded;
	}
	public void setPsuIncluded(String psuIncluded) {
		this.psuIncluded = psuIncluded;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %s - %s]", id, manufacturer, model,  price, type, psuIncluded);
	}
}
