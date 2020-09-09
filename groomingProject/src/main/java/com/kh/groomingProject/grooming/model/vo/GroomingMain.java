package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingMain implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4318174793636865034L;

	private String groomingNo;			// 그루밍 번호
	private String groomingTitle;		// 그루밍 제목
	private String groomingIntroduce;	// 그루밍 한줄소개
	private String groomingImg;			// 그루밍 썸네일 이미지
	private String groomingType;		// 그루밍 타입
	private int groomingDday;			// 그루밍 모집 남은 기간
	private String groomingTagName;		// 그루밍 태그명
	private int groomingParti;			// 그루밍 최대 인원
	private int groomingMemberCount;	// 그루밍 가입 인원
	private int groomingViewCount;		// 그루밍 조회수

	public GroomingMain() {
		super();
	}
	public GroomingMain(String groomingNo, String groomingTitle, String groomingIntroduce, String groomingImg,
			String groomingType, int groomingDday, String groomingTagName, int groomingParti, int groomingMemberCount,
			int groomingViewCount) {
		super();
		this.groomingNo = groomingNo;
		this.groomingTitle = groomingTitle;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingImg = groomingImg;
		this.groomingType = groomingType;
		this.groomingDday = groomingDday;
		this.groomingTagName = groomingTagName;
		this.groomingParti = groomingParti;
		this.groomingMemberCount = groomingMemberCount;
		this.groomingViewCount = groomingViewCount;
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
	public int getGroomingViewCount() {
		return groomingViewCount;
	}
	public void setGroomingViewCount(int groomingViewCount) {
		this.groomingViewCount = groomingViewCount;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HomeGrooming [groomingNo=" + groomingNo + ", groomingTitle=" + groomingTitle + ", groomingIntroduce="
				+ groomingIntroduce + ", groomingImg=" + groomingImg + ", groomingType=" + groomingType
				+ ", groomingDday=" + groomingDday + ", groomingTagName=" + groomingTagName + ", groomingParti="
				+ groomingParti + ", groomingMemberCount=" + groomingMemberCount + ", groomingViewCount="
				+ groomingViewCount + "]";
	}

}
