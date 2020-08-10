package com.kh.groomingProject.grooming.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.grooming.model.vo.Grooming;

@Repository("gDao")

public class GroomingDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Grooming> selectList() {
		
		
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectList");
	}
	
	
	
	
}
