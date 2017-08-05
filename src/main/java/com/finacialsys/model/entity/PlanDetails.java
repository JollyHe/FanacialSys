package com.finacialsys.model.entity;

import java.util.HashMap;

public class PlanDetails {
	private HashMap<String, Float> diff;

	public PlanDetails() {
		this.diff = new HashMap<String, Float>();
	}

	public HashMap<String, Float> getDiff() {
		return diff;
	}

	public void setDiff(HashMap<String, Float> diff) {
		this.diff = diff;
	}

	@Override
	public String toString() {
		return "PlanDetails [diff=" + diff + "]";
	}
	
}	
