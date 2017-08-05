package com.finacialsys.model.entity;

public class SumMoney {
   
	private String headTime;
	private String tailTime;
	private String userID;
	private int logID;
	
	public String getHeadTime() {
		return headTime;
	}
	public String getTailTime() {
		return tailTime;
	}
	public String getUserID() {
		return userID;
	}
	public int getLogID() {
		return logID;
	}
	public void setHeadTime(String headTime) {
		this.headTime = headTime;
	}
	public void setTailTime(String tailTime) {
		this.tailTime = tailTime;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setLogID(int logID) {
		this.logID = logID;
	}
	@Override
	public String toString() {
		return "SumMoney [headTime=" + headTime + ", tailTime=" + tailTime + ", userID=" + userID + ", logID=" + logID
				+ "]";
	}
	
}
