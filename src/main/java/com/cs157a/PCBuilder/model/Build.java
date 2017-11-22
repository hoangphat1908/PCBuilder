package com.cs157a.PCBuilder.model;

import java.util.ArrayList;

public class Build {
	private int id;
	private User user;
	private String name;
	private CPU cpu;
	private Motherboard motherboard;
	private GPU gpu;
	private PSU psu;
	private ArrayList<RAM> ramList;
	private ArrayList<Storage> storageList;
	private Cooler cooler;
	private Case computerCase;
	public Build() {
		ramList = new ArrayList<RAM>();
		storageList = new ArrayList<Storage>();
	}
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
	public ArrayList<RAM> getRamList() {
		return ramList;
	}
	public void insertRam(RAM ram) {
		this.ramList.add(ram);
	}
	public ArrayList<Storage> getStorageList() {
		return storageList;
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
}
