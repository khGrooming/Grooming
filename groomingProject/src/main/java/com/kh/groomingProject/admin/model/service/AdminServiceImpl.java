package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.admin.model.dao.AdminDao;
import com.kh.groomingProject.admin.model.vo.DeclarationManageView;
import com.kh.groomingProject.admin.model.vo.GraphListCount;
import com.kh.groomingProject.admin.model.vo.GroomingManageView;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

import oracle.sql.DATE;

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
	public int selectGroomingCount(Map str) {

		return adminDao.selectGroomingCount(str);
	}

	@Override
	public ArrayList<GroomingManageView> selectGroomingList(AdminPageInfo pi, Map str) {
		
		return adminDao.selectGroomingList(pi, str);
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

	@Override
	public int cafeInfoChange(CafeInfo cafe) {
		
		return adminDao.cafeInfoChange(cafe);
	}

	@Override
	public int insertCafeInfo(CafeInfo cafe) {

		return adminDao.insertCafeInfo(cafe);
	}

	@Override
	public ArrayList<GraphListCount> adminBoardList(ArrayList<GraphListCount> clist) {

		return adminDao.adminBoardList(clist);
	}

	@Override
	public ArrayList<GraphListCount> adminGroomingList(ArrayList<GraphListCount> clist) {

		return adminDao.adminGroomingList(clist);
	}

	@Override
	public ArrayList<GraphListCount> adminMemberList(ArrayList<GraphListCount> clist) {

		return adminDao.adminMemberList(clist);
	}

	@Override
	public int insertVisit() {
		
		return adminDao.insertVisit();
	}

	@Override
	public ArrayList<GraphListCount> adminGraphCount() {

		return adminDao.adminGraphCount();
	}

	@Override
	public int sanctionsInsert(Map info) {

		return adminDao.sanctionsInsert(info);
	}

	@Override
	public int nowPoint(Point p) {

		return adminDao.nowPoint(p);
	}

	@Override
	public int mentoManage(String memberNo) {

		return adminDao.mentoManage(memberNo);
	}

	@Override
	public int gActivation(Map str) {

		return adminDao.gActivation(str);
	}

	@Override
	public int declarationDelete(Map info) {

		return adminDao.declarationDelete(info);
	}

	@Override
	public int DeleteCafeInfo(CafeInfo cafe) {

		return adminDao.DeleteCafeInfo(cafe);
	}

	@Override
	public ArrayList<GraphListCount> adminPoint(ArrayList<GraphListCount> clist) {

		return adminDao.adminPoint(clist);
	}

	
}
