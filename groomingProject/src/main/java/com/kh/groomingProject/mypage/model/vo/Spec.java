package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;

public class Spec implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3115997297377782158L;

	private String specNo;
	private String specCName; //스펙카테고리이름
	private String specName;
	private String specFileName;
	private String memberNo;
	private String specConfirm;
	public Spec() {
	}
	public Spec(String specNo, String specCName, String specName, String specFileName, String memberNo,
			String specConfirm) {
		super();
		this.specNo = specNo;
		this.specCName = specCName;
		this.specName = specName;
		this.specFileName = specFileName;
		this.memberNo = memberNo;
		this.specConfirm = specConfirm;
	}
	public String getSpecNo() {
		return specNo;
	}
	public void setSpecNo(String specNo) {
		this.specNo = specNo;
	}
	public String getSpecCName() {
		return specCName;
	}
	public void setSpecCName(String specCName) {
		this.specCName = specCName;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public String getSpecFileName() {
		return specFileName;
	}
	public void setSpecFileName(String specFileName) {
		this.specFileName = specFileName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getSpecConfirm() {
		return specConfirm;
	}
	public void setSpecConfirm(String specConfirm) {
		this.specConfirm = specConfirm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Spec [specNo=" + specNo + ", specCName=" + specCName + ", specName=" + specName + ", specFileName="
				+ specFileName + ", memberNo=" + memberNo + ", specConfirm=" + specConfirm + "]";
	}

	
	
}
