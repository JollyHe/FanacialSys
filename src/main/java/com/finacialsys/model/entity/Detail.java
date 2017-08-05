package com.finacialsys.model.entity;

public class Detail {
	
    private int detailID;
    private String detailMsg;
    private float detailMoney;
    
    private Plan plan;
    private Log log;
    
	public int getDetailID() {
		return detailID;
	}
	public String getDetailMsg() {
		return detailMsg;
	}
	public float getDetailMoney() {
		return detailMoney;
	}
	public Plan getPlan() {
		return plan;
	}
	public Log getLog() {
		return log;
	}
	public void setDetailID(int detailID) {
		this.detailID = detailID;
	}
	public void setDetailMsg(String detailMsg) {
		this.detailMsg = detailMsg;
	}
	public void setDetailMoney(float detailMoney) {
		this.detailMoney = detailMoney;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	public void setLog(Log log) {
		this.log = log;
	}
	@Override
	public String toString() {
		return "Detail [detailID=" + detailID + ", detailMsg=" + detailMsg + ", detailMoney=" + detailMoney + ", plan="
				+ plan + ", log=" + log + "]";
	}
}
