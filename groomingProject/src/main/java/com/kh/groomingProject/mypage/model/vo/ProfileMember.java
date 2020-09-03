package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;

public class ProfileMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3705163037809263486L;
	
	private String memberNo;
	private String memberPhoto;
	private String memberNickName;
	private String lvl;  //memberLevel테이블
	private int memberExp;
	private String lvlMaxExp;
	private String memberEmail;
	private String memberMemo;
	//포인트 추가
	private String nowPoint;
	//스펙추가해야함
	public ProfileMember() {
	}


	public ProfileMember(String memberNo, String memberPhoto, String memberNickName, String lvl, int memberExp,
			String lvlMaxExp, String memberEmail, String memberMemo, String nowPoint) {
		this.memberNo = memberNo;
		this.memberPhoto = memberPhoto;
		this.memberNickName = memberNickName;
		this.lvl = lvl;
		this.memberExp = memberExp;
		this.lvlMaxExp = lvlMaxExp;
		this.memberEmail = memberEmail;
		this.memberMemo = memberMemo;
		this.nowPoint = nowPoint;
	}


	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberPhoto() {
		return memberPhoto;
	}
	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public int getMemberExp() {
		return memberExp;
	}
	public void setMemberExp(int memberExp) {
		this.memberExp = memberExp;
	}
	public String getLvlMaxExp() {
		return lvlMaxExp;
	}
	public void setLvlMaxExp(String lvlMaxExp) {
		this.lvlMaxExp = lvlMaxExp;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberMemo() {
		return memberMemo;
	}
	public void setMemberMemo(String memberMemo) {
		this.memberMemo = memberMemo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getNowPoint() {
		return nowPoint;
	}


	public void setNowPoint(String nowPoint) {
		this.nowPoint = nowPoint;
	}


	@Override
	public String toString() {
		return "ProfileMember [memberNo=" + memberNo + ", memberPhoto=" + memberPhoto + ", memberNickName="
				+ memberNickName + ", lvl=" + lvl + ", memberExp=" + memberExp + ", lvlMaxExp=" + lvlMaxExp
				+ ", memberEmail=" + memberEmail + ", memberMemo=" + memberMemo + ", nowPoint=" + nowPoint + "]";
	}
	
	
	

}
