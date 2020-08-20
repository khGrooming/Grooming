package com.kh.groomingProject.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
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

	public int selectmentoCount(int i) {
		Map num = new HashMap();
		num.put("kind", i);

		return sqlSessionTemplate.selectOne("adminMapper.selectmentoCount", num);
	}
	
	public ArrayList<MentoManageView> selectmentoList(AdminPageInfo pi, ArrayList<MemberManageView> mNo) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectmentoList", mNo, rowBounds);
	}

	public ArrayList<MentoManageView> selectSpareMentoList(AdminPageInfo spi, ArrayList<MemberManageView> sNo) {
		int offset = (spi.getCurrentPage() - 1)*spi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, spi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectSpareMentoList", sNo, rowBounds);
	}

	public ArrayList<MemberManageView> selectNo(int i) {
		Map num = new HashMap();
		num.put("kind", i);

		return (ArrayList)sqlSessionTemplate.selectList("adminMapper.selectNo", num);
	}

	

	
}
