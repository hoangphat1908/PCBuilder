package com.cs157a.PCBuilder.model;

public class Component {
	protected int id;
	protected String name;
	protected String manufacturer;
	protected double price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
        return String.format("[%d - %s - %s - %.2f]", id, name, manufacturer,  price);
    }

}
