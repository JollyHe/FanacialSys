package com.finacialsys.model.entity;

public class IncomeGroup {
   
	private int incomegroupID;
	private String incomegroupTime;
	private String incomegroupBrief;
	private String incomegroupMsg;
	
	private User user;

	public int getIncomegroupID() {
		return incomegroupID;
	}

	public String getIncomegroupTime() {
		return incomegroupTime;
	}

	public String getIncomegroupBrief() {
		return incomegroupBrief;
	}

	public String getIncomegroupMsg() {
		return incomegroupMsg;
	}

	public User getUser() {
		return user;
	}

	public void setIncomegroupID(int incomegroupID) {
		this.incomegroupID = incomegroupID;
	}

	public void setIncomegroupTime(String incomegroupTime) {
		this.incomegroupTime = incomegroupTime;
	}

	public void setIncomegroupBrief(String incomegroupBrief) {
		this.incomegroupBrief = incomegroupBrief;
	}

	public void setIncomegroupMsg(String incomegroupMsg) {
		this.incomegroupMsg = incomegroupMsg;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "IncomeGroup [incomegroupID=" + incomegroupID + ", incomegroupTime=" + incomegroupTime
				+ ", incomegroupBrief=" + incomegroupBrief + ", incomegroupMsg=" + incomegroupMsg + ", user=" + user
				+ "]";
	}
	
}
