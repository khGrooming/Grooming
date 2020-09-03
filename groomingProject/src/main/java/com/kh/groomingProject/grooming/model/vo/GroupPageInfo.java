package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroupPageInfo implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4407344215742967146L;
	
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	private int boardLimit;

	
	
	public GroupPageInfo() {
		super();
	}



	public GroupPageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public int getListCount() {
		return listCount;
	}



	public void setListCount(int listCount) {
		this.listCount = listCount;
	}



	public int getPageLimit() {
		return pageLimit;
	}



	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}



	public int getMaxPage() {
		return maxPage;
	}



	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public int getBoardLimit() {
		return boardLimit;
	}



	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "GroupPageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", boardLimit="
				+ boardLimit + "]";
	}
	
	
}
