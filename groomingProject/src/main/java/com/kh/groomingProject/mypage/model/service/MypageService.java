package com.kh.groomingProject.mypage.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.vo.MyPageApplicant;
import com.kh.groomingProject.mypage.model.vo.MyPageHeart;
import com.kh.groomingProject.mypage.model.vo.MyPagePageInfo;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;

public interface MypageService {

	Member testLoginUser(String mNo);

	ProfileMember testLoginUser2(String mNo);

	ArrayList<Spec> selectSpecList(String mNo);

	int updateProfileIMG(ProfileMember m);

	int updateMemo(Member m);

	int memberDelete(Member m);

	int memberInfoUpdate(Member m);

	Member selectMember(String memberNo);

	int insertSpec(Spec s);

	String mentorUserSelect(String mNo);

	int insertMentor(String mNo);

	int mpSelectListCount(String mNo);

	ArrayList<Grooming> selectopenGroomingList(MyPagePageInfo pi, String mNo);

	int selectPoint(String mNo);

	int selectPoint2(String mNo);

	ArrayList<MyPageHeart> selectMyPageHeart(MyPagePageInfo pi, String mNo);

	int heartListCount(String mNo);

	int heartListDelete(String ghNo);

	int gApplicantListCount(String mNo);

	ArrayList<MyPageApplicant> selectgApplicant(MyPagePageInfo pi, String mNo);

	int deleteApplicant(String gaNo);

	Grooming selectGroomingTemp(String mNo);


}
