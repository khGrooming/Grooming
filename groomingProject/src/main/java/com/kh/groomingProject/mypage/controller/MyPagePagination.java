package com.kh.groomingProject.mypage.controller;

import com.kh.groomingProject.mypage.model.vo.MyPagePageInfo;

public class MyPagePagination {
	public static MyPagePageInfo getPageInfo(int currentPage, int listCount, int GroomingLimit,double f) {
		MyPagePageInfo pi = null;
		
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		
		
		maxPage = (int)((double)listCount/GroomingLimit + f);
		
		startPage = ((int)((double)currentPage/pageLimit + f) - 1)*pageLimit + 1;
		
		endPage = startPage + (pageLimit - 1);
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		pi = new MyPagePageInfo(currentPage, listCount, pageLimit, maxPage, startPage,
				endPage, GroomingLimit, f);
		
		
		return pi;
	}
	
}
