package com.kh.groomingProject.common;

import com.kh.groomingProject.grooming.model.vo.GroomingPageInfo;

public class GroomingPagination {
	public static GroomingPageInfo getPageInfoG(int currentPage, int listCount) {
		GroomingPageInfo pi = null;
		
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		int boardLimit = 8;
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		
		startPage = ((int)((double)currentPage/pageLimit + 0.9) -1)*pageLimit +1;
		
		endPage = startPage + (pageLimit - 1);
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		pi = new GroomingPageInfo(currentPage, listCount, pageLimit, maxPage,startPage, endPage, boardLimit);
		
		return pi;
	}
}
