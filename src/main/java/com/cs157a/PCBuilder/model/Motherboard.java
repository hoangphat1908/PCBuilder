package com.cs157a.PCBuilder.model;

public class Motherboard extends Component{
	private String formFactor;
	private String socket;
	private int ramSlots;
	private int ramMax;
	public String getFormFactor() {
		return formFactor;
	}
	public void setFormFactor(String formFactor) {
		this.formFactor = formFactor;
	}
	public String getSocket() {
		return socket;
	}
	public void setSocket(String socket) {
		this.socket = socket;
	}
	public int getRamSlots() {
		return ramSlots;
	}
	public void setRamSlots(int ramSlots) {
		this.ramSlots = ramSlots;
	}
	public int getRamMax() {
		return ramMax;
	}
	public void setRamMax(int ramMax) {
		this.ramMax = ramMax;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %s - %s - %d - %d]", id, manufacturer, model,  price, formFactor, socket, ramSlots, ramMax);
	}
}
