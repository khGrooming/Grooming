package com.kh.groomingProject.community.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6369594959442648318L;
	
	private String boardNo;
	private String bCategoryNo;
	private String boardTitle;
	private String memberNo;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private int boardVcount;
	private int boardGcount;
	private String boardStatus;
	private String boardReplyStatus;
	private String boardSelecStatus;
	public Board() {
	}
	public Board(String boardNo, String bCategoryNo, String boardTitle, String memberNo, String boardContent,
			Date boardCreateDate, Date boardModifyDate, int boardVcount, int boardGcount, String boardStatus,
			String boardReplyStatus, String boardSelecStatus) {
		this.boardNo = boardNo;
		this.bCategoryNo = bCategoryNo;
		this.boardTitle = boardTitle;
		this.memberNo = memberNo;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.boardVcount = boardVcount;
		this.boardGcount = boardGcount;
		this.boardStatus = boardStatus;
		this.boardReplyStatus = boardReplyStatus;
		this.boardSelecStatus = boardSelecStatus;
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
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardCreateDate() {
		return boardCreateDate;
	}
	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}
	public Date getBoardModifyDate() {
		return boardModifyDate;
	}
	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}
	public int getBoardVcount() {
		return boardVcount;
	}
	public void setBoardVcount(int boardVcount) {
		this.boardVcount = boardVcount;
	}
	public int getBoardGcount() {
		return boardGcount;
	}
	public void setBoardGcount(int boardGcount) {
		this.boardGcount = boardGcount;
	}
	public String getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}
	public String getBoardReplyStatus() {
		return boardReplyStatus;
	}
	public void setBoardReplyStatus(String boardReplyStatus) {
		this.boardReplyStatus = boardReplyStatus;
	}
	public String getBoardSelecStatus() {
		return boardSelecStatus;
	}
	public void setBoardSelecStatus(String boardSelecStatus) {
		this.boardSelecStatus = boardSelecStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", bCategoryNo=" + bCategoryNo + ", boardTitle=" + boardTitle
				+ ", memberNo=" + memberNo + ", boardContent=" + boardContent + ", boardCreateDate=" + boardCreateDate
				+ ", boardModifyDate=" + boardModifyDate + ", boardVcount=" + boardVcount + ", boardGcount="
				+ boardGcount + ", boardStatus=" + boardStatus + ", boardReplyStatus=" + boardReplyStatus
				+ ", boardSelecStatus=" + boardSelecStatus + "]";
	}
	
	
	
}
