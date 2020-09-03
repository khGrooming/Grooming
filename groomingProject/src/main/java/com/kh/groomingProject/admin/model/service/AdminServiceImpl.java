package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.admin.model.dao.AdminDao;
import com.kh.groomingProject.admin.model.vo.DeclarationManageView;
import com.kh.groomingProject.admin.model.vo.GroomingManageView;
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
	public ArrayList<MentoManageView> selectmentoList(ArrayList<MemberManageView> mNo) {

		return adminDao.selectmentoList(mNo);
	}

	@Override
	public ArrayList<MentoManageView> selectSpareMentoList(ArrayList<MemberManageView> sNo) {

		return adminDao.selectSpareMentoList(sNo);
	}

	@Override
	public ArrayList<MemberManageView> selectNo(AdminPageInfo pi, int i) {

		return adminDao.selectNo(pi, i);
	}

	@Override
	public int selectGroomingCount(String category) {

		return adminDao.selectGroomingCount(category);
	}

	@Override
	public ArrayList<GroomingManageView> selectGroomingList(AdminPageInfo pi, String category) {
		
		return adminDao.selectGroomingList(pi, category);
	}

	@Override
	public int selectDeclarationCount() {

		return adminDao.selectDeclarationCount();
	}

	@Override
	public ArrayList<DeclarationManageView> selectDeclarationList(ArrayList<MemberManageView> dMemberList) {

		return adminDao.selectDeclarationList(dMemberList);
	}

	@Override
	public ArrayList<MemberManageView> selectDeclarationMember(AdminPageInfo pi, ArrayList<MemberManageView> dMemberList) {

		return adminDao.selectDeclarationMember(pi, dMemberList);
	}

	@Override
	public ArrayList<MemberManageView> selectDMemberCount() {

		return adminDao.selectDMemberCount();
	}

	@Override
	public ArrayList<MemberManageView> selectTotalCount(ArrayList<MemberManageView> dMemberList) {

		return adminDao.selectTotalCount(dMemberList);
	}

	@Override
	public ArrayList<MemberManageView> selectDCount(ArrayList<MemberManageView> dMemberList) {

		return adminDao.selectDCount(dMemberList);
	}

	

	
}
