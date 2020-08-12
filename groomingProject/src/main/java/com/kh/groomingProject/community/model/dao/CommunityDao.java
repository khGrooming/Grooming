package com.kh.groomingProject.community.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.community.model.vo.Board;

@Repository("cDao")
public class CommunityDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Board> selectList() {
		ArrayList list = new ArrayList();
		
		list = (ArrayList)sqlSessionTemplate.selectList("communityMapper.selectList");
		
		return list;
	}

	public int noticeInsert(Board b) {

		return sqlSessionTemplate.insert("communityMapper.noticeInsert", b);
	}
	
	
}
