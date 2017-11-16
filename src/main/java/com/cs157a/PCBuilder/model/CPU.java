package com.cs157a.PCBuilder.model;

public class CPU extends Component{
	private int cores;
	private double clockSpeed;
	private int TDP;
	public int getCores() {
		return cores;
	}
	public void setCores(int cores) {
		this.cores = cores;
	}
	public double getClockSpeed() {
		return clockSpeed;
	}
	public void setClockSpeed(double clock_speed) {
		this.clockSpeed = clock_speed;
	}
	public int getTDP() {
		return TDP;
	}
	public void setTDP(int TDP) {
		this.TDP = TDP;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %.2f - %d - %.2f - %d]", id, name, manufacturer,  price, cores, clockSpeed, TDP);
	}
}
