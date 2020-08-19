package com.kh.groomingProject.declaration.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.declaration.model.dao.DeclarationDao;

@Service("declarationService")
public class DeclarationServiceImpl implements DeclarationService{

	@Autowired
	private DeclarationDao declarationDao;
}
