package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyPageGrooming implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 51930682170364121L;

	private String gMemberNo;
	private String groomingNo;			// 그루밍 번호
	private String groomingType;
	private String groomingImg;			// 그루밍 썸네일 이미지
	private String groomingTitle;		// 그루밍 제목
	private Date groomingNd;			// 현재 날짜
	private Date groomingEd;			// 그룹 끝나는 날짜
	public MyPageGrooming() {
		super();
	}
	public MyPageGrooming(String gMemberNo, String groomingNo, String groomingType, String groomingImg,
			String groomingTitle, Date groomingNd, Date groomingEd) {
		super();
		this.gMemberNo = gMemberNo;
		this.groomingNo = groomingNo;
		this.groomingType = groomingType;
		this.groomingImg = groomingImg;
		this.groomingTitle = groomingTitle;
		this.groomingNd = groomingNd;
		this.groomingEd = groomingEd;
	}
	public String getgMemberNo() {
		return gMemberNo;
	}
	public void setgMemberNo(String gMemberNo) {
		this.gMemberNo = gMemberNo;
	}
	public String getGroomingNo() {
		return groomingNo;
	}
	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}
	public String getGroomingType() {
		return groomingType;
	}
	public void setGroomingType(String groomingType) {
		this.groomingType = groomingType;
	}
	public String getGroomingImg() {
		return groomingImg;
	}
	public void setGroomingImg(String groomingImg) {
		this.groomingImg = groomingImg;
	}
	public String getGroomingTitle() {
		return groomingTitle;
	}
	public void setGroomingTitle(String groomingTitle) {
		this.groomingTitle = groomingTitle;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MyPageGrooming [gMemberNo=" + gMemberNo + ", groomingNo=" + groomingNo + ", groomingType="
				+ groomingType + ", groomingImg=" + groomingImg + ", groomingTitle=" + groomingTitle + ", groomingNd="
				+ groomingNd + ", groomingEd=" + groomingEd + "]";
	}

	
}
