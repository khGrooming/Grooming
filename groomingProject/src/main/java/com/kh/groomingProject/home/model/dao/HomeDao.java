package com.kh.groomingProject.home.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.home.model.vo.HomeBoard;

@Repository("homeDao")
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<HomeBoard> getBoardTopList() {

		return (ArrayList)sqlSessionTemplate.selectList("homeMapper.getBoardTopList");
	}

}
