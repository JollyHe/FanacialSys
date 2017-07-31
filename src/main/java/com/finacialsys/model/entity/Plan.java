package com.finacialsys.model.entity;

public class Plan {
   
	private int planID;
	private String planName;
	private String beginTime;
	private String endTime;
	private float planMoney;
	private String planMsg;
	
	private User user;

	public int getPlanID() {
		return planID;
	}

	public String getPlanName() {
		return planName;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public float getPlanMoney() {
		return planMoney;
	}

	public String getPlanMsg() {
		return planMsg;
	}

	public User getUser() {
		return user;
	}

	public void setPlanID(int planID) {
		this.planID = planID;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public void setPlanMoney(float planMoney) {
		this.planMoney = planMoney;
	}

	public void setPlanMsg(String planMsg) {
		this.planMsg = planMsg;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Plan [planID=" + planID + ", planName=" + planName + ", beginTime=" + beginTime + ", endTime=" + endTime
				+ ", planMoney=" + planMoney + ", planMsg=" + planMsg + ", user=" + user + "]";
	}
}
