package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;

/**
 * @author cooyo
 *
 */
public class MyPagePageInfo implements Serializable{

		
		/**
	 * 
	 */
	private static final long serialVersionUID = -6664607845917109665L;
		private int currentPage;
		private int listCount;
		private int pageLimit;
		private int maxPage;
		private int startPage;
		private int endPage;
		private int GroomingLimit;
		private double f;
		public MyPagePageInfo() {
			super();
		}
	
		public MyPagePageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
				int groomingLimit, double f) {
			super();
			this.currentPage = currentPage;
			this.listCount = listCount;
			this.pageLimit = pageLimit;
			this.maxPage = maxPage;
			this.startPage = startPage;
			this.endPage = endPage;
			GroomingLimit = groomingLimit;
			this.f = f;
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
	
		public int getGroomingLimit() {
			return GroomingLimit;
		}

		public void setGroomingLimit(int groomingLimit) {
			GroomingLimit = groomingLimit;
		}

		public double getF() {
			return f;
		}

		public void setF(double f) {
			this.f = f;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		
		
		@Override
		public String toString() {
			return "MyPagePageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit="
					+ pageLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage
					+ ", openGroomingLimit=" + GroomingLimit + "]";
		}
		
		
		
	
}
