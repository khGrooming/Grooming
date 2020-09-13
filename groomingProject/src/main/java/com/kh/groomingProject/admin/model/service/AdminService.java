package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.kh.groomingProject.admin.model.vo.DeclarationManageView;
import com.kh.groomingProject.admin.model.vo.GraphListCount;
import com.kh.groomingProject.admin.model.vo.GroomingManageView;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.admin.model.vo.VisitCount;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

import oracle.sql.DATE;

public interface AdminService {

	int memberList(Map info);

	ArrayList<MemberManageView> selectList(AdminPageInfo pi, Map info);

	int pointCalculation(Point p);

	int selectmentoCount(int i);

	ArrayList<MentoManageView> selectmentoList(ArrayList<MemberManageView> mNo);

	ArrayList<MentoManageView> selectSpareMentoList(ArrayList<MemberManageView> sNo);

	ArrayList<MemberManageView> selectNo(AdminPageInfo pi, int i);

	int selectGroomingCount(Map str);

	ArrayList<GroomingManageView> selectGroomingList(AdminPageInfo pi, Map str);

	int selectDeclarationCount();

	ArrayList<DeclarationManageView> selectDeclarationList(ArrayList<MemberManageView> dMemberList);

	ArrayList<MemberManageView> selectDeclarationMember(AdminPageInfo pi, ArrayList<MemberManageView> dMemberList);

	ArrayList<MemberManageView> selectDMemberCount();

	ArrayList<MemberManageView> selectTotalCount(ArrayList<MemberManageView> dMemberList);

	ArrayList<MemberManageView> selectDCount(ArrayList<MemberManageView> dMemberList);

	int cafeInfoChange(CafeInfo cafe);

	int insertCafeInfo(CafeInfo cafe);

	ArrayList<GraphListCount> adminBoardList(ArrayList<GraphListCount> clist);

	ArrayList<GraphListCount> adminGroomingList(ArrayList<GraphListCount> clist);

	ArrayList<GraphListCount> adminMemberList(ArrayList<GraphListCount> clist);

	int insertVisit();

	ArrayList<GraphListCount> adminGraphCount();

	int sanctionsInsert(Map info);

	int nowPoint(Point p);

	int mentoManage(String memberNo);

	int gActivation(Map str);

	int declarationDelete(Map info);

	int DeleteCafeInfo(CafeInfo cafe);

	ArrayList<GraphListCount> adminPoint(ArrayList<GraphListCount> clist);



	

}
