package com.finacialsys.model.entity;

import com.finacialsys.model.entity.User;

public class Expand {
	
	private int outID;
	private float outMoney;
	private String outTime;
	private String outPlace;
	private String outMessage;
	
	private User user;
	private ExpandGroup expandgroup;
	private Log log;
	private Plan plan;
	
	public int getOutID() {
		return outID;
	}
	public float getOutMoney() {
		return outMoney;
	}
	public String getOutTime() {
		return outTime;
	}
	public String getOutPlace() {
		return outPlace;
	}
	public String getOutMessage() {
		return outMessage;
	}
	public User getUser() {
		return user;
	}
	public ExpandGroup getExpandgroup() {
		return expandgroup;
	}
	public Log getLog() {
		return log;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setOutID(int outID) {
		this.outID = outID;
	}
	public void setOutMoney(float outMoney) {
		this.outMoney = outMoney;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	public void setOutPlace(String outPlace) {
		this.outPlace = outPlace;
	}
	public void setOutMessage(String outMessage) {
		this.outMessage = outMessage;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setExpandgroup(ExpandGroup expandgroup) {
		this.expandgroup = expandgroup;
	}
	public void setLog(Log log) {
		this.log = log;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	@Override
	public String toString() {
		return "Expand [outID=" + outID + ", outMoney=" + outMoney + ", outTime=" + outTime + ", outPlace=" + outPlace
				+ ", outMessage=" + outMessage + ", user=" + user + ", expandgroup=" + expandgroup + ", log=" + log
				+ ", plan=" + plan + "]";
	}
	
}
