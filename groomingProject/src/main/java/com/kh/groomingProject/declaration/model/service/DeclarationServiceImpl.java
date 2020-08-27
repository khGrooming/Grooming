package com.kh.groomingProject.declaration.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.declaration.model.dao.DeclarationDao;
import com.kh.groomingProject.declaration.model.vo.Declaration;

@Service("declarationService")
public class DeclarationServiceImpl implements DeclarationService{

	@Autowired
	private DeclarationDao dDao;

	@Override
	public int declareG(Declaration d) {
		// TODO Auto-generated method stub
		return dDao.declareG(d);
	}

	@Override
	public Declaration selectGroupDeclare(Map map) {
		// TODO Auto-generated method stub
		return dDao.selectGroupDeclare(map);
	}
}
