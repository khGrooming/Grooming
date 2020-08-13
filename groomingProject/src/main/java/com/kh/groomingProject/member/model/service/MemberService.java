package com.kh.groomingProject.member.model.service;

import com.kh.groomingProject.member.model.vo.Member;
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

}
