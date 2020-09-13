package com.kh.groomingProject.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.common.CommunityPageInfo;
import com.kh.groomingProject.community.model.dao.CommunityDao;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

@Service("cService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityDao cDao;

	@Override
	public ArrayList<Board> selectList(String bCategoryNo, CommunityPageInfo pi) {
		
		return cDao.selectList(bCategoryNo, pi);
	}

	@Override
	public Board selectOne(String boardNo, String memberNo) {
		
		return cDao.selectOne(boardNo, memberNo);
	}
	
	@Override
	public int addViewCount(String boardNo) {
		
		return cDao.addViewCount(boardNo);
	}
	
	@Override
	public int communityInsert(Board b, Member member) {
		
		return cDao.communityInsert(b, member);
	}
	
	@Override
	public int communityUpdate(Board b, Member member) {
		
		return cDao.communityUpdate(b, member);
	}
	
	@Override
	public int communityDelete(String boardNo) {
		
		return cDao.communityDelete(boardNo);
	}

	@Override
	public ArrayList<Reply> replySelectList(String boardNo) {
		
		return cDao.replySelectList(boardNo);
	}

	@Override
	public int replyInsert(Reply reply, Member member) {
		
		return cDao.replyInsert(reply, member);
	}

	@Override
	public ArrayList<Board> communityTopList() {
		// TODO Auto-generated method stub
		return cDao.communityTopList();
	}

	@Override
	public ArrayList<Board> communitySearch(String communitySearch) {
		// TODO Auto-generated method stub
		return cDao.communitySearch(communitySearch);
	}

	@Override
	public int getListCount(String bCategoryNo) {
		// TODO Auto-generated method stub
		return cDao.getListCount(bCategoryNo);
	}

	@Override
	public int replyUpdate(Reply reply, Member member) {
		// TODO Auto-generated method stub
		return cDao.replyUpdate(reply, member);
	}

	@Override
	public int replyDelete(Reply reply, Member member) {
		// TODO Auto-generated method stub
		return cDao.replyDelete(reply, member);
	}

	@Override
	public int boardGcount(String boardNo) {
		// TODO Auto-generated method stub
		return cDao.boardGcount(boardNo);
	}

	@Override
	public int getCommunityFBSearchCount(String communitySearch) {
		// TODO Auto-generated method stub
		return cDao.getCommunityFBSearchCount(communitySearch);
	}

	@Override
	public ArrayList<Board> getCommunityFBSearch(CommunityPageInfo fpi, String communitySearch) {
		// TODO Auto-generated method stub
		return cDao.getCommunityFBSearch(fpi, communitySearch);
	}



	

	

	

	

	







	

	

	




	
}
