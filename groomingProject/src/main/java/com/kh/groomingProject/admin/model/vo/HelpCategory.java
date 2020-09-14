package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;

public class HelpCategory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9081103769493526789L;
	private String helpCNo;		// 문의 카테고리 번호
	private String helpCName;	// 문의 카테고리 명칭

	public HelpCategory() {
		super();
	}
	public HelpCategory(String helpCNo, String helpCName) {
		super();
		this.helpCNo = helpCNo;
		this.helpCName = helpCName;
	}
	public String getHelpCNo() {
		return helpCNo;
	}
	public void setHelpCNo(String helpCNo) {
		this.helpCNo = helpCNo;
	}
	public String getHelpCName() {
		return helpCName;
	}
	public void setHelpCName(String helpCName) {
		this.helpCName = helpCName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HelpCategory [helpCNo=" + helpCNo + ", helpCName=" + helpCName + "]";
	}

}
