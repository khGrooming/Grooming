package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyPageApplicant implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7974683704130687827L;

	private String gApplyNo;			// 그루밍신청번호
	private String groomingNo;			// 그루밍 번호
	private String groomingTitle;		// 그루밍 제목
	private String groomingIntroduce;	// 그루밍 한줄소개
	private String groomingImg;			// 그루밍 썸네일 이미지
	private String groomingType;		// 그루밍 타입
	private int groomingDday;			// 그루밍 모집 남은 기간
	private String groomingTagName;		// 그루밍 태그명
	private int groomingParti;			// 그루밍 최대 인원
	private int groomingMemberCount;	// 그루밍 가입 인원
	private int money;					// 예치금
	private String applyStatus;			// 신청현황
	
	public MyPageApplicant() {
		super();
	}

	public MyPageApplicant(String gApplyNo, String groomingNo, String groomingTitle, String groomingIntroduce,
			String groomingImg, String groomingType, int groomingDday, String groomingTagName, int groomingParti,
			int groomingMemberCount, int money, String applyStatus) {
		super();
		this.gApplyNo = gApplyNo;
		this.groomingNo = groomingNo;
		this.groomingTitle = groomingTitle;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingImg = groomingImg;
		this.groomingType = groomingType;
		this.groomingDday = groomingDday;
		this.groomingTagName = groomingTagName;
		this.groomingParti = groomingParti;
		this.groomingMemberCount = groomingMemberCount;
		this.money = money;
		this.applyStatus = applyStatus;
	}

	public String getgApplyNo() {
		return gApplyNo;
	}

	public void setgApplyNo(String gApplyNo) {
		this.gApplyNo = gApplyNo;
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

	public int getGroomingDday() {
		return groomingDday;
	}

	public void setGroomingDday(int groomingDday) {
		this.groomingDday = groomingDday;
	}

	public String getGroomingTagName() {
		return groomingTagName;
	}

	public void setGroomingTagName(String groomingTagName) {
		this.groomingTagName = groomingTagName;
	}

	public int getGroomingParti() {
		return groomingParti;
	}

	public void setGroomingParti(int groomingParti) {
		this.groomingParti = groomingParti;
	}

	public int getGroomingMemberCount() {
		return groomingMemberCount;
	}

	public void setGroomingMemberCount(int groomingMemberCount) {
		this.groomingMemberCount = groomingMemberCount;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
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
		return "MyPageApplicant [gApplyNo=" + gApplyNo + ", groomingNo=" + groomingNo + ", groomingTitle="
				+ groomingTitle + ", groomingIntroduce=" + groomingIntroduce + ", groomingImg=" + groomingImg
				+ ", groomingType=" + groomingType + ", groomingDday=" + groomingDday + ", groomingTagName="
				+ groomingTagName + ", groomingParti=" + groomingParti + ", groomingMemberCount=" + groomingMemberCount
				+ ", money=" + money + ", applyStatus=" + applyStatus + "]";
	}
	
	
	
}
