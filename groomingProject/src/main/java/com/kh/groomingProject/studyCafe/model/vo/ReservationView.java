package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReservationView implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -175141470770778751L;
	
	private String cReserNo;
	private String memberNo;
	private String cPriceNo;
	private int cReserHeadCount;
	private String cReserDate;
	private String cReserSTime;
	private String cReserETime;
	private String cafeNo;
	private String cafeName;
	private String cafePhone;
	private String cRoomName;
	private String cRoomPrice;
	private String cafeAddress;
	
	public ReservationView() {
	}

	public ReservationView(String cReserNo, String memberNo, String cPriceNo, int cReserHeadCount, String cReserDate,
			String cReserSTime, String cReserETime, String cafeNo, String cafeName, String cafePhone, String cRoomName,
			String cRoomPrice, String cafeAddress) {
		this.cReserNo = cReserNo;
		this.memberNo = memberNo;
		this.cPriceNo = cPriceNo;
		this.cReserHeadCount = cReserHeadCount;
		this.cReserDate = cReserDate;
		this.cReserSTime = cReserSTime;
		this.cReserETime = cReserETime;
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.cafePhone = cafePhone;
		this.cRoomName = cRoomName;
		this.cRoomPrice = cRoomPrice;
		this.cafeAddress = cafeAddress;
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

	public String getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(String cafeNo) {
		this.cafeNo = cafeNo;
	}

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getCafePhone() {
		return cafePhone;
	}

	public void setCafePhone(String cafePhone) {
		this.cafePhone = cafePhone;
	}

	public String getcRoomName() {
		return cRoomName;
	}

	public void setcRoomName(String cRoomName) {
		this.cRoomName = cRoomName;
	}

	public String getcRoomPrice() {
		return cRoomPrice;
	}

	public void setcRoomPrice(String cRoomPrice) {
		this.cRoomPrice = cRoomPrice;
	}

	public String getCafeAddress() {
		return cafeAddress;
	}

	public void setCafeAddress(String cafeAddress) {
		this.cafeAddress = cafeAddress;
	}

	@Override
	public String toString() {
		return "ReservationView [cReserNo=" + cReserNo + ", memberNo=" + memberNo + ", cPriceNo=" + cPriceNo
				+ ", cReserHeadCount=" + cReserHeadCount + ", cReserDate=" + cReserDate + ", cReserSTime=" + cReserSTime
				+ ", cReserETime=" + cReserETime + ", cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafePhone="
				+ cafePhone + ", cRoomName=" + cRoomName + ", cRoomPrice=" + cRoomPrice + ", cafeAddress=" + cafeAddress
				+ "]";
	}
	
}
