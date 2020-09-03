package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingAppList implements Serializable{
	
	private String memberNickName;
	private String memberPhoto;
	private String groomingAC;
	private String groomingAN;
	
	public GroomingAppList() {
		super();
	}
	
	
	public GroomingAppList(String memberNickName, String memberPhoto, String groomingAC, String groomingAN) {
		super();
		this.memberNickName = memberNickName;
		this.memberPhoto = memberPhoto;
		this.groomingAC = groomingAC;
		this.groomingAN = groomingAN;
	}

	
	public String getMemberNickName() {
		return memberNickName;
	}


	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}


	public String getMemberPhoto() {
		return memberPhoto;
	}


	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}


	public String getGroomingAC() {
		return groomingAC;
	}


	public void setGroomingAC(String groomingAC) {
		this.groomingAC = groomingAC;
	}


	public String getGroomingAN() {
		return groomingAN;
	}


	public void setGroomingAN(String groomingAN) {
		this.groomingAN = groomingAN;
	}


	@Override
	public String toString() {
		return "GroomingAppList [memberNickName=" + memberNickName + ", memberPhoto=" + memberPhoto + ", groomingAC="
				+ groomingAC + ", groomingAN=" + groomingAN + "]";
	}


	
	
	
}