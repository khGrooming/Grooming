package com.kh.groomingProject.studyCafe.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.studyCafe.model.dao.StudyCafeDao;
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

}
