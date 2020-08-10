package com.kh.groomingProject.mypage.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;

public interface MypageService {

	Member testLoginUser(String mNo);

	ProfileMember testLoginUser2(String mNo);

	ArrayList<Spec> selectSpecList(String mNo);

	int updateProfileIMG(ProfileMember m);

	int updateMemo(Member m);


}
