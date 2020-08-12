package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GroomingTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3202751368276354305L;
	
	private String tagNo;	// 태그번호
	private String tagName;	// 태그이름
	private int tagCount;	// 태그카운트
	private Date tagDate;	// 태그 업데이트 날짜
	private String groomingNo;	// 그루밍 번호
	
	public GroomingTag() {
		super();
	}

	public GroomingTag(String tagNo, String tagName, int tagCount, Date tagDate, String groomingNo) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagCount = tagCount;
		this.tagDate = tagDate;
		this.groomingNo = groomingNo;
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
	public String getGroomingNo() {
		return groomingNo;
	}
	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GroomingTag [tagNo=" + tagNo + ", tagName=" + tagName + ", tagCount=" + tagCount + ", tagDate="
				+ tagDate + ", groomingNo=" + groomingNo + "]";
	}
	
	
	
}
