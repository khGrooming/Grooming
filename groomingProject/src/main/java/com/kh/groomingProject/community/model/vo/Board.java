package com.kh.groomingProject.community.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6369594959442648318L;
	
	private String boardNo;				// 게시글 번호
	private String memberNo;			// 회원 번호
	private String bCategoryNo;	 		// 카테고리 번호
	private String boardTitle;			// 제목
	private String boardContent;		// 내용
	private Date boardCreateDate;		// 작성날짜
	private Date boardModifyDate; 		// 수정날짜
	private int boardVcount; 			// 조회수
	private int boardGcount; 			// 좋아요 수
	private String boardStatus; 		// 게시 유무 Y 삭제 N
	private String boardReplyStatus; 	// 댓글 유무 Y 삭제 N
	private String boardSelecStatus; 	// 댓글 채택 유무 Y 삭제 N
	private String memberNickName;		// 멤버 닉네임
	private String boardImg;			// 게시판 이미지 
	private String memberPhoto;		// 멤버 프로필 사진
	
	public Board() {
	}

	public Board(String boardNo, String memberNo, String bCategoryNo, String boardTitle, String boardContent,
			Date boardCreateDate, Date boardModifyDate, int boardVcount, int boardGcount, String boardStatus,
			String boardReplyStatus, String boardSelecStatus, String memberNickName, String boardImg,
			String memberPhoto) {
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.bCategoryNo = bCategoryNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.boardVcount = boardVcount;
		this.boardGcount = boardGcount;
		this.boardStatus = boardStatus;
		this.boardReplyStatus = boardReplyStatus;
		this.boardSelecStatus = boardSelecStatus;
		this.memberNickName = memberNickName;
		this.boardImg = boardImg;
		this.memberPhoto = memberPhoto;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public String getBoardImg() {
		return boardImg;
	}

	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", bCategoryNo=" + bCategoryNo + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCreateDate=" + boardCreateDate
				+ ", boardModifyDate=" + boardModifyDate + ", boardVcount=" + boardVcount + ", boardGcount="
				+ boardGcount + ", boardStatus=" + boardStatus + ", boardReplyStatus=" + boardReplyStatus
				+ ", boardSelecStatus=" + boardSelecStatus + ", memberNickName=" + memberNickName + ", boardImg="
				+ boardImg + ", memberPhoto=" + memberPhoto + "]";
	}

	
	
	
}
