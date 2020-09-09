package com.kh.groomingProject.community.model.vo;

public class CommunityFile {
// NoticeFileVO 
	
	private Integer fileNum;
	private Integer noticePK;
	private String fileName;
	private String realName;
	private long size;
	     
	/**
	* 파일 크기를 정형화하기.
	*/
	public String size2String() {
		Integer unit = 1024;
		if (size < unit) {
			return String.format("(%d B)", size);
		}
		int exp = (int) (Math.log(size) / Math.log(unit));
	 
		return String.format("(%.0f %s)", size / Math.pow(unit, exp), "KMGTPE".charAt(exp - 1));
	}

	public CommunityFile() {
	}

	public CommunityFile(Integer fileNum, Integer noticePK, String fileName, String realName, long size) {
		this.fileNum = fileNum;
		this.noticePK = noticePK;
		this.fileName = fileName;
		this.realName = realName;
		this.size = size;
	}

	public Integer getFileNum() {
		return fileNum;
	}

	public void setFileNum(Integer fileNum) {
		this.fileNum = fileNum;
	}

	public Integer getNoticePK() {
		return noticePK;
	}

	public void setNoticePK(Integer noticePK) {
		this.noticePK = noticePK;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "CommunityFile [fileNum=" + fileNum + ", noticePK=" + noticePK + ", fileName=" + fileName + ", realName="
				+ realName + ", size=" + size + "]";
	}
	
	
}
