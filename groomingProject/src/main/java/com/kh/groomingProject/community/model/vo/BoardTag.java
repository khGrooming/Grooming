package com.kh.groomingProject.community.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3202751368276354305L;
	
	private String tagNo;		// 태그번호
	private String tagName;		// 태그이름
	private int tagCount;		// 태그카운트
	private Date tagDate;		// 태그 업데이트 날짜
	private String boardNo;		// 게시물 번호
	
	public BoardTag() {
	}

	public BoardTag(String tagNo, String tagName, int tagCount, Date tagDate, String boardNo) {
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagCount = tagCount;
		this.tagDate = tagDate;
		this.boardNo = boardNo;
	}

	public String getTagNo() {
		return tagNo;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getTagCount() {
		return tagCount;
	}

	public void setTagCount(int tagCount) {
		this.tagCount = tagCount;
	}

	public Date getTagDate() {
		return tagDate;
	}

	public void setTagDate(Date tagDate) {
		this.tagDate = tagDate;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BoardTag [tagNo=" + tagNo + ", tagName=" + tagName + ", tagCount=" + tagCount + ", tagDate=" + tagDate
				+ ", boardNo=" + boardNo + "]";
	}
	
	

}
