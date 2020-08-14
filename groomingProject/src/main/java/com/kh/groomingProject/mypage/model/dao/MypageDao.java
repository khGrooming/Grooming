package com.kh.groomingProject.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.Member;
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

}
