package com.kh.groomingProject.community.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.member.model.vo.Member;

public interface CommunityService {

	ArrayList<Board> selectList(String bCategoryNo);

	Board selectOne(String boardNo);
	
	int addViewCount(String boardNo);
	
	int communityInsert(Board b, Member member);

	int communityUpdate(Board b, Member member);

	int communityDelete(String boardNo);













}
