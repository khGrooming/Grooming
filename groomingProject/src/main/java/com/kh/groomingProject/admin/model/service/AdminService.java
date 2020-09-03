package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.admin.model.vo.DeclarationManageView;
import com.kh.groomingProject.admin.model.vo.GroomingManageView;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

public interface AdminService {

	int memberList(Map info);

	ArrayList<MemberManageView> selectList(AdminPageInfo pi, Map info);

	int pointCalculation(Point p);

	int selectmentoCount(int i);

	ArrayList<MentoManageView> selectmentoList(ArrayList<MemberManageView> mNo);

	ArrayList<MentoManageView> selectSpareMentoList(ArrayList<MemberManageView> sNo);

	ArrayList<MemberManageView> selectNo(AdminPageInfo pi, int i);

	int selectGroomingCount(String category);

	ArrayList<GroomingManageView> selectGroomingList(AdminPageInfo pi, String category);

	int selectDeclarationCount();

	ArrayList<DeclarationManageView> selectDeclarationList(ArrayList<MemberManageView> dMemberList);

	ArrayList<MemberManageView> selectDeclarationMember(AdminPageInfo pi, ArrayList<MemberManageView> dMemberList);

	ArrayList<MemberManageView> selectDMemberCount();

	ArrayList<MemberManageView> selectTotalCount(ArrayList<MemberManageView> dMemberList);

	ArrayList<MemberManageView> selectDCount(ArrayList<MemberManageView> dMemberList);

	


	

}
