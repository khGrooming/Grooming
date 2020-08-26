package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.grooming.model.dao.GroomingDao;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.grooming.model.vo.GroupBoard;
import com.kh.groomingProject.grooming.model.vo.GroupMember;
import com.kh.groomingProject.member.model.vo.Member;

@Service("gService")
public class GroomingServiceImpl implements GroomingService{

	@Autowired
	GroomingDao gDao;

	@Override
	public ArrayList<Grooming> selectList() {
		// TODO Auto-generated method stub
		return gDao.selectList();
	}

	@Override
	public ArrayList<Grooming> selectMentorList() {
		// TODO Auto-generated method stub
		return gDao.selectMentorList();
	}

	@Override
	public ArrayList<Grooming> gSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return gDao.gSearchTitle(keyword);
	}

	@Override
	public ArrayList<Grooming> gSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return gDao.gSearchWriter(keyword);
	}

	@Override
	public ArrayList<Grooming> gSearchContent(String keyword) {
		// TODO Auto-generated method stub
		return gDao.gSearchContent(keyword);
	}

	@Override
	public int addReadCount(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.addReadCount(groomingNo);
	}

//	@Override
//	public ArrayList<Grooming> selectGrooming(String groomingNo) {
//		// TODO Auto-generated method stub
//		return gDao.selectGrooming(groomingNo) ;
//	}

	@Override
	public ArrayList<Grooming> selectMoneyList() {
		// TODO Auto-generated method stub
		return gDao.selectMoneyList();
	}

	@Override
	public ArrayList<GroomingTag> selectTag(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectTag(groomingNo);
	}

	@Override
	public ArrayList<GroomingSpec> selectSpec(String groomingNo) {
		return gDao.selectSpec(groomingNo);
	}

	@Override
	public Grooming selectGrooming(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectGrooming(groomingNo) ;
	}

	@Override
	public Member selectMember(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectMember(groomingNo);
	}

	@Override
	public int insertGrooming(Grooming g) {
		// TODO Auto-generated method stub
		return gDao.insertGrooming(g);
	}

	@Override
	public ArrayList<Member> selectAppMember(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectAppMember(groomingNo);
	}

	@Override
	public ArrayList<GroomingAppList> selectAppContent(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectAppContent(groomingNo);
	}

	@Override
	public int selectApplyOne(String applyNo) {
		// TODO Auto-generated method stub
		return gDao.selectApplyOne(applyNo);
	}

	@Override
	public int addGroomingP(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.addGroomingP(groomingNo);
	}

	@Override
	public int selectRejectApp(String applyNo) {
		// TODO Auto-generated method stub
		return gDao.selectRejectApp(applyNo);
	}

	@Override
	public int updateGrooming(Grooming g) {
		// TODO Auto-generated method stub
		return gDao.updateGrooming(g);
	}

	@Override
	public int groomingDelete(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.groomingDelete(groomingNo);
	}

	@Override
	public int statusUpdate(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.statusUpdate(groomingNo);
	}

	@Override
	public int applyContent(GroomingApplicant ga) {
		// TODO Auto-generated method stub
		return gDao.applyContent(ga);
	}

	@Override
	public GroomingApplicant selectAppMemberNo(Map info) {
		// TODO Auto-generated method stub
		return gDao.selectAppMemberNo(info);
	}

	@Override
	public GroomingHeart selectHeartMember(Map info) {
		// TODO Auto-generated method stub
		return gDao.selectHeartMember(info);
	}

	@Override
	public int addHeart(Map info) {
		// TODO Auto-generated method stub
		return gDao.addHeart(info);
	}

	@Override
	public int cancelHeart(Map info) {
		// TODO Auto-generated method stub
		return gDao.cancelHeart(info);
	}

	@Override
	public String selectGimg(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectGimg(groomingNo);
	}

	@Override
	public String findAppMemberNo(String applyNo) {
		// TODO Auto-generated method stub
		return gDao.findAppMemberNo(applyNo);
	}

	@Override
	public int addGroomingMember(Map map) {
		// TODO Auto-generated method stub
		return gDao.addGroomingMember(map);
	}

	@Override
	public String getGroomingNo(String memberNo) {
		// TODO Auto-generated method stub
		return gDao.getGroomingNo(memberNo);
	}

	@Override
	public String findTagNo(String tagTemp) {
		// TODO Auto-generated method stub
		return gDao.findTagNo(tagTemp);
	}

	@Override
	public int insertGtag(Map map) {
		// TODO Auto-generated method stub
		return gDao.insertGtag(map);
	}

	@Override
	public Grooming select(String memberNo) {
		// TODO Auto-generated method stub
		return gDao.select(memberNo);
	}

	@Override
	public int insertSaveGrooming(Grooming g) {
		// TODO Auto-generated method stub
		return gDao.insertSaveGrooming(g);
	}

	@Override
	public int GroupHostIn(Map map1) {
		// TODO Auto-generated method stub
		return gDao.GroupHostIn(map1);
	}

	@Override
	public int deleteGtag(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.deleteGtag(groomingNo);
	}

	@Override
	public int deleteGmember(String memberNo) {
		// TODO Auto-generated method stub
		return gDao.deleteGmember(memberNo);
	}

	@Override
	public ArrayList<GroupMember> selectMemberList(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.selectMemberList(groomingNo);
	}

	@Override
	public int getListCount(String groomingNo) {
		// TODO Auto-generated method stub
		return gDao.getListCount(groomingNo);
	}

	@Override
	public ArrayList<GroupBoard> selectGroupBoardList(Map map) {
		// TODO Auto-generated method stub
		return gDao.selectGroupBoardList(map);
	}


	
}
