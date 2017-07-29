package com.finacialsys.model.entity;

public class Log {
	
   private int logID;
   private String logName;
   
	public int getLogID() {
		return logID;
	}
	public String getLogName() {
		return logName;
	}
	public void setLogID(int logID) {
		this.logID = logID;
	}
	public void setLogName(String logName) {
		this.logName = logName;
	}
	@Override
	public String toString() {
		return "Log [logID=" + logID + ", logName=" + logName + "]";
	}
   
}
