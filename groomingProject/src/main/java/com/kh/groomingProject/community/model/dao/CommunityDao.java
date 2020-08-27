package com.kh.groomingProject.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

@Repository("cDao")
public class CommunityDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Board> selectList(String bCategoryNo) {
		ArrayList list = new ArrayList();
		HashMap<String, String> hashMap = new HashMap<>();
		hashMap.put("bCategoryNo",bCategoryNo);
		list = (ArrayList)sqlSessionTemplate.selectList("communityMapper.selectList", hashMap);
		
		return list;
	}

	public Board selectOne(String boardNo) {
		
		return sqlSessionTemplate.selectOne("communityMapper.selectOne", boardNo);
	}
	
	public int addViewCount(String boardNo) {
		
		return sqlSessionTemplate.update("communityMapper.addViewCount", boardNo);
	}
	
	public int communityInsert(Board b, Member member) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", b);
		map.put("memberNo", member.getMemberNo());
		
		return sqlSessionTemplate.insert("communityMapper.communityInsert", map);
	}
	
	public int communityUpdate(Board b, Member member) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", b);
		map.put("memberNo", member.getMemberNo());
		
		return sqlSessionTemplate.update("communityMapper.communityUpdate", map);
	}
	
	public int communityDelete(String boardNo) {
		
		return sqlSessionTemplate.delete("communityMapper.communityDelete", boardNo);
	}

	public ArrayList<Reply> selectReplyList(String boardNo) {
		ArrayList replyList = new ArrayList();
		HashMap<String, String> hashMap = new HashMap<>();
		hashMap.put("boardNo",boardNo);
		replyList = (ArrayList)sqlSessionTemplate.selectList("communityMapper.selectReplyList", hashMap);
		
		return replyList;
	}








	
}
