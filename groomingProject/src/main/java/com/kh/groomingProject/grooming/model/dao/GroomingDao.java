package com.kh.groomingProject.grooming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("gDao")

public class GroomingDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Grooming> selectList(GroomingPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectList",null,rowBounds);
	}

	public ArrayList<Grooming> selectMentorList( ) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMentorList");
	}

	public ArrayList<Grooming> gSearch(Grooming g) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearch",g);
	}

	public ArrayList<Grooming> gSearchTitle(String keyword) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchTitle",keyword);
	}

	public ArrayList<Grooming> gSearchWriter(String keyword) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchWriter",keyword);
	}

	public ArrayList<Grooming> gSearchContent(String keyword) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchContent",keyword);
	}

	public int addReadCount(String groomingNo) {

		return sqlSessionTemplate.update("groomingMapper.updateCount",groomingNo);
	}

	public Grooming selectGrooming(String groomingNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectOne",groomingNo);
	}
//	public ArrayList<Grooming> selectGrooming(String groomingNo) {
//
//		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectDetailList",groomingNo);
//	}

	public ArrayList<Grooming> selectMoneyList() {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMoneyList");
	}

	public ArrayList<GroomingTag> selectTag(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("tagMapper.selectTag",groomingNo);
	}

	public ArrayList<GroomingSpec> selectSpec(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectSpec",groomingNo);
	}

	public Member selectMember(String groomingNo) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectHost",groomingNo);
	}

	public int insertGrooming(Grooming g) {

		return sqlSessionTemplate.insert("groomingMapper.insertGrooming",g);
	}

	public ArrayList<Member> selectAppMember(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectAppMember",groomingNo);
	}

	public ArrayList<GroomingAppList> selectAppContent(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectAppContent",groomingNo);
	}

	public int selectApplyOne(String applyNo) {
		Map<String, String> map = new HashMap<>();
		map.put("applyNo", applyNo);
		//System.out.println(map);
		return sqlSessionTemplate.update("groomingMapper.selectApplyOne",map);
	}

	public int addGroomingP(String groomingNo) {

		return sqlSessionTemplate.update("groomingMapper.addGroomingP",groomingNo);
	}

	public int selectRejectApp(String applyNo) {

		return sqlSessionTemplate.update("groomingMapper.rejectApp",applyNo);
	}

	public int updateGrooming(Grooming g) {

		return sqlSessionTemplate.update("groomingMapper.updateGrooming",g);
	}

	public int groomingDelete(String groomingNo) {

		return sqlSessionTemplate.delete("groomingMapper.groomingDelete",groomingNo);
	}

	public int statusUpdate(String groomingNo) {

		return sqlSessionTemplate.update("groomingMapper.statusUpdate",groomingNo);
	}

	public int applyContent(GroomingApplicant ga) {

		return sqlSessionTemplate.insert("groomingMapper.applyContent",ga);
	}

	public GroomingApplicant selectAppMemberNo(Map info) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectAppMemberNo",info);
	}

	public GroomingHeart selectHeartMember(Map info) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectHeartMember",info);
	}

	public int addHeart(Map info) {

		return sqlSessionTemplate.insert("groomingMapper.addHeart",info);
	}

	public int cancelHeart(Map info) {

		return sqlSessionTemplate.delete("groomingMapper.cancelHeart",info);
	}

	public String selectGimg(String groomingNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectGimg",groomingNo);
	}

	public String findAppMemberNo(String applyNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.findAppMemberNo",applyNo);
	}

	public int addGroomingMember(Map map) {

		return sqlSessionTemplate.insert("groomingMapper.addGroomingMember",map);
	}

	public String getGroomingNo(String memberNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.getGroomingNo",memberNo);
	}

	public String findTagNo(String tagTemp) {

		return sqlSessionTemplate.selectOne("groomingMapper.findTagNo",tagTemp);
	}

	public int insertGtag(Map map) {

		return sqlSessionTemplate.insert("groomingMapper.insertGtag",map);
	}

	public Grooming select(String memberNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.select",memberNo);
	}

	public int insertSaveGrooming(Grooming g) {

		return sqlSessionTemplate.insert("groomingMapper.insertSave",g);
	}

	public int GroupHostIn(Map map1) {

		return sqlSessionTemplate.insert("groomingMapper.GroupHostIn",map1);
	}

	public int deleteGtag(String groomingNo) {
		
		return sqlSessionTemplate.delete("groomingMapper.deleteGtag",groomingNo);
	}

	public int deleteGmember(String memberNo) {

		return sqlSessionTemplate.delete("groomingMapper.deleteGmember",memberNo);
	}

	public ArrayList<GroupMember> selectMemberList(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMemberList",groomingNo);
	}

	public int getListCount(String groomingNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.getListCount",groomingNo);
	}

	public ArrayList<GroupBoard> selectGroupBoardList(GroupPageInfo pi,String groomingNo) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Map map = new HashMap();
		map.put("pi",pi);
		map.put("groomingNo",groomingNo);
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectGroupBoardList",map,rowBounds);
	}

	public int addBoardReadCount(String gBoardNo) {

		return sqlSessionTemplate.update("groomingMapper.addBoardReadCount",gBoardNo);
	}

	public GroupBoard selectGBoard(String gBoardNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectGBoard",gBoardNo);
	}

	public String selectGMemberNo(Map map) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectGMemberNo",map);
	}

	public int insertBoard(GroupBoard g) {

		return sqlSessionTemplate.insert("groomingMapper.insertBoard",g);
	}

	public int groupDelete(String gBoardNo) {

		return sqlSessionTemplate.delete("groomingMapper.groupDelete",gBoardNo);
	}

	public int updateGroupBoard(GroupBoard g) {

		return sqlSessionTemplate.update("groomingMapper.updateGroupBoard",g);
	}

	public String selectGboardimg(String gBoardNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectGboardimg",gBoardNo);
	}

	public ArrayList<GReply> selectReplyList(String gBoardNo) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectReplyList",gBoardNo);
	}

	public int addReply(GReply g) {

		return sqlSessionTemplate.insert("groomingMapper.addReply",g);
	}

	public String selectGBoardNo(Map map) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectGBoardNo",map);
	}

	public Grooming selectSave(String memberNo) {

		return sqlSessionTemplate.selectOne("groomingMapper.selectSave",memberNo);
	}

	public int updateSaveGrooming(Grooming g) {

		return sqlSessionTemplate.update("groomingMapper.updateSaveGrooming",g);
	}

	public int getGroomingListCount() {

		return sqlSessionTemplate.selectOne("groomingMapper.getGroomingListCount");
	}

	public String getGMemberNo(Map map) {

		return sqlSessionTemplate.selectOne("groomingMapper.getGMemberNo",map);
	}

	public ArrayList<GCheck> checkList(Map hashmap) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.checkList",hashmap);
	}

	public int insertCheck(GCheck g) {

		return sqlSessionTemplate.insert("groomingMapper.insertCheck",g);
	}

	public ArrayList<GCheck> confirmCheck(Map map) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.confirmCheck",map);
	}

	public ArrayList<Grooming> groomingSearch(GroomingSearch gs) {

		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.groomingSearch", gs);
	}
	
	public int updateCheck(GCheck g) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("groomingMapper.updateCheck",g);
	}

	public int getCheckY(Map hashmap) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.getCheckY",hashmap);
	}

	public int getCheckL(Map hashmap) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.getCheckL",hashmap);
	}

	public int getDifDate(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.getDifDate",groomingNo);
	}

	public String getMemberNickName(String memberNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.getMemberNickName",memberNo);
	}

	public int getCheckN(Map hashmap) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.getCheckN",hashmap);
	}
	
	public ArrayList<MyPagePoint> selectGpointList(String applyNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectGpointList",applyNo);
	}

	public int addPointMember(Map map1) {
		// TODO Auto-generated method stub
		//System.out.println("나 gDao map1 : " +map1);
		return sqlSessionTemplate.insert("groomingMapper.addPointMember",map1);
	}

	public Grooming limitCheck(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.limitCheck",groomingNo);
	}

	public String selectMemberNo(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.selectMemberNo",groomingNo);
	}

	public int addMentorPoint(Map map2) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("groomingMapper.addMentorPoint",map2) ;
	}

	public Mentor selectMentor(String memberNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.selectMentor",memberNo);
	}

	public String findAppMemberEmail(String applyNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.findAppMemberEmail",applyNo);
	}
	
	
}
