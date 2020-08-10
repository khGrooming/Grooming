package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Grooming implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5400215189960059409L;
	
	private String groomingNo;			// �׷�� ��ȣ
	private String memberNo;			// ȣ��Ʈ ȸ����ȣ
	private String groomingType;		// �׷�Ÿ��
	private String groomingTitle;		// �� ����
	private String groomingContent;		// �� ����
	private String groomingIntroduce;	// ���� �Ұ� 
	private int groomingP;				// ���� �ο�
	private Date studySd;				// ���͵� ���� ��¥
	private Date studyEd;				// ���͵� ���� ��¥
	private Date groomingSd;			// ���� ���� ��¥
	private Date groomingEd;			// ���� ���� ��¥
	private int money;					// ��ġ��
	private String groomingImg;			// �׷� ����
	private Date groomingCd;			// �ۼ���
	private Date groomingMd;			// ������
	private String status;				// �� Ȱ��ȭ ����
	private int count;					// ��ȸ��
	private Date groomingNd;			// ���糯¥
	
	public Grooming() {
		super();
	}

	public Grooming(String groomingNo, String memberNo, String groomingType, String groomingTitle,
			String groomingContent, String groomingIntroduce, int groomingP, Date studySd, Date studyEd,
			Date groomingSd, Date groomingEd, int money, String groomingImg, Date groomingCd, Date groomingMd,
			String status, int count,Date groomingNd) {
		super();
		this.groomingNo = groomingNo;
		this.memberNo = memberNo;
		this.groomingType = groomingType;
		this.groomingTitle = groomingTitle;
		this.groomingContent = groomingContent;
		this.groomingIntroduce = groomingIntroduce;
		this.groomingP = groomingP;
		this.studySd = studySd;
		this.studyEd = studyEd;
		this.groomingSd = groomingSd;
		this.groomingEd = groomingEd;
		this.money = money;
		this.groomingImg = groomingImg;
		this.groomingCd = groomingCd;
		this.groomingMd = groomingMd;
		this.status = status;
		this.count = count;
		this.groomingNd = groomingNd;
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

	public String getGroomingType() {
		return groomingType;
	}

	public void setGroomingType(String groomingType) {
		this.groomingType = groomingType;
	}

	public String getGroomingTitle() {
		return groomingTitle;
	}

	public void setGroomingTitle(String groomingTitle) {
		this.groomingTitle = groomingTitle;
	}

	public String getGroomingContent() {
		return groomingContent;
	}

	public void setGroomingContent(String groomingContent) {
		this.groomingContent = groomingContent;
	}

	public String getGroomingIntroduce() {
		return groomingIntroduce;
	}

	public void setGroomingIntroduce(String groomingIntroduce) {
		this.groomingIntroduce = groomingIntroduce;
	}

	public int getGroomingP() {
		return groomingP;
	}

	public void setGroomingP(int groomingP) {
		this.groomingP = groomingP;
	}

	public Date getStudySd() {
		return studySd;
	}

	public void setStudySd(Date studySd) {
		this.studySd = studySd;
	}

	public Date getStudyEd() {
		return studyEd;
	}

	public void setStudyEd(Date studyEd) {
		this.studyEd = studyEd;
	}

	public Date getGroomingSd() {
		return groomingSd;
	}

	public void setGroomingSd(Date groomingSd) {
		this.groomingSd = groomingSd;
	}

	public Date getGroomingEd() {
		return groomingEd;
	}

	public void setGroomingEd(Date groomingEd) {
		this.groomingEd = groomingEd;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getGroomingImg() {
		return groomingImg;
	}

	public void setGroomingImg(String groomingImg) {
		this.groomingImg = groomingImg;
	}

	public Date getGroomingCd() {
		return groomingCd;
	}

	public void setGroomingCd(Date groomingCd) {
		this.groomingCd = groomingCd;
	}

	public Date getGroomingMd() {
		return groomingMd;
	}

	public void setGroomingMd(Date groomingMd) {
		this.groomingMd = groomingMd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Date getGroomingNd() {
		return groomingNd;
	}

	public void setGroomingNd(Date groomingNd) {
		this.groomingNd = groomingNd;
	}

	@Override
	public String toString() {
		return "Grooming [groomingNo=" + groomingNo + ", memberNo=" + memberNo + ", groomingType=" + groomingType
				+ ", groomingTitle=" + groomingTitle + ", groomingContent=" + groomingContent + ", groomingIntroduce="
				+ groomingIntroduce + ", groomingP=" + groomingP + ", studySd=" + studySd + ", studyEd=" + studyEd
				+ ", groomingSd=" + groomingSd + ", groomingEd=" + groomingEd + ", money=" + money + ", groomingImg="
				+ groomingImg + ", groomingCd=" + groomingCd + ", groomingMd=" + groomingMd + ", status=" + status
				+ ", count=" + count + ", groomingNd=" + groomingNd + "]";
	}

	
	
}
