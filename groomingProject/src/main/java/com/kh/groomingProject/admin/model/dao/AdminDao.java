package com.kh.groomingProject.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

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

	
}
