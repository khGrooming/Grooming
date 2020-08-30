package com.kh.groomingProject.home.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.home.model.dao.HomeDao;
import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomePageInfo;

@Service("homeService")
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao homeDao;
	
	@Override
	public ArrayList<HomeBoard> getBoardTopList() {

		return homeDao.getBoardTopList();
	}

	@Override
	public ArrayList<HomeGrooming> getGMentoTopList() {

		return homeDao.getGMentoTopList();
	}

	@Override
	public ArrayList<HomeGrooming> getGPopulTopList() {

		return homeDao.getGPopulTopList();
	}

	@Override
	public ArrayList<HomeGrooming> getGDeadlineTopList() {

		return homeDao.getGDeadlineTopList();
	}

	@Override
	public int getGListCount() {

		return homeDao.getGListCount();
	}

	@Override
	public ArrayList<HomeGrooming> getGroomingList(HomePageInfo pi) {

		return homeDao.getGroomingList(pi);
	}

}
