package com.kh.groomingProject.declaration.model.service;

import java.util.Map;

import com.kh.groomingProject.declaration.model.vo.Declaration;

public interface DeclarationService {

	int declareG(Declaration d);

	Declaration selectGroupDeclare(Map map);

	Declaration selectGroomingDeclare(Map info);

	int declareB(Declaration d);

}
