package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;

public class CafeInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3095368155201928186L;
	private String cafeNo;
	private String cafeName;
	private String cafeContent;
	private String cafePhone;
	private String cafeAddress;
	private String cafeImg;
	
	private String cPriceNo;
	private String cRoomName;
	private int cRoomAvailableTime;
	private int cRoomTime;
	private int cRoomPrice;
	private int cRoomHeadCount;
	
	public CafeInfo() {
	}
	
	public CafeInfo(String cafeNo, String cafeName, String cafeContent, String cafePhone, String cafeAddress, String cafeImg) {
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.cafeContent = cafeContent;
		this.cafePhone = cafePhone;
		this.cafeAddress = cafeAddress;
		this.cafeImg = cafeImg;
	}
	
	public CafeInfo(String cPriceNo, String cRoomName, int cRoomAvailableTime, int cRoomTime, int cRoomPrice,
			int cRoomHeadCount) {
		this.cPriceNo = cPriceNo;
		this.cRoomName = cRoomName;
		this.cRoomAvailableTime = cRoomAvailableTime;
		this.cRoomTime = cRoomTime;
		this.cRoomPrice = cRoomPrice;
		this.cRoomHeadCount = cRoomHeadCount;
	}

	public CafeInfo(String cafeNo, String cafeName, String cafeContent, String cafePhone, String cafeAddress,
			String cafeImg, String cPriceNo, String cRoomName, int cRoomAvailableTime, int cRoomTime, int cRoomPrice,
			int cRoomHeadCount) {
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.cafeContent = cafeContent;
		this.cafePhone = cafePhone;
		this.cafeAddress = cafeAddress;
		this.cafeImg = cafeImg;
		this.cPriceNo = cPriceNo;
		this.cRoomName = cRoomName;
		this.cRoomAvailableTime = cRoomAvailableTime;
		this.cRoomTime = cRoomTime;
		this.cRoomPrice = cRoomPrice;
		this.cRoomHeadCount = cRoomHeadCount;
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
	public String getCafeContent() {
		return cafeContent;
	}
	public void setCafeContent(String cafeContent) {
		this.cafeContent = cafeContent;
	}
	public String getCafePhone() {
		return cafePhone;
	}
	public void setCafePhone(String cafePhone) {
		this.cafePhone = cafePhone;
	}
	public String getCafeAddress() {
		return cafeAddress;
	}
	public void setCafeAddress(String cafeAddress) {
		this.cafeAddress = cafeAddress;
	}
	public String getCafeImg() {
		return cafeImg;
	}
	public void setCafeImg(String cafeImg) {
		this.cafeImg = cafeImg;
	}
	public String getcPriceNo() {
		return cPriceNo;
	}
	public void setcPriceNo(String cPriceNo) {
		this.cPriceNo = cPriceNo;
	}
	public String getcRoomName() {
		return cRoomName;
	}
	public void setcRoomName(String cRoomName) {
		this.cRoomName = cRoomName;
	}
	public int getcRoomAvailableTime() {
		return cRoomAvailableTime;
	}
	public void setcRoomAvailableTime(int cRoomAvailableTime) {
		this.cRoomAvailableTime = cRoomAvailableTime;
	}
	public int getcRoomTime() {
		return cRoomTime;
	}
	public void setcRoomTime(int cRoomTime) {
		this.cRoomTime = cRoomTime;
	}
	public int getcRoomPrice() {
		return cRoomPrice;
	}
	public void setcRoomPrice(int cRoomPrice) {
		this.cRoomPrice = cRoomPrice;
	}
	public int getcRoomHeadCount() {
		return cRoomHeadCount;
	}
	public void setcRoomHeadCount(int cRoomHeadCount) {
		this.cRoomHeadCount = cRoomHeadCount;
	}

	@Override
	public String toString() {
		return "CafeInfo [cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafeContent=" + cafeContent + ", cafePhone="
				+ cafePhone + ", cafeAddress=" + cafeAddress + ", cafeImg=" + cafeImg + ", cPriceNo=" + cPriceNo
				+ ", cRoomName=" + cRoomName + ", cRoomAvailableTime=" + cRoomAvailableTime + ", cRoomTime=" + cRoomTime
				+ ", cRoomPrice=" + cRoomPrice + ", cRoomHeadCount=" + cRoomHeadCount + "]";
	}
	
	
	

}
