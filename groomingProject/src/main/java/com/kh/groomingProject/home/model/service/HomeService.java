package com.kh.groomingProject.home.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.groomingProject.home.model.vo.HomeBoard;

public interface HomeService {

	ArrayList<HomeBoard> getBoardTopList();

}
