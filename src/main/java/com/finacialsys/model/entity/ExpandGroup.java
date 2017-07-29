package com.finacialsys.model.entity;

public class ExpandGroup {
	
	private int outgroupID;
	private String outgroupTime;
	private String outgroupBrief;
	private String outgroupMsg;
	
	private User user;
	
	public int getOutgroupID() {
		return outgroupID;
	}
	public String getOutgroupTime() {
		return outgroupTime;
	}
	public String getOutgroupBrief() {
		return outgroupBrief;
	}
	public String getOutgroupMsg() {
		return outgroupMsg;
	}
	public void setOutgroupID(int outgroupID) {
		this.outgroupID = outgroupID;
	}
	public void setOutgroupTime(String outgroupTime) {
		this.outgroupTime = outgroupTime;
	}
	public void setOutgroupBrief(String outgroupBrief) {
		this.outgroupBrief = outgroupBrief;
	}
	public void setOutgroupMsg(String outgroupMsg) {
		this.outgroupMsg = outgroupMsg;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "ExpandGroup [outgroupID=" + outgroupID + ", outgroupTime=" + outgroupTime + ", outgroupBrief="
				+ outgroupBrief + ", outgroupMsg=" + outgroupMsg + ", user=" + user + "]";
	}
	
}
