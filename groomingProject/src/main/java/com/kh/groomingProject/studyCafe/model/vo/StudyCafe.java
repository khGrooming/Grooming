package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;

public class StudyCafe implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4538833303925069985L;
	private String cafeNo;
	private String cafeName;
	private String cafeContent;
	private String cafePhone;
	private String cafeAddress;
	
	public StudyCafe() {
	}
	
	public StudyCafe(String cafeNo, String cafeName, String cafeContent, String cafePhone, String cafeAddress) {
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.cafeContent = cafeContent;
		this.cafePhone = cafePhone;
		this.cafeAddress = cafeAddress;
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
	
	@Override
	public String toString() {
		return "StudyCafe [cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafeContent=" + cafeContent
				+ ", cafePhone=" + cafePhone + ", cafeAddress=" + cafeAddress + "]";
	}
	
}
