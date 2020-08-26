package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.grooming.model.vo.GroupBoard;
import com.kh.groomingProject.grooming.model.vo.GroupMember;
import com.kh.groomingProject.grooming.model.vo.GroupPageInfo;
import com.kh.groomingProject.member.model.vo.Member;

public interface GroomingService {

	ArrayList<Grooming> selectList();

	ArrayList<Grooming> selectMentorList( );

	ArrayList<Grooming> gSearchTitle(String keyword);
	ArrayList<Grooming> gSearchWriter(String keyword);
	ArrayList<Grooming> gSearchContent(String keyword);

	int addReadCount(String groomingNo);

	Grooming selectGrooming(String groomingNo);

	ArrayList<Grooming> selectMoneyList();

	ArrayList<GroomingTag> selectTag(String groomingNo);

	ArrayList<GroomingSpec> selectSpec(String groomingNo);

	Member selectMember(String groomingNo);

	int insertGrooming(Grooming g);

	ArrayList<Member> selectAppMember(String groomingNo);

	ArrayList<GroomingAppList> selectAppContent(String groomingNo);

	int selectApplyOne(String applyNo);

	int addGroomingP(String groomingNo);

	int selectRejectApp(String applyNo);

	int updateGrooming(Grooming g);

	int groomingDelete(String groomingNo);

	int statusUpdate(String groomingNo);

	int applyContent(GroomingApplicant ga);

	GroomingApplicant selectAppMemberNo(Map info);

	GroomingHeart selectHeartMember(Map info);

	int addHeart(Map info);

	int cancelHeart(Map info);

	String selectGimg(String groomingNo);

	String findAppMemberNo(String applyNo);

	int addGroomingMember(Map map);

	String getGroomingNo(String memberNo);

	String findTagNo(String tagTemp);

	int insertGtag(Map map);

	Grooming select(String memberNo);

	int insertSaveGrooming(Grooming g);

	int GroupHostIn(Map map1);

	int deleteGtag(String groomingNo);

	int deleteGmember(String memberNo);

	ArrayList<GroupMember> selectMemberList(String groomingNo);

	int getListCount(String groomingNo);

	ArrayList<GroupBoard> selectGroupBoardList(GroupPageInfo pi,String groomingNo);

	int addBoardReadCount(String gBoardNo);

	GroupBoard selectGBoard(String gBoardNo);

}
