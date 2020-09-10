package com.kh.groomingProject.admin.model.vo;

import java.sql.Date;

public class GraphListCount {
	private Date lastDay;
	private int count;
	
	public GraphListCount() {
	}
	
	public GraphListCount(Date lastDay, int count) {
		this.lastDay = lastDay;
		this.count = count;
	}
	
	public Date getLastDay() {
		return lastDay;
	}
	public void setLastDay(Date lastDay) {
		this.lastDay = lastDay;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "GraphListCount [lastDay=" + lastDay + ", count=" + count + "]";
	}
	
	
}
