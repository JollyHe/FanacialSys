package com.finacialsys.model.entity;

import java.util.List;

public class LogMoney {
  
	private List<String> logName;
	private List<Double> money;
	public List<String> getLogName() {
		return logName;
	}
	public List<Double> getMoney() {
		return money;
	}
	public void setLogName(List<String> logName) {
		this.logName = logName;
	}
	public void setMoney(List<Double> money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "LogMoney [logName=" + logName + ", money=" + money + "]";
	}
	
}
