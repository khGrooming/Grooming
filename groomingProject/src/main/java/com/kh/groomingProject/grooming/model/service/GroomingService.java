package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.grooming.model.vo.GroomingPageInfo;
import com.kh.groomingProject.grooming.model.vo.GroomingSearch;
import com.kh.groomingProject.grooming.model.vo.GCheck;
import com.kh.groomingProject.grooming.model.vo.GReply;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.grooming.model.vo.GroupBoard;
import com.kh.groomingProject.grooming.model.vo.GroupMember;
import com.kh.groomingProject.grooming.model.vo.GroupPageInfo;
import com.kh.groomingProject.grooming.model.vo.Mentor;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.vo.MyPagePoint;

public interface GroomingService {

	ArrayList<Grooming> selectList(GroomingPageInfo pi);

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

	String selectGMemberNo(Map map);

	int insertBoard(GroupBoard g);

	int groupDelete(String gBoardNo);

	int updateGroupBoard(GroupBoard g);

	String selectGboardimg(String gBoardNo);

	ArrayList<GReply> selectReplyList(String gBoardNo);

	int addReply(GReply g);

	String selectGBoardNo(Map map);

	Grooming selectSave(String memberNo);

	int updateSaveGrooming(Grooming g);

	int getGroomingListCount();

	String getGMemberNo(Map map);

	ArrayList<GCheck> checkList(Map hashmap);
	
	int insertCheck(GCheck g);

	ArrayList<GCheck> confirmCheck(Map map);

	ArrayList<Grooming> groomingSearch(GroomingSearch gs);

	int updateCheck(GCheck g);

	int getCheckY(Map hashmap);

	int getCheckL(Map hashmap);

	int getDifDate(String groomingNo);

	String getMemberNickName(String memberNo);

	int getCheckN(Map hashmap);

	ArrayList<MyPagePoint> selectGpointList(String applyNo);

	int addPointMember(Map map1);

	Grooming limitCheck(String groomingNo);

	String selectMemberNo(String groomingNo);

	int addMentorPoint(Map map2);

	Mentor selectMentor(String memberNo);
}
