package com.kh.groomingProject.studyCafe.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.dao.StudyCafeDao;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;
import com.kh.groomingProject.studyCafe.model.vo.Reservation;
import com.kh.groomingProject.studyCafe.model.vo.ReservationView;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Service
public class StudyCafeServiceImpl implements StudyCafeService{
	
	@Autowired
	StudyCafeDao studyCafeDao;

	@Override
	public ArrayList<StudyCafe> selectCafeNameList(AdminPageInfo pi, Map str) {
		
		return studyCafeDao.selectCafeNameList(pi, str);
	}

	@Override
	public ArrayList<StudyCafe> selectCafeLocalList(AdminPageInfo pi, Map str) {

		return studyCafeDao.selectCafeLocalList(pi, str);
	}

	@Override
	public ArrayList<CafeInfo> selectCafeList(AdminPageInfo pi, Map str) {
		
		return studyCafeDao.selectCafeList(pi, str);
	}

	@Override
	public ArrayList<CafeInfo> selectCafeInfo(CafeInfo cafe) {
		
		return studyCafeDao.selectCafeInto(cafe);
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
	public ArrayList<ReservationView> selectReservation(String memberNo) {

		return studyCafeDao.selectReservation(memberNo);
	}

	@Override
	public ArrayList<ReservationView> rHistoryCheck(String memberNo) {

		return studyCafeDao.rHistoryCheck(memberNo);
	}

	@Override
	public int deleteReservation(String cReserNo) {

		return studyCafeDao.deleteReservation(cReserNo);
	}

	@Override
	public int checkPoint(Map rinfo) {
		
		return studyCafeDao.checkPoint(rinfo);
	}

	@Override
	public int pointCalculation(Map rinfo) {
		
		return studyCafeDao.pointCalculation(rinfo);
	}

	@Override
	public int selectcafeCount(Map str) {

		return studyCafeDao.studyCafeCount(str);
	}

}
