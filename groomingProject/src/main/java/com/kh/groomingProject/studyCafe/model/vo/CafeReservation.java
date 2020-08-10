package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;

public class CafeReservation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -339221778624285408L;

	private String cReserNo;
	private String memberNo;
	private String cPriceNo;
	private int cReserHeadCount;
	private String cReserDate;
	
	public CafeReservation() {
	}
	
	public CafeReservation(String cReserNo, String memberNo, String cPriceNo, int cReserHeadCount, String cReserDate) {
		this.cReserNo = cReserNo;
		this.memberNo = memberNo;
		this.cPriceNo = cPriceNo;
		this.cReserHeadCount = cReserHeadCount;
		this.cReserDate = cReserDate;
	}
	
	public String getcReserNo() {
		return cReserNo;
	}
	public void setcReserNo(String cReserNo) {
		this.cReserNo = cReserNo;
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
	public String getcReserDate() {
		return cReserDate;
	}
	public void setcReserDate(String cReserDate) {
		this.cReserDate = cReserDate;
	}
	
	@Override
	public String toString() {
		return "CafeReservation [cReserNo=" + cReserNo + ", memberNo=" + memberNo + ", cPriceNo=" + cPriceNo
				+ ", cReserHeadCount=" + cReserHeadCount + ", cReserDate=" + cReserDate + "]";
	}
	
}
