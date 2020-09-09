package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GReply implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1883302961936838882L;

	private String gReplyNo;				//	그루밍댓글번호(GBR0001)
	private String gBoardNo;				//	그루밍게시판번호(GB0001)
	private String gMemberNo;				//	그루밍멤버번호(GM00001)
	private String gReplyContent;			//	댓글내용
	private Date gReplyCreateDate;			//	댓글 작성날짜
	private String memberNickName;			//	멤버 닉네임
	private String memberPhoto;				//	멤버 이미지
	
	
	public GReply() {
		super();
	}
	
	
	public GReply(String gReplyNo, String gBoardNo, String gMemberNo, String gReplyContent, Date gReplyCreateDate,
			String memberNickName, String memberPhoto) {
		super();
		this.gReplyNo = gReplyNo;
		this.gBoardNo = gBoardNo;
		this.gMemberNo = gMemberNo;
		this.gReplyContent = gReplyContent;
		this.gReplyCreateDate = gReplyCreateDate;
		this.memberNickName = memberNickName;
		this.memberPhoto = memberPhoto;
	}
	
	
	public String getgReplyNo() {
		return gReplyNo;
	}
	public void setgReplyNo(String gReplyNo) {
		this.gReplyNo = gReplyNo;
	}
	public String getgBoardNo() {
		return gBoardNo;
	}
	public void setgBoardNo(String gBoardNo) {
		this.gBoardNo = gBoardNo;
	}
	public String getgMemberNo() {
		return gMemberNo;
	}
	public void setgMemberNo(String gMemberNo) {
		this.gMemberNo = gMemberNo;
	}
	public String getgReplyContent() {
		return gReplyContent;
	}
	public void setgReplyContent(String gReplyContent) {
		this.gReplyContent = gReplyContent;
	}
	public Date getgReplyCreateDate() {
		return gReplyCreateDate;
	}
	public void setgReplyCreateDate(Date gReplyCreateDate) {
		this.gReplyCreateDate = gReplyCreateDate;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "GReply [gReplyNo=" + gReplyNo + ", gBoardNo=" + gBoardNo + ", gMemberNo=" + gMemberNo
				+ ", gReplyContent=" + gReplyContent + ", gReplyCreateDate=" + gReplyCreateDate + ", memberNickName="
				+ memberNickName + ", memberPhoto=" + memberPhoto + "]";
	}
	
	
	
	
	
	
	
	
	
}
