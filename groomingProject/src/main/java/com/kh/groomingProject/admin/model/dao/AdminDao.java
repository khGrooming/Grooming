package com.kh.groomingProject.admin.model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class AdminDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int memberList(Map info) {
		
		return sqlSessionTemplate.selectOne("adminMapper.memberListCount", info);
	}

	public ArrayList<MemberManageView> selectList(AdminPageInfo pi, Map info) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.memberList", info, rowBounds);
	}

	public int pointCalculation(Point p) {
		
		return sqlSessionTemplate.insert("adminMapper.pointCalculation", p);
	}

	public int selectmentoCount(int i) {
		Map num = new HashMap();
		num.put("kind", i);

		return sqlSessionTemplate.selectOne("adminMapper.selectmentoCount", num);
	}
	
	public ArrayList<MentoManageView> selectmentoList(ArrayList<MemberManageView> mNo) {
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectmentoList", mNo);
	}

	public ArrayList<MentoManageView> selectSpareMentoList(ArrayList<MemberManageView> sNo) {
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectSpareMentoList", sNo);
	}

	public ArrayList<MemberManageView> selectNo(AdminPageInfo pi, int i) {
		Map num = new HashMap();
		num.put("kind", i);
		
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectNo", num, rowBounds);
	}

	public int selectGroomingCount(String category) {
		Map num = new HashMap();
		num.put("category", category);
		
		return sqlSessionTemplate.selectOne("adminMapper.selectGroomingCount", num);
	}

	public ArrayList<GroomingManageView> selectGroomingList(AdminPageInfo pi, String category) {
		Map num = new HashMap();
		num.put("category", category);
		
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectGroomingList", num, rowBounds);
	}

	public int selectDeclarationCount() {

		return sqlSessionTemplate.selectOne("adminMapper.selectDeclarationCount");
	}

	public ArrayList<DeclarationManageView> selectDeclarationList(ArrayList<MemberManageView> dMemberList) {
//		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectDeclarationList", dMemberList);
	}

	public ArrayList<MemberManageView> selectDeclarationMember(AdminPageInfo pi, ArrayList<MemberManageView> dMemberList) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectDeclarationMember", dMemberList, rowBounds);
	}

	public ArrayList<MemberManageView> selectDMemberCount() {

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectDMemberCount");
	}

	public ArrayList<MemberManageView> selectTotalCount(ArrayList<MemberManageView> dMemberList) {

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectTotalCount", dMemberList);
	}

	public ArrayList<MemberManageView> selectDCount(ArrayList<MemberManageView> dMemberList) {

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectDCount", dMemberList);
	}

	public int cafeInfoChange(CafeInfo cafe) {
		int num1 = sqlSessionTemplate.update("adminMapper.cafeInfoChange", cafe);
		
		int num2 = sqlSessionTemplate.update("adminMapper.cafePriceInfoChange", cafe);
		
		if(num1 < 0 || num2 < 0) {
			return 0;
		}else {
			return 1;
		}
	}

	public int insertCafeInfo(CafeInfo cafe) {
		int num1 = sqlSessionTemplate.insert("adminMapper.insertCafeInfo",cafe);

		String cafeNo = sqlSessionTemplate.selectOne("adminMapper.selectCafeNo", cafe);
		System.out.println("Dao에서 cafeInfo : "+cafe);
		
		int num2 = sqlSessionTemplate.insert("adminMapper.insertCafePriceInfo", cafe);
		
		if(num1 < 0 || num2 < 0) {
			return 0;
		}else {
			return 1;
		}
	}

	public ArrayList<GraphListCount> adminBoardList(ArrayList<GraphListCount> clist) {
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.adminBoardList", clist);
	}

	public ArrayList<GraphListCount> adminGroomingList(ArrayList<GraphListCount> clist) {

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.adminGroomingList", clist);
	}

	public ArrayList<GraphListCount> adminMemberList(ArrayList<GraphListCount> clist) {

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.adminMemberList", clist);
	}

	public int insertVisit() {

		return sqlSessionTemplate.insert("adminMapper.insertVisit");
	}

	public ArrayList<GraphListCount> adminGraphCount() {

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.adminGraphCount");
	}


	public int sanctionsInsert(Map info) {

		return sqlSessionTemplate.insert("adminMapper.sanctionsInsert", info);
	}

	public int nowPoint(Point p) {

		return sqlSessionTemplate.selectOne("adminMapper.nowPoint", p);
	}

	public int mentoManage(String memberNo) {

		return sqlSessionTemplate.update("adminMapper.mentoManage", memberNo);
	}


	
}
