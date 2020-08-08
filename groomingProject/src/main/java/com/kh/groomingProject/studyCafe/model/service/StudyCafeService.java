package com.kh.groomingProject.studyCafe.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

public interface StudyCafeService {

	ArrayList<StudyCafe> selectCafeNameList(String name);

	ArrayList<StudyCafe> selectCafeLocalList(String name);

	ArrayList<StudyCafe> selectCafeList();

}
