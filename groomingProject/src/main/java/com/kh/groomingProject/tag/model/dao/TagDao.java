package com.kh.groomingProject.tag.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tagDao")
public class TagDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int mergeTags(String tagTemp) {

		return sqlSessionTemplate.update("tagMapper.mergeTags", tagTemp);
	}

}
