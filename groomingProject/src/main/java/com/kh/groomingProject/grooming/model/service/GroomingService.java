package com.kh.groomingProject.grooming.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.member.model.vo.Member;

public interface GroomingService {

	ArrayList<Grooming> selectList();

	ArrayList<Grooming> selectMentorList( );

	ArrayList<Grooming> gSearchTitle(String keyword);
	ArrayList<Grooming> gSearchWriter(String keyword);
	ArrayList<Grooming> gSearchContent(String keyword);

	int addReadCount(String groomingNo);

	Grooming selectGrooming(String groomingNo);

	ArrayList<Grooming> selectMoneyList();

	ArrayList<GroomingTag> selectTag(String groomingNo);

	ArrayList<GroomingSpec> selectSpec(String groomingNo);

	Member selectMember(String groomingNo);

}
