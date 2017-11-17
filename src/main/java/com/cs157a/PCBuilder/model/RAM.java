package com.cs157a.PCBuilder.model;

public class RAM extends Component{
	private int size;
	private String module;
	private String type;
	private String speed;
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSpeed() {
		return speed;
	}
	public void setSpeed(String speed) {
		this.speed = speed;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %d - %s - %s - %s]", id, manufacturer, model,  price, size, module, type, speed);
	}
}
