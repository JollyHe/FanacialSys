package com.finacialsys.model.entity;

import java.util.List;

public class UserGroup {
   
	private String groupID;
	private String groupName;
	private int groupSum;
	private String groupMsg;
	
	List<User> users;
	
	public String getGroupID() {
		return groupID;
	}
	public void setGroupID(String groupID) {
		this.groupID = groupID;
	}
	public String getGroupName() {
		return groupName;
	}
	public int getGroupSum() {
		return groupSum;
	}
	public String getGroupMsg() {
		return groupMsg;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public void setGroupSum(int groupSum) {
		this.groupSum = groupSum;
	}
	public void setGroupMsg(String groupMsg) {
		this.groupMsg = groupMsg;
	}
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "UserGroup [groupID=" + groupID + ", groupName=" + groupName + ", groupSum=" + groupSum + ", groupMsg="
				+ groupMsg + ", users=" + users + "]";
	}
}
