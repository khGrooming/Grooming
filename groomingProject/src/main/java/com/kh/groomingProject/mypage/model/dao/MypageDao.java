package com.kh.groomingProject.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.vo.MyPageApplicant;
import com.kh.groomingProject.mypage.model.vo.MyPageHeart;
import com.kh.groomingProject.mypage.model.vo.MyPagePageInfo;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;

@Repository("mpDao")
public class MypageDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Member testLoginUser(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.testLoginUser",mNo);
	}

	public ProfileMember testLoginUser2(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.testLoginUser2",mNo);
	}

	public ArrayList<Spec> selectSpecList(String mNo) {
		return (ArrayList)sqlSessionTemplate.selectList("MyPageMapper.selectSpecList",mNo);
	}

	public int updateProfileIMG(ProfileMember m) {
		return sqlSessionTemplate.update("MyPageMapper.updateProfileIMG",m);
	}

	public int updateMemo(Member m) {
		return sqlSessionTemplate.update("MyPageMapper.updateMemo",m);
	}

	public int memberDelete(Member m) {
		return sqlSessionTemplate.update("MyPageMapper.memberDelete",m);
	}

	public int memberInfoUpdate(Member m) {
		return sqlSessionTemplate.update("MyPageMapper.memberInfoUpdate",m);
	}

	public Member memberSelect(String memberNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.memberSelect",memberNo);
	}

	public int insertSpec(Spec s) {
		return sqlSessionTemplate.insert("MyPageMapper.insertSpec",s);
	}

	public String mentorUserSelect(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.mentorUserSelect",mNo);
	}

	public int insertMentor(String mNo) {
		return sqlSessionTemplate.insert("MyPageMapper.insertMentor",mNo);
	}

	public int mpSelectListCount(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.mpSelectListCount",mNo);
	}

	public ArrayList<Grooming> selectopenGroomingList(MyPagePageInfo pi, String mNo) {
		int offset=(pi.getCurrentPage()-1)*pi.getGroomingLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getGroomingLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("MyPageMapper.selectopenGroomingList",mNo,rowBounds);
	}

	public int selectPoint(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.selectPoint",mNo);
	}

	public int selectPoint2(String mNo) {		
		return sqlSessionTemplate.selectOne("MyPageMapper.selectPoint2",mNo);
	}

	public ArrayList<MyPageHeart> selectMyPageHeart(MyPagePageInfo pi,String mNo) {
		int offset=(pi.getCurrentPage()-1)*pi.getGroomingLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getGroomingLimit());
		return (ArrayList)sqlSessionTemplate.selectList("MyPageMapper.selectMyPageHeart",mNo,rowBounds);
	}

	public int heartListCount(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.heartListCount",mNo);
	}

	public int heartListDelete(String ghNo) {
		return sqlSessionTemplate.delete("MyPageMapper.heartListDelete",ghNo);
	}

	public int gApplicantListCount(String mNo) {
		return sqlSessionTemplate.selectOne("MyPageMapper.gApplicantListCount",mNo);
	}

	public ArrayList<MyPageApplicant> selectgApplicant(MyPagePageInfo pi, String mNo) {
		int offset=(pi.getCurrentPage()-1)*pi.getGroomingLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getGroomingLimit());
		return (ArrayList)sqlSessionTemplate.selectList("MyPageMapper.selectgApplicantList",mNo,rowBounds);
	}

	public int deleteApplicant(String gaNo) {
		return sqlSessionTemplate.delete("MyPageMapper.deleteApplicant",gaNo);
	}

	public Grooming selectGroomingTemp(String mNo) {
		return (Grooming)sqlSessionTemplate.selectOne("MyPageMapper.selectGroomingTemp", mNo);
	}

}
