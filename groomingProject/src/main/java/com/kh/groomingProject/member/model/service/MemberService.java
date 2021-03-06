package com.kh.groomingProject.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberCertiCode;
import com.kh.groomingProject.member.model.vo.MemberSanctions;
import com.kh.groomingProject.member.model.vo.MemberTag;

public interface MemberService {

	int insertMember(Member m);

	Member loginMember(Member m);

	int emailDuplicateChk(Member m);

	int nickNameDuplicateChk(Member m);

	int phoneDuplicateChk(Member m);

	int updateMemberOption(Member m);

	int welcomePoint(String memberNo);

	int mergeMemberTags(MemberTag memberTag);

	int insertMemberKakao(Member m);

	int findMemberEmail(Member m);

	int insertRandomCode(MemberCertiCode mcc);

	int certiChk(MemberCertiCode mcc);

	int updateMemberPwd(Member m);

	ArrayList<Member> GroupMList(String groomingNo);

	Member selectGroupMemberNo(String gBoardNo);

	Member findMember(Member m);

	Member findEmail(Member m);

	int addExp(Map map1);

	MemberSanctions chkMemberSanction(String memberEmail);

}
