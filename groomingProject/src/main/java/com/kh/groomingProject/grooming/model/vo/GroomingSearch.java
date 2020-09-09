package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingSearch implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4459696578136832558L;
	private String search;
	private String keyword;

	public GroomingSearch() {
		super();
	}
	public GroomingSearch(String search, String keyword) {
		super();
		this.search = search;
		this.keyword = keyword;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GroomingSearch [search=" + search + ", keyword=" + keyword + "]";
	}

}
