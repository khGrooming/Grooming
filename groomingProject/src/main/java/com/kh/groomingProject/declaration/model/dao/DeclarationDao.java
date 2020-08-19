package com.kh.groomingProject.declaration.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("declarationDao")
public class DeclarationDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
