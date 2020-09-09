package com.kh.groomingProject.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.dao.MypageDao;
import com.kh.groomingProject.mypage.model.vo.MemberReport;
import com.kh.groomingProject.mypage.model.vo.MyPageApplicant;
import com.kh.groomingProject.mypage.model.vo.MyPageGrooming;
import com.kh.groomingProject.mypage.model.vo.MyPageHeart;
import com.kh.groomingProject.mypage.model.vo.MyPagePageInfo;
import com.kh.groomingProject.mypage.model.vo.MyPagePoint;
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

	@Override
	public int insertSpec(Spec s) {
		return mpDao.insertSpec(s);
	}

	@Override
	public String mentorUserSelect(String mNo) {
		return mpDao.mentorUserSelect(mNo);
	}

	@Override
	public int insertMentor(String mNo) {
		return mpDao.insertMentor(mNo);
	}

	@Override
	public int mpSelectListCount(String mNo) {
		return mpDao.mpSelectListCount(mNo);
	}

	@Override
	public ArrayList<HomeGrooming> selectopenGroomingList(MyPagePageInfo pi, String mNo) {
		return mpDao.selectopenGroomingList(pi,mNo);
	}

	@Override
	public int selectPoint(String mNo) {
		return mpDao.selectPoint(mNo);
	}

	@Override
	public int selectPoint2(String mNo) {
		return mpDao.selectPoint2(mNo);
	}

	@Override
	public ArrayList<MyPageHeart> selectMyPageHeart(MyPagePageInfo pi,String mNo) {
		return mpDao.selectMyPageHeart(pi,mNo);
	}

	@Override
	public int heartListCount(String mNo) {
		return mpDao.heartListCount(mNo);
	}

	@Override
	public int heartListDelete(String ghNo) {
		return mpDao.heartListDelete(ghNo);
	}

	@Override
	public int gApplicantListCount(String mNo) {
		return mpDao.gApplicantListCount(mNo);
	}

	@Override
	public ArrayList<MyPageApplicant> selectgApplicant(MyPagePageInfo pi, String mNo) {
		return mpDao.selectgApplicant(pi,mNo);
	}

	@Override
	public int deleteApplicant(String gaNo) {
		return mpDao.deleteApplicant(gaNo);
	}

	@Override
	public Grooming selectGroomingTemp(String mNo) {
		return mpDao.selectGroomingTemp(mNo);
	}

	@Override
	public int selectGroomingMemberCount(String mNo) {
		return mpDao.selectGroomingMemberCount(mNo);
	}

	@Override
	public ArrayList<MyPageGrooming> selectMypageGmember(MyPagePageInfo pi,String mNo) {
		return mpDao.selectMypageGmember(pi,mNo);
	}

	@Override
	public int selectGroomingHostCount(String mNo) {
		return mpDao.selectGroomingHostCount(mNo);
	}

	@Override
	public ArrayList<MyPageGrooming> selectMypageGhost(MyPagePageInfo pih, String mNo) {
		return mpDao.selectMypageGhost(pih,mNo);
	}

	@Override
	public ArrayList<MyPagePoint> selectPointList(String mNo) {
		return mpDao.selectPointList(mNo);
	}


	@Override
	public int insertPoint(MyPagePoint insertPoint) {
		return mpDao.insertPoint(insertPoint);
	}

	@Override
	public int insertMemberReport(MemberReport mr) {
		return mpDao.insertMemberReport(mr);
	}

	@Override
	public ArrayList<Board> selectMemberBoardList(String mNo, MyPagePageInfo pi) {
		return mpDao.selectMemberBoardList(mNo,pi);
	}

	@Override
	public int selectMyCommunityCount(String mNo) {
		return mpDao.selectMyCommunityCount(mNo);
	}

	@Override
	public int selectMyReplyCount(String mNo) {
		return mpDao.selectMyReplyCount(mNo);
	}

	@Override
	public ArrayList<Reply> selectMemberReplyList(String mNo, MyPagePageInfo pi) {
		return mpDao.selectMemberReplyList(mNo, pi);
	}

	@Override
	public String selectTempGroomingNo(String mNo) {
		return mpDao.selectTempGroomingNo(mNo);
	}

	@Override
	public MemberReport selectReportInfo(MemberReport repM) {
		return mpDao.selectReportInfo(repM);
	}


}
