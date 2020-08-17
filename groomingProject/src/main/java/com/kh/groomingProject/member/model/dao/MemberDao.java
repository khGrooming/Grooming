package com.kh.groomingProject.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberTag;

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

	public int updateMemberOption(Member m) {
		
		return sqlSessionTemplate.update("memberMapper.updateMemberOption", m);
	}

	public int welcomePoint(String memberNo) {

		return sqlSessionTemplate.insert("pointMapper.welcomePoint", memberNo);
	}

	public int mergeMemberTags(MemberTag memberTag) {

		return sqlSessionTemplate.update("memberMapper.mergeMemberTags", memberTag);
	}

	public int insertMemberKakao(Member m) {

		return sqlSessionTemplate.insert("memberMapper.insertMemberKakao", m);
	}

}
