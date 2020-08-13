package com.kh.groomingProject.tag.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Tag implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5625547431587300511L;

	private String tagNo;	// 태그 번호
	private String tagName;	// 태그 이름
	private int tagCount;	// 태그 카운트
	private Date tagDate;	// 태그 날짜

	public Tag() {
		super();
	}
	public Tag(String tagNo, String tagName, int tagCount, Date tagDate) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagCount = tagCount;
		this.tagDate = tagDate;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + ", tagCount=" + tagCount + ", tagDate=" + tagDate + "]";
	}

}
