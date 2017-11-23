package com.cs157a.PCBuilder.model;

public class User {
	private int id;
    private String username;
    private String email;
    private String password;
    private String passwordConfirm;
    private int currentBuildId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getCurrentBuildId() {
		return currentBuildId;
	}
	public void setCurrentBuildId(int currentBuildId) {
		this.currentBuildId = currentBuildId;
	}
	@Override
	public String toString() {
        return String.format("[%d - %s - %s - %s]", id, username, email, password);
    }
}