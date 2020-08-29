package com.kh.groomingProject.home.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;

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

}
