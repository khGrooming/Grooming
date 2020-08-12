package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.grooming.model.vo.Grooming;

public interface GroomingService {

	ArrayList<Grooming> selectList();

	ArrayList<Grooming> selectMentorList( );

	ArrayList<Grooming> gSearchTitle(String keyword);
	ArrayList<Grooming> gSearchWriter(String keyword);
	ArrayList<Grooming> gSearchContent(String keyword);

	int addReadCount(String groomingNo);

	ArrayList<Grooming> selectGrooming(String groomingNo);
//	Grooming selectGrooming(String groomingNo);

	ArrayList<Grooming> selectMoneyList();

}
