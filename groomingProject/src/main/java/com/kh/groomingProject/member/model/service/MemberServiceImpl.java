package com.kh.groomingProject.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.member.model.dao.MemberDao;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberCertiCode;
import com.kh.groomingProject.member.model.vo.MemberTag;

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

	@Override
	public int welcomePoint(String memberNo) {

		return mDao.welcomePoint(memberNo);
	}

	@Override
	public int mergeMemberTags(MemberTag memberTag) {

		return mDao.mergeMemberTags(memberTag);
	}

	@Override
	public int insertMemberKakao(Member m) {

		return mDao.insertMemberKakao(m);
	}

	@Override
	public int findMemberEmail(Member m) {

		return mDao.findMemberEmail(m);
	}

	@Override
	public int insertRandomCode(MemberCertiCode mcc) {

		return mDao.insertRandomCode(mcc);
	}

	@Override
	public int certiChk(MemberCertiCode mcc) {

		return mDao.certiChk(mcc);
	}

	@Override
	public int updateMemberPwd(Member m) {

		return mDao.updateMemberPwd(m);
	}

	@Override
	public ArrayList<Member> GroupMList(String groomingNo) {
		// TODO Auto-generated method stub
		return mDao.GroupMList(groomingNo);
	}

}
