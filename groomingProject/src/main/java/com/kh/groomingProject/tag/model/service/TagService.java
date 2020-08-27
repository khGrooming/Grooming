package com.kh.groomingProject.tag.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.tag.model.vo.Tag;

public interface TagService {

	int mergeTags(String tagTemp);

	ArrayList<Tag> selectGtagList(String groomingNo);

	int mergeTagsArr(String[] tag);

}
