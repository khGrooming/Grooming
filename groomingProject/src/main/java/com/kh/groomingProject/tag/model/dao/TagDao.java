package com.kh.groomingProject.tag.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.tag.model.vo.Tag;

@Repository("tagDao")
public class TagDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int mergeTags(String tagTemp) {

		return sqlSessionTemplate.update("tagMapper.mergeTags", tagTemp);
	}

	public ArrayList<Tag> selectGtagList(String groomingNo) {

		return (ArrayList)sqlSessionTemplate.selectList("tagMapper.selectGtagList",groomingNo);
	}

	public int mergeTagsArr(String[] tag) {

		return sqlSessionTemplate.update("tagMapper.mergeTagsArr", tag);
	}

}
