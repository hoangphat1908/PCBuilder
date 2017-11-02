package com.cs157a.PCBuilder.model;

public class User {
    private String first;
    private String last;
    private String email;
    private String password;
 
 
    public String toString() {
        return String.format("[%s - %s - %s - %s]", first, last, email, password);
    }


	public String getFirst() {
		return first;
	}


	public void setFirst(String first) {
		this.first = first;
	}


	public String getLast() {
		return last;
	}


	public void setLast(String last) {
		this.last = last;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

}