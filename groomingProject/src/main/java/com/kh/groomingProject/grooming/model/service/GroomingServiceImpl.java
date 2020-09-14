package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.grooming.model.dao.GroomingDao;
import com.kh.groomingProject.grooming.model.vo.GCheck;
import com.kh.groomingProject.grooming.model.vo.GReply;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingPageInfo;
import com.kh.groomingProject.grooming.model.vo.GroomingSearch;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.grooming.model.vo.GroupBoard;
import com.kh.groomingProject.grooming.model.vo.GroupMember;
import com.kh.groomingProject.grooming.model.vo.GroupPageInfo;
import com.kh.groomingProject.grooming.model.vo.Mentor;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.vo.MyPagePoint;

@Service("gService")
public class GroomingServiceImpl implements GroomingService{

	@Autowired
	GroomingDao gDao;

	@Override
	public ArrayList<Grooming> selectList(GroomingPageInfo pi) {

		return gDao.selectList(pi);
	}

	@Override
	public ArrayList<Grooming> selectMentorList() {

		return gDao.selectMentorList();
	}

	@Override
	public ArrayList<Grooming> gSearchTitle(String keyword) {

		return gDao.gSearchTitle(keyword);
	}

	@Override
	public ArrayList<Grooming> gSearchWriter(String keyword) {

		return gDao.gSearchWriter(keyword);
	}

	@Override
	public ArrayList<Grooming> gSearchContent(String keyword) {

		return gDao.gSearchContent(keyword);
	}

	@Override
	public int addReadCount(String groomingNo) {

		return gDao.addReadCount(groomingNo);
	}

//	@Override
//	public ArrayList<Grooming> selectGrooming(String groomingNo) {
//
//		return gDao.selectGrooming(groomingNo) ;
//	}

	@Override
	public ArrayList<Grooming> selectMoneyList() {

		return gDao.selectMoneyList();
	}

	@Override
	public ArrayList<GroomingTag> selectTag(String groomingNo) {

		return gDao.selectTag(groomingNo);
	}

	@Override
	public ArrayList<GroomingSpec> selectSpec(String groomingNo) {
		return gDao.selectSpec(groomingNo);
	}

	@Override
	public Grooming selectGrooming(String groomingNo) {

		return gDao.selectGrooming(groomingNo) ;
	}

	@Override
	public Member selectMember(String groomingNo) {

		return gDao.selectMember(groomingNo);
	}

	@Override
	public int insertGrooming(Grooming g) {

		return gDao.insertGrooming(g);
	}

	@Override
	public ArrayList<Member> selectAppMember(String groomingNo) {

		return gDao.selectAppMember(groomingNo);
	}

	@Override
	public ArrayList<GroomingAppList> selectAppContent(String groomingNo) {

		return gDao.selectAppContent(groomingNo);
	}

	@Override
	public int selectApplyOne(String applyNo) {

		return gDao.selectApplyOne(applyNo);
	}

	@Override
	public int addGroomingP(String groomingNo) {

		return gDao.addGroomingP(groomingNo);
	}

	@Override
	public int selectRejectApp(String applyNo) {

		return gDao.selectRejectApp(applyNo);
	}

	@Override
	public int updateGrooming(Grooming g) {

		return gDao.updateGrooming(g);
	}

	@Override
	public int groomingDelete(String groomingNo) {

		return gDao.groomingDelete(groomingNo);
	}

	@Override
	public int statusUpdate(String groomingNo) {

		return gDao.statusUpdate(groomingNo);
	}

	@Override
	public int applyContent(GroomingApplicant ga) {

		return gDao.applyContent(ga);
	}

	@Override
	public GroomingApplicant selectAppMemberNo(Map info) {

		return gDao.selectAppMemberNo(info);
	}

	@Override
	public GroomingHeart selectHeartMember(Map info) {

		return gDao.selectHeartMember(info);
	}

	@Override
	public int addHeart(Map info) {

		return gDao.addHeart(info);
	}

	@Override
	public int cancelHeart(Map info) {

		return gDao.cancelHeart(info);
	}

	@Override
	public String selectGimg(String groomingNo) {

		return gDao.selectGimg(groomingNo);
	}

	@Override
	public String findAppMemberNo(String applyNo) {

		return gDao.findAppMemberNo(applyNo);
	}

	@Override
	public int addGroomingMember(Map map) {

		return gDao.addGroomingMember(map);
	}

	@Override
	public String getGroomingNo(String memberNo) {

		return gDao.getGroomingNo(memberNo);
	}

	@Override
	public String findTagNo(String tagTemp) {

		return gDao.findTagNo(tagTemp);
	}

	@Override
	public int insertGtag(Map map) {

		return gDao.insertGtag(map);
	}

	@Override
	public Grooming select(String memberNo) {

		return gDao.select(memberNo);
	}

	@Override
	public int insertSaveGrooming(Grooming g) {

		return gDao.insertSaveGrooming(g);
	}

	@Override
	public int GroupHostIn(Map map1) {

		return gDao.GroupHostIn(map1);
	}

	@Override
	public int deleteGtag(String groomingNo) {

		return gDao.deleteGtag(groomingNo);
	}

	@Override
	public int deleteGmember(String memberNo) {

		return gDao.deleteGmember(memberNo);
	}

	@Override
	public ArrayList<GroupMember> selectMemberList(String groomingNo) {

		return gDao.selectMemberList(groomingNo);
	}

	@Override
	public int getListCount(String groomingNo) {

		return gDao.getListCount(groomingNo);
	}

	@Override
	public ArrayList<GroupBoard> selectGroupBoardList(GroupPageInfo pi,String groomingNo) {

		return gDao.selectGroupBoardList( pi, groomingNo);
	}

	@Override
	public int addBoardReadCount(String gBoardNo) {

		return gDao.addBoardReadCount(gBoardNo);
	}

	@Override
	public GroupBoard selectGBoard(String gBoardNo) {

		return gDao.selectGBoard(gBoardNo);
	}

	@Override
	public String selectGMemberNo(Map map) {

		return gDao.selectGMemberNo(map);
	}

	@Override
	public int insertBoard(GroupBoard g) {

		return gDao.insertBoard(g);
	}

	@Override
	public int groupDelete(String gBoardNo) {

		return gDao.groupDelete(gBoardNo);
	}

	@Override
	public int updateGroupBoard(GroupBoard g) {

		return gDao.updateGroupBoard(g);
	}

	@Override
	public String selectGboardimg(String gBoardNo) {

		return gDao.selectGboardimg(gBoardNo);
	}

	@Override
	public ArrayList<GReply> selectReplyList(String gBoardNo) {

		return gDao.selectReplyList(gBoardNo);
	}

	@Override
	public int addReply(GReply g) {

		return gDao.addReply(g);
	}

	@Override
	public String selectGBoardNo(Map map) {

		return gDao.selectGBoardNo(map);
	}

	@Override
	public Grooming selectSave(String memberNo) {

		return gDao.selectSave(memberNo);
	}

	@Override
	public int updateSaveGrooming(Grooming g) {

		return gDao.updateSaveGrooming(g);
	}

	@Override
	public int getGroomingListCount() {

		return gDao.getGroomingListCount();
	}

	@Override
	public String getGMemberNo(Map map) {

		return gDao.getGMemberNo(map);
	}

	@Override
	public ArrayList<GCheck> checkList(Map hashmap) {

		return gDao.checkList(hashmap);
	}

	@Override
	public int insertCheck(GCheck g) {

		return gDao.insertCheck(g);
	}

	@Override
	public ArrayList<GCheck> confirmCheck(Map map) {

		return gDao.confirmCheck(map);
	}

	@Override
	public ArrayList<Grooming> groomingSearch(GroomingSearch gs) {

		return gDao.groomingSearch(gs);
	}
	@Override
	public int updateCheck(GCheck g) {
		// TODO Auto-generated method stub
		return gDao.updateCheck(g);
	}

	@Override
	public int getCheckY(Map hashmap) {
		// TODO Auto-generated method stub
		return gDao.getCheckY(hashmap);
	}

	@Override
	public int getCheckL(Map hashmap) {
		// TODO Auto-generated method stub
		return gDao.getCheckL(hashmap);
	}

	@Override
	public int getDifDate(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.getDifDate(groomingNo);
	}

	@Override
	public String getMemberNickName(String memberNo) {
		// TODO Auto-generated method stub
		return gDao.getMemberNickName(memberNo);
	}



	@Override
	public int getCheckN(Map hashmap) {
		// TODO Auto-generated method stub
		return gDao.getCheckN(hashmap);
	}

	@Override
	public ArrayList<MyPagePoint> selectGpointList(String applyNo) {
		// TODO Auto-generated method stub
		return gDao.selectGpointList(applyNo);
	}

	@Override
	public int addPointMember(Map map1) {
		// TODO Auto-generated method stub
		System.out.println("나 service map1 :" + map1);
		return gDao.addPointMember(map1);
	}

	@Override
	public Grooming limitCheck(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.limitCheck(groomingNo);
	}

	@Override
	public String selectMemberNo(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectMemberNo(groomingNo);
	}

	@Override
	public int addMentorPoint(Map map2) {
		// TODO Auto-generated method stub
		return gDao.addMentorPoint(map2);
	}

	@Override
	public Mentor selectMentor(String memberNo) {
		// TODO Auto-generated method stub
		return gDao.selectMentor(memberNo);
	}

	@Override
	public String findAppMemberEmail(String applyNo) {
		// TODO Auto-generated method stub
		return gDao.findAppMemberEmail(applyNo);
	}
	
}
