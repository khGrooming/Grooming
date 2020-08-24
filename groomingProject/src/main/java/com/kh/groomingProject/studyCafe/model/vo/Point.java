package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Point implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4657907337529947269L;
	private String pointNo;
	private String memberNo;
	private int addPoint;
	private String pointList;
	private Date pointDate;
	
	public Point() {
	}
	
	public Point(String pointNo, String memberNo, int addPoint, String pointList, Date pointDate) {
		this.pointNo = pointNo;
		this.memberNo = memberNo;
		this.addPoint = addPoint;
		this.pointList = pointList;
		this.pointDate = pointDate;
	}
	
	public String getPointNo() {
		return pointNo;
	}
	public void setPointNo(String pointNo) {
		this.pointNo = pointNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public int getAddPoint() {
		return addPoint;
	}
	public void setAddPoint(int addPoint) {
		this.addPoint = addPoint;
	}
	public String getPointList() {
		return pointList;
	}
	public void setPointList(String pointList) {
		this.pointList = pointList;
	}
	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	
	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", memberNo=" + memberNo + ", addPoint=" + addPoint + ", pointList="
				+ pointList + ", pointDate=" + pointDate + "]";
	}
	
}
