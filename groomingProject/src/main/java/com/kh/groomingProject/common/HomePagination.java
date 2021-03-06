package com.kh.groomingProject.common;

import com.kh.groomingProject.home.model.vo.HomePageInfo;

public class HomePagination {

	public static HomePageInfo getPageInfo(int currentPage, int listCount, int boardLimit) {
		HomePageInfo pi = null;
		
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		//int boardLimit = 8;
		
		maxPage = (int)((double)listCount/boardLimit + 1);
		
		startPage = ((int)((double)currentPage/pageLimit + 0.9) -1)*pageLimit +1;
		
		endPage = startPage + (pageLimit - 1);
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		pi = new HomePageInfo(currentPage, listCount, pageLimit, maxPage,startPage, endPage, boardLimit);
		
		return pi;
	}

}
