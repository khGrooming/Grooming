package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.grooming.model.dao.GroomingDao;
import com.kh.groomingProject.grooming.model.vo.Grooming;

@Service("gService")
public class GroomingServiceImpl implements GroomingService{

	@Autowired
	GroomingDao gDao;

	@Override
	public ArrayList<Grooming> selectList() {
		// TODO Auto-generated method stub
		return gDao.selectList();
	}

	@Override
	public ArrayList<Grooming> selectMentorList() {
		// TODO Auto-generated method stub
		return gDao.selectMentorList();
	}
	
}
