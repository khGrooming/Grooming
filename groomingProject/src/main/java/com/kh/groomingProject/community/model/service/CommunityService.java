package com.kh.groomingProject.community.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.community.model.vo.Board;

public interface CommunityService {

	ArrayList<Board> selectList();

	Board selectOne(String boardNo);
	
	int noticeInsert(Board b);

	int noticeUpdate(Board b);

	int noticeDelete(String boardNo);

	int addViewCount(String boardNo);

	ArrayList<Board> selectListFB();

	Board selectOneFB(String boardNo);








}
