package com.kh.groomingProject.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertMember(Member m) {

		return sqlSessionTemplate.insert("memberMapper.insertMember", m);
	}

	public Member loginMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.loginMember", m);

	}

	public int emailDuplicateChk(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.emailDuplicateChk", m);
	}

	public int nickNameDuplicateChk(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.nickNameDuplicateChk", m);
	}

	public int phoneDuplicateChk(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.phoneDuplicateChk", m);
	}

}
