package com.finacialsys.model.entity;

import java.util.List;

public class User {
   
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userNickname;
	private String userAddress;
	private String userPic;
	
	private Level level;
	
	private UserGroup userGroup;
	
	private List<Expand> expands;
	
	private List<Income> incomes;
	
	

	public String getUserID() {
		return userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public String getUserPic() {
		return userPic;
	}

	public Level getLevel() {
		return level;
	}

	public UserGroup getUserGroup() {
		return userGroup;
	}

	public List<Expand> getExpands() {
		return expands;
	}

	public List<Income> getIncomes() {
		return incomes;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public void setLevel(Level level) {
		this.level = level;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}

	public void setExpands(List<Expand> expands) {
		this.expands = expands;
	}

	public void setIncomes(List<Income> incomes) {
		this.incomes = incomes;
	}

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName + ", userGender="
				+ userGender + ", userNickname=" + userNickname + ", userAddress=" + userAddress + ", userPic="
				+ userPic + ", level=" + level + ", userGroup=" + userGroup + ", expands=" + expands + ", incomes="
				+ incomes + "]";
	}

}
