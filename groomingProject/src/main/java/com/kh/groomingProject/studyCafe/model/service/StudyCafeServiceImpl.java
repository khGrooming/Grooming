package com.kh.groomingProject.studyCafe.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.studyCafe.model.dao.StudyCafeDao;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;
import com.kh.groomingProject.studyCafe.model.vo.Reservation;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Service
public class StudyCafeServiceImpl implements StudyCafeService{
	
	@Autowired
	StudyCafeDao studyCafeDao;

	@Override
	public ArrayList<StudyCafe> selectCafeNameList(String name) {
		
		return studyCafeDao.selectCafeNameList(name);
	}

	@Override
	public ArrayList<StudyCafe> selectCafeLocalList(String name) {

		return studyCafeDao.selectCafeLocalList(name);
	}

	@Override
	public ArrayList<StudyCafe> selectCafeList() {
		
		return studyCafeDao.selectCafeList();
	}

	@Override
	public ArrayList<CafeInfo> selectCafeInfo(String cafeNo) {
		
		return studyCafeDao.selectCafeInto(cafeNo);
	}

	@Override
	public ArrayList<Reservation> selectCheckRoom(Map str) {

		return studyCafeDao.selectCheckRoom(str);
	}

	@Override
	public ArrayList<Reservation> selectCheckTime(Map str) {
		
		return studyCafeDao.selectCheckTime(str);
	}

	@Override
	public int insertReservation(Reservation r) {

		return studyCafeDao.insertReservation(r);
	}

	@Override
	public ArrayList<Reservation> selectReservation(String memberNo) {

		return studyCafeDao.selectReservation(memberNo);
	}

	@Override
	public ArrayList<Reservation> rHistoryCheck(String memberNo) {

		return studyCafeDao.rHistoryCheck(memberNo);
	}

	@Override
	public int deleteReservation(String cReserNo) {

		return studyCafeDao.deleteReservation(cReserNo);
	}

	@Override
	public int checkPoint(String memberNo) {
		
		return studyCafeDao.checkPoint(memberNo);
	}

	@Override
	public int pointCalculation(Point cal) {
		
		return studyCafeDao.pointCalculation(cal);
	}

}
