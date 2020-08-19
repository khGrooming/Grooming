package com.kh.groomingProject.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.common.PageInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

public interface AdminService {

	int memberList(Map info);

	ArrayList<MemberManageView> selectList(PageInfo pi, Map info);

	int pointCalculation(Point p);

	

}
