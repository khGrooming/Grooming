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
	private String groomingImg;			// 그루밍 썸네일 이미지
	private String groomingType;		// 그루밍 타입
	private String groomingTitle;		// 그루밍 제목
	private String groomingIntroduce;	// 한줄소개
	private int groomingP;				// 모집인원
	private int currentP;				// 현재 참가인원
	private int money;					// 예치금
	private Date groomingNd;			// 현재 날짜
	private Date groomingEd;			// 그룹 모집 마감
	private String applyStatus;			// 신청현황
	public MyPageApplicant() {
		super();
	}
	public MyPageApplicant(String gApplyNo, String groomingNo, String groomingImg, String groomingType,
			String groomingTitle, String groomingIntroduce, int groomingP, int currentP, int money, Date groomingNd,
			Date groomingEd, String applyStatus) {
		super();
		this.gApplyNo = gApplyNo;
		this.groomingNo = groomingNo;
		this.groomingImg = groomingImg;
		this.groomingType = groomingType;
		this.groomingTitle = groomingTitle;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingP = groomingP;
		this.currentP = currentP;
		this.money = money;
		this.groomingNd = groomingNd;
		this.groomingEd = groomingEd;
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
	public int getGroomingP() {
		return groomingP;
	}
	public void setGroomingP(int groomingP) {
		this.groomingP = groomingP;
	}
	public int getCurrentP() {
		return currentP;
	}
	public void setCurrentP(int currentP) {
		this.currentP = currentP;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public Date getGroomingNd() {
		return groomingNd;
	}
	public void setGroomingNd(Date groomingNd) {
		this.groomingNd = groomingNd;
	}
	public Date getGroomingEd() {
		return groomingEd;
	}
	public void setGroomingEd(Date groomingEd) {
		this.groomingEd = groomingEd;
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
		return "GroomingApplicant [gApplyNo=" + gApplyNo + ", groomingNo=" + groomingNo + ", groomingImg=" + groomingImg
				+ ", groomingType=" + groomingType + ", groomingTitle=" + groomingTitle + ", groomingIntroduce="
				+ groomingIntroduce + ", groomingP=" + groomingP + ", currentP=" + currentP + ", money=" + money
				+ ", groomingNd=" + groomingNd + ", groomingEd=" + groomingEd + ", applyStatus=" + applyStatus + "]";
	}
	
	
}
