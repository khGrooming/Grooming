package com.kh.groomingProject.community.model.vo;

import java.io.Serializable;

public class Bimages implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6369594959442648318L;
	
	private String imgNo;	// 이미지 번호
	private String boardNo; // 게시물 번호
	private String imgName;	// 이미지 파일 이름
	
	public Bimages() {
	}

	public Bimages(String imgNo, String boardNo, String imgName) {
		this.imgNo = imgNo;
		this.boardNo = boardNo;
		this.imgName = imgName;
	}

	public String getImgNo() {
		return imgNo;
	}

	public void setImgNo(String imgNo) {
		this.imgNo = imgNo;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Bimages [imgNo=" + imgNo + ", boardNo=" + boardNo + ", imgName=" + imgName + "]";
	}
	
	
}