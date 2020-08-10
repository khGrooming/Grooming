package com.kh.groomingProject.studyCafe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.CafeReservation;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Repository
public class StudyCafeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<StudyCafe> selectCafeNameList(String name) {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCafeNameList", name);
	}

	public ArrayList<StudyCafe> selectCafeLocalList(String name) {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCafeLocalList", name);
	}

	public ArrayList<StudyCafe> selectCafeList() {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCafeList");
	}

	public ArrayList<CafeInfo> selectCafeInto(String cafeNo) {
		
		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCafeInfo", cafeNo);
	}

	public ArrayList<CafeReservation> selectCheckRoom(String cPriceNo) {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCheckRoom", cPriceNo);
	}

}
