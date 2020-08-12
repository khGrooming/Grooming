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
		
		return mDao.loginMember(m);
	}

	@Override
	public int emailDuplicateChk(Member m) {

		return mDao.emailDuplicateChk(m);
	}

	@Override
	public int nickNameDuplicateChk(Member m) {

		return mDao.nickNameDuplicateChk(m);
	}

	@Override
	public int phoneDuplicateChk(Member m) {

		return mDao.phoneDuplicateChk(m);
	}

	@Override
	public int updateMemberOption(Member m) {

		return mDao.updateMemberOption(m);
	}

}
