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
	private Date gCalendarStartDate;
	private Date gBoardModifyDate;
	
	public GroomingManageView() {
	}
	
	public GroomingManageView(String groomingNo, String groomingType, String groomingTitle, String groomingIntroduce,
			int groomingParticipants, int groomingCurrentPeople, Date gCalendarStartDate, Date gBoardModifyDate) {
		this.groomingNo = groomingNo;
		this.groomingType = groomingType;
		this.groomingTitle = groomingTitle;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingParticipants = groomingParticipants;
		this.groomingCurrentPeople = groomingCurrentPeople;
		this.gCalendarStartDate = gCalendarStartDate;
		this.gBoardModifyDate = gBoardModifyDate;
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
	public Date getgCalendarStartDate() {
		return gCalendarStartDate;
	}
	public void setgCalendarStartDate(Date gCalendarStartDate) {
		this.gCalendarStartDate = gCalendarStartDate;
	}
	public Date getgBoardModifyDate() {
		return gBoardModifyDate;
	}
	public void setgBoardModifyDate(Date gBoardModifyDate) {
		this.gBoardModifyDate = gBoardModifyDate;
	}
	
	@Override
	public String toString() {
		return "GroomingManageView [groomingNo=" + groomingNo + ", groomingType=" + groomingType + ", groomingTitle="
				+ groomingTitle + ", groomingIntroduce=" + groomingIntroduce + ", groomingParticipants="
				+ groomingParticipants + ", groomingCurrentPeople=" + groomingCurrentPeople + ", gCalendarStartDate="
				+ gCalendarStartDate + ", gBoardModifyDate=" + gBoardModifyDate + "]";
	}
	
	
}
