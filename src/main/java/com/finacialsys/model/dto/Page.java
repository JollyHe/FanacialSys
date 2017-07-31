package com.finacialsys.model.dto;

import java.util.List;

public class Page {

	//当前页
	private int current;
	//每页多少数
	private int size = 10;
	//总共多少条数据
	private int count;
	//总共多少页
	private int total;
	//
	private int offset;
	
	
	private List<?> list;
	

	public Page(int current) {
		this.current = current;
		this.offset = (current - 1) * size;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public int getSize() {
		return size;
	}

	private void setSize(int size) {
		this.size = size;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		this.total = count / size + ((count % size) > 0 ? 1 : 0);
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	@Override
	public String toString() {
		return "Page [current=" + current + ", size=" + size + ", count=" + count + ", total=" + total + ", offset="
				+ offset + ", list=" + list + "]";
	}
	
	

}
