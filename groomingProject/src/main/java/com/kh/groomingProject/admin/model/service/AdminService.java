package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

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

	


	

}
