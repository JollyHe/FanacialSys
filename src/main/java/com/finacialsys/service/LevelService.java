package com.finacialsys.service;

import com.finacialsys.model.entity.User;

public interface LevelService {

	User setLevel(String userID, int levelID);
	
	int getLevel(String userID);
}
