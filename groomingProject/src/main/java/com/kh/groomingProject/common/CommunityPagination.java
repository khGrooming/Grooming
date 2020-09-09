package com.kh.groomingProject.common;

public class CommunityPagination {
	
	/**
	 * 페이지 정보 생성
	 * @param currentPage 현재 페이지 숫자
	 * @param listCount 전체 게시글 갯수
	 * @return
	 */
	public static CommunityPageInfo getPageInfo(int currentPage, int listCount) {
		CommunityPageInfo pi = null;
	      
		int pageLimit = 10; // 페이지 버튼 한번에 보이는 갯수
		int maxPage;		// 전체 페이지 마지막 버튼 숫자
		int startPage;		// 한번에 보이는 버튼들중 첫번째 숫자
		int endPage;		// 한번에 보이는 버튼들중 마지막 숫자
		
		int boardLimit = 5; // 한 화면에 보이는 게시글 갯수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		
		startPage = ((int)((double)currentPage/pageLimit + 0.9) - 1)*pageLimit + 1;
		
		endPage = startPage + (pageLimit -1);
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new CommunityPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
}
