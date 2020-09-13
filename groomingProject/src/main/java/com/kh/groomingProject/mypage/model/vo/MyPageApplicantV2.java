package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;

public class MyPageApplicantV2 implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -55951602263710652L;

	private String gApplicantNo;
	private String groomingNo;
	private String groomingTitle;		// 그루밍 제목
	private String groomingIntroduce;	// 그루밍 한줄소개
	private String groomingImg;			// 그루밍 썸네일 이미지
	private String groomingType;		// 그루밍 타입
	private int money;					// 예치금
	private String gaContent;
	private String applyStatus;			// 신청현황
	public MyPageApplicantV2() {
		super();
	}
	public MyPageApplicantV2(String gApplicantNo, String groomingNo, String groomingTitle, String groomingIntroduce,
			String groomingImg, String groomingType, int money, String gaContent, String applyStatus) {
		super();
		this.gApplicantNo = gApplicantNo;
		this.groomingNo = groomingNo;
		this.groomingTitle = groomingTitle;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingImg = groomingImg;
		this.groomingType = groomingType;
		this.money = money;
		this.gaContent = gaContent;
		this.applyStatus = applyStatus;
	}
	public String getgApplicantNo() {
		return gApplicantNo;
	}
	public void setgApplicantNo(String gApplicantNo) {
		this.gApplicantNo = gApplicantNo;
	}
	public String getGroomingNo() {
		return groomingNo;
	}
	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}
	public String getGroomingTitle() {
		return groomingTitle;
	}
	public void setGroomingTitle(String groomingTitle) {
		this.groomingTitle = groomingTitle;
	}
	public String getGroomingIntroduce() {
		return groomingIntroduce;
	}
	public void setGroomingIntroduce(String groomingIntroduce) {
		this.groomingIntroduce = groomingIntroduce;
	}
	public String getGroomingImg() {
		return groomingImg;
	}
	public void setGroomingImg(String groomingImg) {
		this.groomingImg = groomingImg;
	}
	public String getGroomingType() {
		return groomingType;
	}
	public void setGroomingType(String groomingType) {
		this.groomingType = groomingType;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getGaContent() {
		return gaContent;
	}
	public void setGaContent(String gaContent) {
		this.gaContent = gaContent;
	}
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MyPageApplicantV2 [gApplicantNo=" + gApplicantNo + ", groomingNo=" + groomingNo + ", groomingTitle="
				+ groomingTitle + ", groomingIntroduce=" + groomingIntroduce + ", groomingImg=" + groomingImg
				+ ", groomingType=" + groomingType + ", money=" + money + ", gaContent=" + gaContent + ", applyStatus="
				+ applyStatus + "]";
	}
	
	
}
