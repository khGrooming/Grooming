package com.kh.groomingProject.studyCafe.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;
import com.kh.groomingProject.studyCafe.model.vo.Reservation;
import com.kh.groomingProject.studyCafe.model.vo.ReservationView;
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

	public ArrayList<Reservation> selectCheckRoom(Map str) {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCheckRoom", str);
	}

	public ArrayList<Reservation> selectCheckTime(Map str) {

		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectCheckTime", str);
	}

	public int insertReservation(Reservation r) {

		return sqlSessionTemplate.insert("cafeMapper.insertReservation", r);
	}

	public ArrayList<ReservationView> selectReservation(String memberNo) {
		
		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.selectReservation", memberNo);
	}

	public ArrayList<ReservationView> rHistoryCheck(String memberNo) {
		
		return (ArrayList)sqlSessionTemplate.selectList("cafeMapper.rHistoryCheck", memberNo);
	}

	public int deleteReservation(String cReserNo) {
		return sqlSessionTemplate.delete("cafeMapper.deleteReservation" ,cReserNo);
	}

	public int checkPoint(Map rinfo) {
		
		return sqlSessionTemplate.selectOne("cafeMapper.checkPoint", rinfo);
	}

	public int pointCalculation(Map rinfo) {
		
		return sqlSessionTemplate.insert("cafeMapper.pointCalculation", rinfo);
	}

}
