package com.kh.groomingProject.community.notice.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.groomingProject.community.notice.model.vo.Notice;
import com.kh.groomingProject.community.notice.model.dao.NoticeDao;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Override
	public ArrayList<Notice> selectList() {
		
		return nDao.selectList();
	}

}
