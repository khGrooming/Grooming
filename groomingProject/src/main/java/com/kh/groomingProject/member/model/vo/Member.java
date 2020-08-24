package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7200797583466611023L;

	private String memberNo;		// 멤버 번호
	private String memberEmail;		// 멤버 이메일
	private String memberPwd;		// 멤버 비밀번호
	private String memberNickName;	// 멤버 닉네임
	private String memberName;		// 멤버 이름
	private String memberGender;	// 멤버 성별
	private String memberPhone;		// 멤버 휴대전화 번호
	private String lvlNo;			// 멤버 레벨
	private int memberExp;			// 멤버 경험치
	private String memberMemo;		// 멤버 한줄 소개
	private String memberPhoto;		// 멤버 프로필 사진
	private String memberAdmin;		// 멤버 관리자 권한
	private String memberStatus;	// 멤버 탈퇴 상태
	private String memberKakao;		// 멤버 카카오 로그인
	private Date memberJoinDate;	// 멤버 가입 날짜

	public Member() {
		super();
	}
	public Member(String memberNo, String memberEmail, String memberPwd, String memberNickName, String memberName,
			String memberGender, String memberPhone, String lvlNo, int memberExp, String memberMemo, String memberPhoto,
			String memberAdmin, String memberStatus, String memberKakao, Date memberJoinDate) {
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
		this.memberKakao = memberKakao;
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
	public String getMemberKakao() {
		return memberKakao;
	}
	public void setMemberKakao(String memberKakao) {
		this.memberKakao = memberKakao;
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
				+ memberStatus + ", memberKakao=" + memberKakao + ", memberJoinDate=" + memberJoinDate + "]";
	}

}
