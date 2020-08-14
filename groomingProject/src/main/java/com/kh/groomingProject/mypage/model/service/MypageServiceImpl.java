package com.kh.groomingProject.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.dao.MypageDao;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;

@Service("mpService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDao mpDao;

	@Override
	public Member testLoginUser(String mNo) {
		return mpDao.testLoginUser(mNo);
	}

	@Override
	public ProfileMember testLoginUser2(String mNo) {
		return mpDao.testLoginUser2(mNo);
	}

	@Override
	public ArrayList<Spec> selectSpecList(String mNo) {
		return mpDao.selectSpecList(mNo);
	}


	@Override
	public int updateProfileIMG(ProfileMember m) {
		return mpDao.updateProfileIMG(m);
	}

	@Override
	public int updateMemo(Member m) {		
		return mpDao.updateMemo(m);
	}

	@Override
	public int memberDelete(Member m) {
		return mpDao.memberDelete(m);
	}

	@Override
	public int memberInfoUpdate(Member m) {		
		return mpDao.memberInfoUpdate(m);
	}

	@Override
	public Member selectMember(String memberNo) {
		return mpDao.memberSelect(memberNo);
	}
}
