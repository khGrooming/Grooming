package com.kh.groomingProject.declaration.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.declaration.model.vo.Declaration;

@Repository("dDao")
public class DeclarationDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int declareG(Declaration d) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("declarationMapper.declareG",d);
	}

	public Declaration selectGroupDeclare(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("declarationMapper.selectGroupDeclare",map);
	}

	public Declaration selectGroomingDeclare(Map info) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("declarationMapper.selectGroomingDeclare",info);
	}
	
}
