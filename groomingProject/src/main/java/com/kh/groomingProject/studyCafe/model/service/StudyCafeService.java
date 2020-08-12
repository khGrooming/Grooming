package com.kh.groomingProject.studyCafe.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Reservation;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

public interface StudyCafeService {

	ArrayList<StudyCafe> selectCafeNameList(String name);

	ArrayList<StudyCafe> selectCafeLocalList(String name);

	ArrayList<StudyCafe> selectCafeList();

	ArrayList<CafeInfo> selectCafeInfo(String cafeNo);

	ArrayList<Reservation> selectCheckRoom(Map str);

	ArrayList<Reservation> selectCheckTime(Map str);

}
