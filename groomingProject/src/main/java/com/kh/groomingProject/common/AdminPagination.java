package com.kh.groomingProject.common;

import com.kh.groomingProject.common.AdminPageInfo;

public class AdminPagination {
   public static AdminPageInfo getPageInfo(int currentPage, int listCount) {
      AdminPageInfo pi = null;
      
      int pageLimit = 10;
      int maxPage;
      int startPage;
      int endPage;
      
      int boardLimit = 10;
      
      maxPage = (int)((double)listCount/boardLimit + 0.9);
      
      startPage = ((int)((double)currentPage/pageLimit + 0.9) - 1)*pageLimit + 1;
      
      endPage = startPage + (pageLimit - 1);
      
      if(maxPage<endPage) {
         endPage=maxPage;
      }
      
      pi = new AdminPageInfo(currentPage, listCount, pageLimit, maxPage, startPage,
            endPage, boardLimit);
      
      
      return pi;
   }
   
   
   
   
}