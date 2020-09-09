package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroupMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5319274238455347335L;

	      private String memberPhoto;			// 프로필 사진
	      private String memberNickName;		// 닉네임
	      private String email;					// 이메일
	      private String phone;					// 번호
	      private String memberNo;				// 회원번호
	      private String gMemberNo;				// 호스트 회원번호
	
	      public GroupMember() {
			super();
	      }

		public GroupMember(String memberPhoto, String memberNickName, String email, String phone, String memberNo,
				String gMemberNo) {
			super();
			this.memberPhoto = memberPhoto;
			this.memberNickName = memberNickName;
			this.email = email;
			this.phone = phone;
			this.memberNo = memberNo;
			this.gMemberNo = gMemberNo;
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

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getMemberNo() {
			return memberNo;
		}

		public void setMemberNo(String memberNo) {
			this.memberNo = memberNo;
		}

		public String getgMemberNo() {
			return gMemberNo;
		}

		public void setgMemberNo(String gMemberNo) {
			this.gMemberNo = gMemberNo;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		@Override
		public String toString() {
			return "GroupMember [memberPhoto=" + memberPhoto + ", memberNickName=" + memberNickName + ", email=" + email
					+ ", phone=" + phone + ", memberNo=" + memberNo + ", gMemberNo=" + gMemberNo + "]";
		}

	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
}
