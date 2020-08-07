package com.kh.groomingProject.studyCafe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Repository
public class StudyCafeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<StudyCafe> selectCafeNameList(String name) {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCafeNameList", name);
	}

}
