package com.cs157a.PCBuilder.model;

public class GPU extends Component{
	private String series;
	private String chipset;
	private int memory;
	private double coreClock;
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getChipset() {
		return chipset;
	}
	public void setChipset(String chipset) {
		this.chipset = chipset;
	}
	public int getMemory() {
		return memory;
	}
	public void setMemory(int memory) {
		this.memory = memory;
	}
	public double getCoreClock() {
		return coreClock;
	}
	public void setCoreClock(double coreClock) {
		this.coreClock = coreClock;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %s - %s - %d - %.2f]", id, manufacturer, model,  price, series, chipset, memory, coreClock);
	}
}
