package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingSpec implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6954577593921102554L;

	private String specNo;			// 스팩 번호
	private String specCNo;			// 스펙 카테고리 번호
	private String specName;		// 스팩 이름
	private String specFileName;	// 스팩 파일 이름
	private String memberNo;		// 회원 번호
	private String specConfirm;		// 인증 상태
	public GroomingSpec() {
		super();
	}
	public GroomingSpec(String specNo, String specCNo, String specName, String specFileName, String memberNo,
			String specConfirm) {
		super();
		this.specNo = specNo;
		this.specCNo = specCNo;
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
	public String getSpecCNo() {
		return specCNo;
	}
	public void setSpecCNo(String specCNo) {
		this.specCNo = specCNo;
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
		return "GroomingSpec [specNo=" + specNo + ", specCNo=" + specCNo + ", specName=" + specName + ", specFileName="
				+ specFileName + ", memberNo=" + memberNo + ", specConfirm=" + specConfirm + "]";
	}
	
	
	
	
	
	
	
	
}
