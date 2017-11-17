package com.cs157a.PCBuilder.model;

public class Cooler extends Component{
	private String rpm;
	private String noise;
	public String getRpm() {
		return rpm;
	}
	public void setRpm(String rpm) {
		this.rpm = rpm;
	}
	public String getNoise() {
		return noise;
	}
	public void setNoise(String noise) {
		this.noise = noise;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %s - %s]", id, manufacturer, model,  price, rpm, noise);
	}
}
