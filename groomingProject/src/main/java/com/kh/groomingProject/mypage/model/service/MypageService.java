package com.kh.groomingProject.mypage.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.vo.MemberReport;
import com.kh.groomingProject.mypage.model.vo.MyPageApplicant;
import com.kh.groomingProject.mypage.model.vo.MyPageGrooming;
import com.kh.groomingProject.mypage.model.vo.MyPageHeart;
import com.kh.groomingProject.mypage.model.vo.MyPagePageInfo;
import com.kh.groomingProject.mypage.model.vo.MyPagePoint;
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

	ArrayList<HomeGrooming> selectopenGroomingList(MyPagePageInfo pi, String mNo);

	int selectPoint(String mNo);

	int selectPoint2(String mNo);

	ArrayList<MyPageHeart> selectMyPageHeart(MyPagePageInfo pi, String mNo);

	int heartListCount(String mNo);

	int heartListDelete(String ghNo);

	int gApplicantListCount(String mNo);

	ArrayList<MyPageApplicant> selectgApplicant(MyPagePageInfo pi, String mNo);

	int deleteApplicant(String gaNo);

	Grooming selectGroomingTemp(String mNo);

	int selectGroomingMemberCount(String mNo);

	ArrayList<MyPageGrooming> selectMypageGmember(MyPagePageInfo pi, String mNo);

	int selectGroomingHostCount(String mNo);

	ArrayList<MyPageGrooming> selectMypageGhost(MyPagePageInfo pih, String mNo);

	ArrayList<MyPagePoint> selectPointList(String mNo);

	int insertPoint(MyPagePoint insertPoint);

	int insertMemberReport(MemberReport mr);

	ArrayList<Board> selectMemberBoardList(String mNo, MyPagePageInfo pi);

	int selectMyCommunityCount(String mNo);

	int selectMyReplyCount(String mNo);

	ArrayList<Reply> selectMemberReplyList(String mNo, MyPagePageInfo pi);

	String selectTempGroomingNo(String mNo);

	MemberReport selectReportInfo(MemberReport repM);


}
