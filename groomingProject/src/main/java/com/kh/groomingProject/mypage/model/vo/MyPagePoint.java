package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyPagePoint implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2560523290860792063L;
	
	private String pointNo;
	private String memberNo;
	private int addPoint;
	private int sunPoint;
	private String pointList;
	private Date pointDate;
	public MyPagePoint() {
		super();
	}
	
	
	public MyPagePoint(String memberNo, int addPoint, String pointList) {
		super();
		this.memberNo = memberNo;
		this.addPoint = addPoint;
		this.pointList = pointList;
	}


	public MyPagePoint(String pointNo, String memberNo, int addPoint, int sunPoint, String pointList, Date pointDate) {
		super();
		this.pointNo = pointNo;
		this.memberNo = memberNo;
		this.addPoint = addPoint;
		this.sunPoint = sunPoint;
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
	public int getSunPoint() {
		return sunPoint;
	}
	public void setSunPoint(int sunPoint) {
		this.sunPoint = sunPoint;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MyPagePoint [pointNo=" + pointNo + ", memberNo=" + memberNo + ", addPoint=" + addPoint + ", sunPoint="
				+ sunPoint + ", pointList=" + pointList + ", pointDate=" + pointDate + "]";
	}
	
	
}
