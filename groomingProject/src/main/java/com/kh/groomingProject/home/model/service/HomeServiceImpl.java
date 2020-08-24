package com.kh.groomingProject.home.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.home.model.dao.HomeDao;
import com.kh.groomingProject.home.model.vo.HomeBoard;

@Service("homeService")
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao homeDao;
	
	@Override
	public ArrayList<HomeBoard> getBoardTopList() {

		return homeDao.getBoardTopList();
	}

}