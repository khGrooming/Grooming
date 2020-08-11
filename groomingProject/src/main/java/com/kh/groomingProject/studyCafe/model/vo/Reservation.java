package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 419661200620588506L;
	
	private String cReserNo;
	private String memberNo;
	private String cPriceNo;
	private int cReserHeadCount;
	private Date cReserDate;
	private String cReserSTime;
	private String cReserETime;
	
	public Reservation() {
	}
	
	public Reservation(String creserNo, String memberNo, String cPriceNo, int cReserHeadCount, Date cReserDate,
			String cReserSTime, String cReserETime) {
		this.cReserNo = creserNo;
		this.memberNo = memberNo;
		this.cPriceNo = cPriceNo;
		this.cReserHeadCount = cReserHeadCount;
		this.cReserDate = cReserDate;
		this.cReserSTime = cReserSTime;
		this.cReserETime = cReserETime;
	}
	
	public String getCreserNo() {
		return cReserNo;
	}
	public void setCreserNo(String creserNo) {
		this.cReserNo = creserNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getcPriceNo() {
		return cPriceNo;
	}
	public void setcPriceNo(String cPriceNo) {
		this.cPriceNo = cPriceNo;
	}
	public int getcReserHeadCount() {
		return cReserHeadCount;
	}
	public void setcReserHeadCount(int cReserHeadCount) {
		this.cReserHeadCount = cReserHeadCount;
	}
	public Date getcReserDate() {
		return cReserDate;
	}
	public void setcReserDate(Date cReserDate) {
		this.cReserDate = cReserDate;
	}
	public String getcReserSTime() {
		return cReserSTime;
	}
	public void setcReserSTime(String cReserSTime) {
		this.cReserSTime = cReserSTime;
	}
	public String getcReserETime() {
		return cReserETime;
	}
	public void setcReserETime(String cReserETime) {
		this.cReserETime = cReserETime;
	}
	
	@Override
	public String toString() {
		return "Reservation [cReserNo=" + cReserNo + ", memberNo=" + memberNo + ", cPriceNo=" + cPriceNo
				+ ", cReserHeadCount=" + cReserHeadCount + ", cReserDate=" + cReserDate + ", cReserSTime=" + cReserSTime
				+ ", cReserETime=" + cReserETime + "]";
	}
	
	
}
