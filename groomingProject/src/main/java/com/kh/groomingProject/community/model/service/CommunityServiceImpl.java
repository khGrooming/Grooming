package com.kh.groomingProject.community.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.community.model.dao.CommunityDao;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

@Service("cService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityDao cDao;

	@Override
	public ArrayList<Board> selectList(String bCategoryNo) {
		
		return cDao.selectList(bCategoryNo);
	}

	@Override
	public Board selectOne(String boardNo) {
		
		return cDao.selectOne(boardNo);
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

	

	

	







	

	

	




	
}
