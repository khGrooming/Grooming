package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Grooming implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5400215189960059409L;
	
	private String groomingNo;			// 그루밍 번호
	private String memberNo;			// 호스트 번호
	private String groomingType;		// 그루밍 타입
	private String groomingTitle;		// 그루밍 제목
	private String groomingContent;		// 그루밍 내용
	private String groomingIntroduce;	// 한줄소개
	private int groomingP;				// 참가인원
	private Date studySd;				// 스터디 시작일
	private Date studyEd;				// 스터디 종강일
	private Date groomingSd;			// 그룹 모집 시작
	private Date groomingEd;			// 그룹 모집 마감
	private String money;					// 예치금
	private String groomingImg;			// 그루밍 썸네일 이미지
	private Date groomingCd;			// 작성일
	private Date groomingMd;			// 수정일
	private String status;				// 글 상태
	private int count;					// 조회수
	private Date groomingNd;			// 현재 날짜
	private int currentP;				// 현재 참가인원

	
	public Grooming() {
		super();
	}
	











	public Grooming(String groomingNo, String memberNo) {
		super();
		this.groomingNo = groomingNo;
		this.memberNo = memberNo;
	}












	public Grooming(String groomingNo, String memberNo, String groomingType, String groomingTitle,
			String groomingContent, String groomingIntroduce, int groomingP, Date studySd, Date studyEd,
			Date groomingSd, Date groomingEd, String money, String groomingImg, Date groomingCd, Date groomingMd,
			String status, int count, Date groomingNd, int currentP) {
		super();
		this.groomingNo = groomingNo;
		this.memberNo = memberNo;
		this.groomingType = groomingType;
		this.groomingTitle = groomingTitle;
		this.groomingContent = groomingContent;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingP = groomingP;
		this.studySd = studySd;
		this.studyEd = studyEd;
		this.groomingSd = groomingSd;
		this.groomingEd = groomingEd;
		this.money = money;
		this.groomingImg = groomingImg;
		this.groomingCd = groomingCd;
		this.groomingMd = groomingMd;
		this.status = status;
		this.count = count;
		this.groomingNd = groomingNd;
		this.currentP = currentP;
	}












	public String getGroomingNo() {
		return groomingNo;
	}












	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}












	public String getMemberNo() {
		return memberNo;
	}












	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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












	public String getGroomingContent() {
		return groomingContent;
	}












	public void setGroomingContent(String groomingContent) {
		this.groomingContent = groomingContent;
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












	public Date getStudySd() {
		return studySd;
	}












	public void setStudySd(Date studySd) {
		this.studySd = studySd;
	}












	public Date getStudyEd() {
		return studyEd;
	}












	public void setStudyEd(Date studyEd) {
		this.studyEd = studyEd;
	}












	public Date getGroomingSd() {
		return groomingSd;
	}












	public void setGroomingSd(Date groomingSd) {
		this.groomingSd = groomingSd;
	}












	public Date getGroomingEd() {
		return groomingEd;
	}












	public void setGroomingEd(Date groomingEd) {
		this.groomingEd = groomingEd;
	}












	public String getMoney() {
		return money;
	}












	public void setMoney(String money) {
		this.money = money;
	}












	public String getGroomingImg() {
		return groomingImg;
	}












	public void setGroomingImg(String groomingImg) {
		this.groomingImg = groomingImg;
	}












	public Date getGroomingCd() {
		return groomingCd;
	}












	public void setGroomingCd(Date groomingCd) {
		this.groomingCd = groomingCd;
	}












	public Date getGroomingMd() {
		return groomingMd;
	}












	public void setGroomingMd(Date groomingMd) {
		this.groomingMd = groomingMd;
	}












	












	public String getStatus() {
		return status;
	}












	public void setStatus(String status) {
		this.status = status;
	}












	public int getCount() {
		return count;
	}












	public void setCount(int count) {
		this.count = count;
	}












	public Date getGroomingNd() {
		return groomingNd;
	}












	public void setGroomingNd(Date groomingNd) {
		this.groomingNd = groomingNd;
	}












	public int getCurrentP() {
		return currentP;
	}












	public void setCurrentP(int currentP) {
		this.currentP = currentP;
	}












	public static long getSerialversionuid() {
		return serialVersionUID;
	}












	@Override
	public String toString() {
		return "Grooming [groomingNo=" + groomingNo + ", memberNo=" + memberNo + ", groomingType=" + groomingType
				+ ", groomingTitle=" + groomingTitle + ", groomingContent=" + groomingContent + ", groomingIntroduce="
				+ groomingIntroduce + ", groomingP=" + groomingP + ", studySd=" + studySd + ", studyEd=" + studyEd
				+ ", groomingSd=" + groomingSd + ", groomingEd=" + groomingEd + ", money=" + money + ", groomingImg="
				+ groomingImg + ", groomingCd=" + groomingCd + ", groomingMd=" + groomingMd + ", status=" + status
				+ ", count=" + count + ", groomingNd=" + groomingNd + ", currentP=" + currentP + "]";
	}












	










	

	
}
