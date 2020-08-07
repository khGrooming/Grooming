package com.kh.groomingProject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.member.model.dao.MemberDao;

@Service("mService")
public class MemberServiceImpl {

	@Autowired
	private MemberDao mDao;

}
