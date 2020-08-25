package com.kh.groomingProject.tag.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.tag.model.dao.TagDao;
import com.kh.groomingProject.tag.model.vo.Tag;

@Service("tagService")
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;

	@Override
	public int mergeTags(String tagTemp) {
		
		return tagDao.mergeTags(tagTemp);
	}

	@Override
	public ArrayList<Tag> selectGtagList(String groomingNo) {
		return tagDao.selectGtagList(groomingNo);
	}

}
