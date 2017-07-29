package com.finacialsys.model.entity;

import com.finacialsys.model.entity.User;

public class Income {
   
	private int inID;
	private float inMoney;
	private String inTime;
	private String inPlace;
	private String inMessage;
	
	private User user;
	private IncomeGroup incomegroup;
	private Log log;
	private Plan plan;
	
	public int getInID() {
		return inID;
	}
	public float getInMoney() {
		return inMoney;
	}
	public String getInTime() {
		return inTime;
	}
	public String getInPlace() {
		return inPlace;
	}
	public String getInMessage() {
		return inMessage;
	}
	public User getUser() {
		return user;
	}
	public IncomeGroup getIncomegroup() {
		return incomegroup;
	}
	public Log getLog() {
		return log;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setInID(int inID) {
		this.inID = inID;
	}
	public void setInMoney(float inMoney) {
		this.inMoney = inMoney;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public void setInPlace(String inPlace) {
		this.inPlace = inPlace;
	}
	public void setInMessage(String inMessage) {
		this.inMessage = inMessage;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setIncomegroup(IncomeGroup incomegroup) {
		this.incomegroup = incomegroup;
	}
	public void setLog(Log log) {
		this.log = log;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	@Override
	public String toString() {
		return "Income [inID=" + inID + ", inMoney=" + inMoney + ", inTime=" + inTime + ", inPlace=" + inPlace
				+ ", inMessage=" + inMessage + ", user=" + user + ", incomegroup=" + incomegroup + ", log=" + log
				+ ", plan=" + plan + "]";
	}
}
