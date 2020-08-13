package com.kh.groomingProject.alert.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.groomingProject.alert.model.service.AlertService;

@Controller
public class AlertController {

	@Autowired
	private AlertService alertService;

}
