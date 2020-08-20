package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.admin.model.dao.AdminDao;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;

	@Override
	public int memberList(Map info) {
		
		return adminDao.memberList(info);
	}

	@Override
	public ArrayList<MemberManageView> selectList(AdminPageInfo pi, Map info) {

		return adminDao.selectList(pi, info);
	}

	@Override
	public int pointCalculation(Point p) {
		
		return adminDao.pointCalculation(p);
	}

	@Override
	public int selectmentoCount(int i) {
		
		return adminDao.selectmentoCount(i);
	}

	@Override
	public ArrayList<MentoManageView> selectmentoList(AdminPageInfo pi, ArrayList<MemberManageView> mNo) {

		return adminDao.selectmentoList(pi, mNo);
	}

	@Override
	public ArrayList<MentoManageView> selectSpareMentoList(AdminPageInfo spi, ArrayList<MemberManageView> sNo) {

		return adminDao.selectSpareMentoList(spi, sNo);
	}

	@Override
	public ArrayList<MemberManageView> selectNo(int i) {

		return adminDao.selectNo(i);
	}

	

	
}
