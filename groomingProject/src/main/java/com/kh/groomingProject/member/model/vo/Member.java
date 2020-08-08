package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7200797583466611023L;

	private String memberNo;		// ¸â¹ö ¹øÈ£
	private String memberEmail;		// ¸â¹ö ÀÌ¸ÞÀÏ
	private String memberPwd;		// ¸â¹ö ºñ¹Ð¹øÈ£
	private String memberNickName;	// ¸â¹ö ´Ð³×ÀÓ
	private String memberName;		// ¸â¹ö ÀÌ¸§
	private String memberGender;	// ¸â¹ö ¼ºº°
	private String memberPhone;		// ¸â¹ö ÈÞ´ëÀüÈ­ ¹øÈ£
	private String lvlNo;			// ¸â¹ö ·¹º§
	private int memberExp;			// ¸â¹ö °æÇèÄ¡
	private String memberMemo;		// ¸â¹ö ÇÑÁÙ ¼Ò°³
	private String memberPhoto;		// ¸â¹ö ÇÁ·ÎÇÊ »çÁø
	private String memberAdmin;		// ¸â¹ö °ü¸®ÀÚ ±ÇÇÑ
	private String memberStatus;	// ¸â¹ö Å»Åð »óÅÂ
	private Date memberJoinDate;	// ¸â¹ö °¡ÀÔ ³¯Â¥

	public Member() {
		super();
	}
	public Member(String memberNo, String memberEmail, String memberPwd, String memberNickName, String memberName,
			String memberGender, String memberPhone, String lvlNo, int memberExp, String memberMemo, String memberPhoto,
			String memberAdmin, String memberStatus, Date memberJoinDate) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberNickName = memberNickName;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.lvlNo = lvlNo;
		this.memberExp = memberExp;
		this.memberMemo = memberMemo;
		this.memberPhoto = memberPhoto;
		this.memberAdmin = memberAdmin;
		this.memberStatus = memberStatus;
		this.memberJoinDate = memberJoinDate;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getLvlNo() {
		return lvlNo;
	}
	public void setLvlNo(String lvlNo) {
		this.lvlNo = lvlNo;
	}
	public int getMemberExp() {
		return memberExp;
	}
	public void setMemberExp(int memberExp) {
		this.memberExp = memberExp;
	}
	public String getMemberMemo() {
		return memberMemo;
	}
	public void setMemberMemo(String memberMemo) {
		this.memberMemo = memberMemo;
	}
	public String getMemberPhoto() {
		return memberPhoto;
	}
	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	public String getMemberAdmin() {
		return memberAdmin;
	}
	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public Date getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberNickName=" + memberNickName + ", memberName=" + memberName + ", memberGender=" + memberGender
				+ ", memberPhone=" + memberPhone + ", lvlNo=" + lvlNo + ", memberExp=" + memberExp + ", memberMemo="
				+ memberMemo + ", memberPhoto=" + memberPhoto + ", memberAdmin=" + memberAdmin + ", memberStatus="
				+ memberStatus + ", memberJoinDate=" + memberJoinDate + "]";
	}

}
