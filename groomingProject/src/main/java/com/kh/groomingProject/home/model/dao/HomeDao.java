package com.kh.groomingProject.home.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomeHelp;
import com.kh.groomingProject.home.model.vo.HomePageInfo;

@Repository("homeDao")
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<HomeBoard> getBoardTopList() {

		return (ArrayList)sqlSessionTemplate.selectList("homeMapper.getBoardTopList");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<HomeGrooming> getGMentoTopList() {

		return (ArrayList)sqlSessionTemplate.selectList("homeMapper.getGMentoTopList");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<HomeGrooming> getGPopulTopList() {

		return (ArrayList)sqlSessionTemplate.selectList("homeMapper.getGPopulTopList");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<HomeGrooming> getGDeadlineTopList() {

		return (ArrayList)sqlSessionTemplate.selectList("homeMapper.getGDeadlineTopList");
	}

	public int getGListCount() {

		return sqlSessionTemplate.selectOne("homeMapper.getGListCount");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<HomeGrooming> getGroomingList(HomePageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("페이지 오프셋 : " + offset + " / 페이지 리밋 : " + pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("homeMapper.getGroomingList", null, rowBounds);
	}

	public int siteQuestion(HomeHelp homehelp) {

		return sqlSessionTemplate.insert("homeMapper.siteQuestion", homehelp);
	}

}
