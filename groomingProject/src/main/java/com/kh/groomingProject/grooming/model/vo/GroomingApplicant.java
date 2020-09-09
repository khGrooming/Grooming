package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingApplicant implements Serializable{
	    /**
	 * 
	 */
	private static final long serialVersionUID = 6750511955121379350L;
	
		private	String groomingAn;	// 신청 번호
	    private String groomingNo;	// 그루밍 번호
	    private	String memberNo;	// 회원 번호
	    private String groomingAC;	// 신청 내용
 	    private	String groomingAS;	// 신청 상태
 	    
		public GroomingApplicant() {
			super();
		}

		public GroomingApplicant(String groomingAn, String groomingNo, String memberNo, String groomingAC,
				String groomingAS) {
			super();
			this.groomingAn = groomingAn;
			this.groomingNo = groomingNo;
			this.memberNo = memberNo;
			this.groomingAC = groomingAC;
			this.groomingAS = groomingAS;
		}

		public String getGroomingAn() {
			return groomingAn;
		}

		public void setGroomingAn(String groomingAn) {
			this.groomingAn = groomingAn;
		}

		public String getGroomingNo() {
			return groomingNo;
		}

		public void setGroomingNo(String groomingNo) {
			this.groomingNo = groomingNo;
		}

		public String getMemberNo() {
			return memberNo;
		}

		public void setMemberNo(String memberNo) {
			this.memberNo = memberNo;
		}

		public String getGroomingAC() {
			return groomingAC;
		}

		public void setGroomingAC(String groomingAC) {
			this.groomingAC = groomingAC;
		}

		public String getGroomingAS() {
			return groomingAS;
		}

		public void setGroomingAS(String groomingAS) {
			this.groomingAS = groomingAS;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		@Override
		public String toString() {
			return "GroomingApplicant [groomingAn=" + groomingAn + ", groomingNo=" + groomingNo + ", memberNo="
					+ memberNo + ", groomingAC=" + groomingAC + ", groomingAS=" + groomingAS + "]";
		}
 	    
		
 	    
 	    
 	    
	
}
