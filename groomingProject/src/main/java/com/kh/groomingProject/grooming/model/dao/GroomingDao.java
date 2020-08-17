package com.kh.groomingProject.grooming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.member.model.vo.Member;

@Repository("gDao")

public class GroomingDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Grooming> selectList() {
		
		
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectList");
	}

	public ArrayList<Grooming> selectMentorList( ) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMentorList");
	}

	public ArrayList<Grooming> gSearch(Grooming g) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearch",g);
	}

	public ArrayList<Grooming> gSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchTitle",keyword);
	}

	public ArrayList<Grooming> gSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchWriter",keyword);
	}

	public ArrayList<Grooming> gSearchContent(String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.gSearchContent",keyword);
	}

	public int addReadCount(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("groomingMapper.updateCount",groomingNo);
	}

	public Grooming selectGrooming(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("groomingMapper.selectOne",groomingNo);
	}
//	public ArrayList<Grooming> selectGrooming(String groomingNo) {
//		// TODO Auto-generated method stub
//		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectDetailList",groomingNo);
//	}

	public ArrayList<Grooming> selectMoneyList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectMoneyList");
	}

	public ArrayList<GroomingTag> selectTag(String groomingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("tagMapper.selectTag",groomingNo);
	}

	public ArrayList<GroomingSpec> selectSpec(String groomingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectSpec",groomingNo);
	}

	public Member selectMember(String groomingNo) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectHost",groomingNo);
	}

	public int insertGrooming(Grooming g) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("groomingMapper.insertGrooming",g);
	}

	public ArrayList<Member> selectAppMember(String groomingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectAppMember",groomingNo);
	}

	public ArrayList<GroomingAppList> selectAppContent(String groomingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("groomingMapper.selectAppContent",groomingNo);
	}

	public int selectApplyOne(String applyNo) {
		Map<String, String> map = new HashMap<>();
		map.put("applyNo", applyNo);
		System.out.println(map);
		return sqlSessionTemplate.update("groomingMapper.selectApplyOne",map);
	}

	public int addGroomingP(String groomingNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("groomingMapper.addGroomingP",groomingNo);
	}

	public int selectRejectApp(String applyNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("groomingMapper.rejectApp",applyNo);
	}
	
	
	
	
}
