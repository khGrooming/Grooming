package com.kh.groomingProject.community.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.community.model.dao.CommunityDao;
import com.kh.groomingProject.community.model.vo.Board;

@Service("cService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityDao cDao;

	@Override
	public ArrayList<Board> selectList() {
		
		return cDao.selectList();
	}

	@Override
	public int noticeInsert(Board b) {
		
		return cDao.noticeInsert(b);
	}

	@Override
	public Board selectOne(String boardNo) {
		
		return cDao.selectOne(boardNo);
	}

	@Override
	public int noticeUpdate(Board b) {
		
		return cDao.noticeUpdate(b);
	}

	@Override
	public int noticeDelete(String boardNo) {
		
		return cDao.noticeDelete(boardNo);
	}

	@Override
	public int addViewCount(String boardNo) {
		
		return cDao.addViewCount(boardNo);
	}

	@Override
	public ArrayList<Board> selectListFB() {
		
		return cDao.selectListFB();
	}

	@Override
	public Board selectOneFB(String boardNo) {
		
		return cDao.selectOneFB(boardNo);
	}







	
}
