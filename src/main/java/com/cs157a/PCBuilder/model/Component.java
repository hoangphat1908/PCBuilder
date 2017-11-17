package com.cs157a.PCBuilder.model;

public class Component {
	protected int id;
	protected String manufacturer;
	protected String model;
	protected double price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f]", id, manufacturer, model, price);
    }
}
