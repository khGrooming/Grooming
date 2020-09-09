package com.kh.groomingProject.community.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.common.CommunityPageInfo;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

public interface CommunityService {

	ArrayList<Board> selectList(String bCategoryNo, CommunityPageInfo pi);

	Board selectOne(String boardNo);
	
	int addViewCount(String boardNo);
	
	int communityInsert(Board b, Member member);

	int communityUpdate(Board b, Member member);

	int communityDelete(String boardNo);

	ArrayList<Reply> replySelectList(String boardNo);

	int replyInsert(Reply reply, Member member);

	ArrayList<Board> communityTopList();

	ArrayList<Board> communitySearch(String communitySearch);

	int getListCount(String bCategoryNo);

	int replyUpdate(Reply reply, Member member);

	int replyDelete(Reply reply, Member member);

	

	



















}
