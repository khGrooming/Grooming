package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GroupBoard implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2861093016053936535L;

	private String gBoardNo;			// 그루밍게시판번호(GB00001)
	private String gMemberNo;			// 그루밍멤버번호(GM00001)
	private String gBoardCategory;		// 그루밍카테고리(자유/공지)
	private String gBoardTitle;			// 그루밍 소게시판 제목
	private String gBoardContent;		// 그루밍 소게시판 내용
	private int count;					// 그루밍 소게시판 조회수
	private Date createDate;			// 그루밍 소게시판 작성일
	private Date modifyDate;			// 그루밍 소게시판 수정일
	private String gBoardImg;			// 그루밍 소게시판 이미지
	private String memberNickName;		// 작성자 이름
	public GroupBoard() {
		super();
	}
	
	
	public GroupBoard(String gBoardNo, String gMemberNo, String gBoardCategory, String gBoardTitle,
			String gBoardContent, int count, Date createDate, Date modifyDate, String gBoardImg,
			String memberNickName) {
		super();
		this.gBoardNo = gBoardNo;
		this.gMemberNo = gMemberNo;
		this.gBoardCategory = gBoardCategory;
		this.gBoardTitle = gBoardTitle;
		this.gBoardContent = gBoardContent;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.gBoardImg = gBoardImg;
		this.memberNickName = memberNickName;
	}


	public GroupBoard(String gBoardNo, String gMemberNo, String gBoardCategory, String gBoardTitle,
			String gBoardContent, int count, Date createDate, Date modifyDate, String gBoardImg) {
		super();
		this.gBoardNo = gBoardNo;
		this.gMemberNo = gMemberNo;
		this.gBoardCategory = gBoardCategory;
		this.gBoardTitle = gBoardTitle;
		this.gBoardContent = gBoardContent;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.gBoardImg = gBoardImg;
	}

	
	public String getMemberNickName() {
		return memberNickName;
	}


	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}


	public String getgBoardNo() {
		return gBoardNo;
	}

	public void setgBoardNo(String gBoardNo) {
		this.gBoardNo = gBoardNo;
	}

	public String getgMemberNo() {
		return gMemberNo;
	}

	public void setgMemberNo(String gMemberNo) {
		this.gMemberNo = gMemberNo;
	}

	public String getgBoardCategory() {
		return gBoardCategory;
	}

	public void setgBoardCategory(String gBoardCategory) {
		this.gBoardCategory = gBoardCategory;
	}

	public String getgBoardTitle() {
		return gBoardTitle;
	}

	public void setgBoardTitle(String gBoardTitle) {
		this.gBoardTitle = gBoardTitle;
	}

	public String getgBoardContent() {
		return gBoardContent;
	}

	public void setgBoardContent(String gBoardContent) {
		this.gBoardContent = gBoardContent;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getgBoardImg() {
		return gBoardImg;
	}

	public void setgBoardImg(String gBoardImg) {
		this.gBoardImg = gBoardImg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GroupBoard [gBoardNo=" + gBoardNo + ", gMemberNo=" + gMemberNo + ", gBoardCategory=" + gBoardCategory
				+ ", gBoardTitle=" + gBoardTitle + ", gBoardContent=" + gBoardContent + ", count=" + count
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", gBoardImg=" + gBoardImg
				+ ", memberNickName=" + memberNickName + "]";
	}

	
	
	
	
	
	
	
	
	
}
