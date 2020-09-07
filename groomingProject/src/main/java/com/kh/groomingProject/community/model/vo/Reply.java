package com.kh.groomingProject.community.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8072280151862125473L;
	
	private String replyNo;			// 댓글 번호
	private String boardNo;			// 게시글 번호
	private String bCategoryNo;		// 카테고리 번호
	private String memberNo;		// 회원 번호 
	private String replyContent;	// 내용
	private Date replyCreateDate;	// 작성날짜
	private Date replyModifyDate;	// 수정날짜
	private String replySelection;	// 댓글 채택 Y
	private String replyStatus;		// 댓글 공개유무 (개시중 Y 비공개 N) 
	private int declarationCount;	// 신고횟수
	private String memberNickName;	// 멤버 닉네임
	
	public Reply() {
	}

	public Reply(String replyNo, String boardNo, String bCategoryNo, String memberNo, String replyContent,
			Date replyCreateDate, Date replyModifyDate, String replySelection, String replyStatus, int declarationCount,
			String memberNickName) {
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.bCategoryNo = bCategoryNo;
		this.memberNo = memberNo;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replySelection = replySelection;
		this.replyStatus = replyStatus;
		this.declarationCount = declarationCount;
		this.memberNickName = memberNickName;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getbCategoryNo() {
		return bCategoryNo;
	}

	public void setbCategoryNo(String bCategoryNo) {
		this.bCategoryNo = bCategoryNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Date getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public String getReplySelection() {
		return replySelection;
	}

	public void setReplySelection(String replySelection) {
		this.replySelection = replySelection;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getDeclarationCount() {
		return declarationCount;
	}

	public void setDeclarationCount(int declarationCount) {
		this.declarationCount = declarationCount;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", bCategoryNo=" + bCategoryNo + ", memberNo="
				+ memberNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replySelection=" + replySelection + ", replyStatus="
				+ replyStatus + ", declarationCount=" + declarationCount + ", memberNickName=" + memberNickName + "]";
	}
	
	

}
