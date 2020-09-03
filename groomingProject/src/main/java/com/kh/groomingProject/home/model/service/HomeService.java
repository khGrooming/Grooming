package com.kh.groomingProject.home.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomeHelp;
import com.kh.groomingProject.home.model.vo.HomePageInfo;

public interface HomeService {

	ArrayList<HomeBoard> getBoardTopList();

	ArrayList<HomeGrooming> getGMentoTopList();

	ArrayList<HomeGrooming> getGPopulTopList();

	ArrayList<HomeGrooming> getGDeadlineTopList();

	int getGListCount();

	ArrayList<HomeGrooming> getGroomingList(HomePageInfo pi);

	int siteQuestion(HomeHelp homehelp);

}
