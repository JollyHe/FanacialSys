package com.finacialsys.model.entity;

import java.util.List;

public class PlanMsg {
	private float sumMoney;
	private List<Detail> details;
	
	public float getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(float sumMoney) {
		this.sumMoney = sumMoney;
	}
	public List<Detail> getDetails() {
		return details;
	}
	public void setDetails(List<Detail> details) {
		this.details = details;
	}
	
}
