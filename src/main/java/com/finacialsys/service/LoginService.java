package com.finacialsys.service;

import com.finacialsys.model.entity.User;

public interface LoginService {
	
	User login(String userID, String userPassword);
	
	User logout();
	
	int register(User user);

}
