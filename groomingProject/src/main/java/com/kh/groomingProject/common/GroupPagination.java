package com.kh.groomingProject.common;

import com.kh.groomingProject.grooming.model.vo.GroupPageInfo;

public class GroupPagination {
	public static GroupPageInfo getPageInfo(int currentPage, int listCount) {
		GroupPageInfo pi = null;
		
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		int boardLimit = 10;
		
		maxPage = (int)((double)listCount/boardLimit + 1);
		
		startPage = ((int)((double)currentPage/pageLimit + 0.9) -1)*pageLimit +1;
		
		endPage = startPage + (pageLimit - 1);
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		pi = new GroupPageInfo(currentPage, listCount, pageLimit, maxPage,startPage, endPage, boardLimit);
		
		return pi;
	}

}
