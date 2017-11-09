package com.cs157a.PCBuilder.service;

public interface SecurityService {
    public String findLoggedInUsername();
    public void autologin(String username, String password);
}
