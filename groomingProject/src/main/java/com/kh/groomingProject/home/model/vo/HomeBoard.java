package com.kh.groomingProject.home.model.vo;

import java.io.Serializable;

public class HomeBoard implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3686554445413609256L;

	private String boardNo;			// 게시판 번호
	private String bCategoryName;	// 게시판 카테고리
	private String boardTitle;		// 게시글 제목
	private String boardContent;	// 게시글 내용
	private int boardVCount;		// 게시글 조회수

	public HomeBoard() {
		super();
	}
	public HomeBoard(String boardNo, String bCategoryName, String boardTitle, String boardContent, int boardVCount) {
		super();
		this.boardNo = boardNo;
		this.bCategoryName = bCategoryName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardVCount = boardVCount;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getbCategoryName() {
		return bCategoryName;
	}
	public void setbCategoryName(String bCategoryName) {
		this.bCategoryName = bCategoryName;
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
	public int getBoardVCount() {
		return boardVCount;
	}
	public void setBoardVCount(int boardVCount) {
		this.boardVCount = boardVCount;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HomeBoard [boardNo=" + boardNo + ", bCategoryName=" + bCategoryName + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardVCount=" + boardVCount + "]";
	}

}
