package com.kh.groomingProject.home.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;

public interface HomeService {

	ArrayList<HomeBoard> getBoardTopList();

	ArrayList<HomeGrooming> getGMentoTopList();

	ArrayList<HomeGrooming> getGPopulTopList();

	ArrayList<HomeGrooming> getGDeadlineTopList();

}
