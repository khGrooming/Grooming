package com.kh.groomingProject.studyCafe.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;
import com.kh.groomingProject.studyCafe.model.vo.Reservation;
import com.kh.groomingProject.studyCafe.model.vo.ReservationView;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

public interface StudyCafeService {

	ArrayList<StudyCafe> selectCafeNameList(String name);

	ArrayList<StudyCafe> selectCafeLocalList(String name);

	ArrayList<CafeInfo> selectCafeList(AdminPageInfo pi, Map str);

	ArrayList<CafeInfo> selectCafeInfo(CafeInfo cafe);

	ArrayList<Reservation> selectCheckRoom(Map str);

	ArrayList<Reservation> selectCheckTime(Map str);

	int insertReservation(Reservation r);

	ArrayList<ReservationView> selectReservation(String memberNo);

	ArrayList<ReservationView> rHistoryCheck(String memberNo);

	int deleteReservation(String cReserNo);

	int checkPoint(Map rinfo);

	int pointCalculation(Map rinfo);

	int selectcafeCount(Map str);
}
