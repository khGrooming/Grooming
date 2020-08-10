package com.kh.groomingProject.community.notice.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("nDao")
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
}
