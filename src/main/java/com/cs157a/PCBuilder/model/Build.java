package com.cs157a.PCBuilder.model;

import java.util.List;

public class Build {
	private int id;
	private User user;
	private String name;
	private boolean isPublic;
	private CPU cpu;
	private Motherboard motherboard;
	private GPU gpu;
	private PSU psu;
	private List<RAM> ramList;
	private List<Storage> storageList;
	private Cooler cooler;
	private Case computerCase;
	private double cost;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isPublic() {
		return isPublic;
	}
	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}
	public CPU getCpu() {
		return cpu;
	}
	public void setCpu(CPU cpu) {
		this.cpu = cpu;
	}
	public Motherboard getMotherboard() {
		return motherboard;
	}
	public void setMotherboard(Motherboard motherboard) {
		this.motherboard = motherboard;
	}
	public GPU getGpu() {
		return gpu;
	}
	public void setGpu(GPU gpu) {
		this.gpu = gpu;
	}
	public PSU getPsu() {
		return psu;
	}
	public void setPsu(PSU psu) {
		this.psu = psu;
	}
	public List<RAM> getRamList() {
		return ramList;
	}
	public void setRamList(List<RAM> ramList) {
		this.ramList = ramList;
	}
	public void insertRam(RAM ram) {
		this.ramList.add(ram);
	}
	public List<Storage> getStorageList() {
		return storageList;
	}
	public void setStorageList(List<Storage> storageList) {
		this.storageList = storageList;
	}
	public void insertStorageList(Storage storage) {
		this.storageList.add(storage);
	}
	public Cooler getCooler() {
		return cooler;
	}
	public void setCooler(Cooler cooler) {
		this.cooler = cooler;
	}
	public Case getComputerCase() {
		return computerCase;
	}
	public void setComputerCase(Case computerCase) {
		this.computerCase = computerCase;
	}
	public double getCost() {
		return cost;
	}
	public void calculateCost() {
		double totalCost = 0;
		if (this.cpu != null)
			totalCost += cpu.price;
		if (this.motherboard != null)
			totalCost += motherboard.price;
		if (this.gpu != null)
			totalCost += gpu.price;
		if (this.psu != null)
			totalCost += psu.price;
		if (this.cooler != null)
			totalCost += cooler.price;
		if (this.computerCase != null)
			totalCost += computerCase.price;
		if (this.ramList != null) {
			for (RAM ram : ramList)
				totalCost += ram.getPrice();
		}
		if (this.storageList != null) {
			for (Storage storage : storageList)
				totalCost += storage.getPrice();
		}
		this.cost = Double.parseDouble(String.format("%.2f",totalCost));  
	}
	@Override
	public String toString() {
		return this.name;
	}
}
