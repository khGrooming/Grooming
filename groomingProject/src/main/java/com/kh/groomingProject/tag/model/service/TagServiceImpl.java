package com.kh.groomingProject.tag.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.tag.model.dao.TagDao;

@Service("tagService")
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;

	@Override
	public int mergeTags(String tagTemp) {
		
		return tagDao.mergeTags(tagTemp);
	}

}
