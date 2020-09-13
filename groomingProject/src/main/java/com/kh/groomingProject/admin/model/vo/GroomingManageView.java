package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GroomingManageView implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1739529806642097858L;
	private String groomingNo;
	private String groomingType;
	private String groomingTitle;
	private String groomingIntroduce;
	private int groomingParticipants;
	private int groomingCurrentPeople;
	private Date gCalendarEndDate;
	private Date gBoardCreateDate;
	private String groomingStatus;
	
	public GroomingManageView() {
	}
	
	public GroomingManageView(String groomingNo, String groomingType, String groomingTitle, String groomingIntroduce,
			int groomingParticipants, int groomingCurrentPeople, Date gCalendarEndDate, Date gBoardCreateDate,
			String groomingStatus) {
		this.groomingNo = groomingNo;
		this.groomingType = groomingType;
		this.groomingTitle = groomingTitle;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingParticipants = groomingParticipants;
		this.groomingCurrentPeople = groomingCurrentPeople;
		this.gCalendarEndDate = gCalendarEndDate;
		this.gBoardCreateDate = gBoardCreateDate;
		this.groomingStatus = groomingStatus;
	}
	
	public String getGroomingNo() {
		return groomingNo;
	}
	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
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
	public String getGroomingIntroduce() {
		return groomingIntroduce;
	}
	public void setGroomingIntroduce(String groomingIntroduce) {
		this.groomingIntroduce = groomingIntroduce;
	}
	public int getGroomingParticipants() {
		return groomingParticipants;
	}
	public void setGroomingParticipants(int groomingParticipants) {
		this.groomingParticipants = groomingParticipants;
	}
	public int getGroomingCurrentPeople() {
		return groomingCurrentPeople;
	}
	public void setGroomingCurrentPeople(int groomingCurrentPeople) {
		this.groomingCurrentPeople = groomingCurrentPeople;
	}
	public Date getgCalendarEndDate() {
		return gCalendarEndDate;
	}
	public void setgCalendarEndDate(Date gCalendarEndDate) {
		this.gCalendarEndDate = gCalendarEndDate;
	}
	public Date getgBoardCreateDate() {
		return gBoardCreateDate;
	}
	public void setgBoardCreateDate(Date gBoardCreateDate) {
		this.gBoardCreateDate = gBoardCreateDate;
	}
	public String getGroomingStatus() {
		return groomingStatus;
	}
	public void setGroomingStatus(String groomingStatus) {
		this.groomingStatus = groomingStatus;
	}
	
	@Override
	public String toString() {
		return "GroomingManageView [groomingNo=" + groomingNo + ", groomingType=" + groomingType + ", groomingTitle="
				+ groomingTitle + ", groomingIntroduce=" + groomingIntroduce + ", groomingParticipants="
				+ groomingParticipants + ", groomingCurrentPeople=" + groomingCurrentPeople + ", gCalendarEndDate="
				+ gCalendarEndDate + ", gBoardCreateDate=" + gBoardCreateDate + ", groomingStatus=" + groomingStatus
				+ "]";
	}
	

}
