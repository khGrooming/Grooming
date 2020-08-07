package com.kh.groomingProject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.member.model.dao.MemberDao;
import com.kh.groomingProject.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;

	@Override
	public int insertMember(Member m) {

		return mDao.insertMember(m);
	}

	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return mDao.loginMember(m);
	}

}
