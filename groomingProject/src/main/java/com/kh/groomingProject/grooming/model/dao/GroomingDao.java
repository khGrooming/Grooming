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

	public ArrayList<Grooming> selectMentorList( ) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMentorList");
	}

	public ArrayList<Grooming> gSearch(Grooming g) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearch",g);
	}

	public ArrayList<Grooming> gSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchTitle",keyword);
	}

	public ArrayList<Grooming> gSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchWriter",keyword);
	}

	public ArrayList<Grooming> gSearchContent(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchContent",keyword);
	}

	public int addReadCount(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("groomingMapper.updateCount",groomingNo);
	}

//	public Grooming selectGrooming(String groomingNo) {
//		// TODO Auto-generated method stub
//		return sqlSessionTemplate.selectOne("groomingMapper.selectOne",groomingNo);
//	}
	public ArrayList<Grooming> selectGrooming(String groomingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectDetailList",groomingNo);
	}

	public ArrayList<Grooming> selectMoneyList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMoneyList");
	}
	
	
	
	
}
