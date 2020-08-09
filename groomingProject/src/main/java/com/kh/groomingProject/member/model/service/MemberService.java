package com.kh.groomingProject.member.model.service;

import com.kh.groomingProject.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member loginMember(Member m);

	int emailDuplicateChk(Member m);

	int nickNameDuplicateChk(Member m);

	int phoneDuplicateChk(Member m);

}
