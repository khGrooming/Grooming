package com.kh.groomingProject.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberCertiCode;
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

	public int findMemberEmail(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.findMemberEmail", m);
	}

	public Member findEmail(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.findEmail", m);
	}

	public int insertRandomCode(MemberCertiCode mcc) {

		return sqlSessionTemplate.insert("memberMapper.insertRandomCode", mcc);
	}

	public int certiChk(MemberCertiCode mcc) {

		return sqlSessionTemplate.selectOne("memberMapper.certiChk", mcc);
	}

	public int updateMemberPwd(Member m) {

		return sqlSessionTemplate.update("memberMapper.updateMemberPwd", m);
	}

	public ArrayList<Member> GroupMList(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectGroupMList",groomingNo);
	}

	public Member findMember(Member m) {

		return (Member)sqlSessionTemplate.selectOne("memberMapper.findMember",m);
	}

}
