package com.kh.groomingProject.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.common.CommunityPageInfo;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

@Repository("cDao")
public class CommunityDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Board> selectList(String bCategoryNo, CommunityPageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSessionTemplate.selectList("communityMapper.selectList", bCategoryNo, rowBounds);
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

	public ArrayList<Reply> replySelectList(String boardNo) {
		
		return (ArrayList)sqlSessionTemplate.selectList("communityMapper.replySelectList", boardNo);
	}

	public int replyInsert(Reply reply, Member member) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply", reply);
		map.put("memberNo", member.getMemberNo());
		System.out.println("dao " + reply);
		return sqlSessionTemplate.insert("communityMapper.replyInsert", map);
	}

	public ArrayList<Board> communityTopList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("communityMapper.communityTopList");
	}

	public ArrayList<Board> communitySearch(String communitySearch) {
		
		return (ArrayList)sqlSessionTemplate.selectList("communityMapper.communitySearch", communitySearch);
	}

	public int getListCount(String bCategoryNo) {
		
		return sqlSessionTemplate.selectOne("communityMapper.getListCount", bCategoryNo);
	}

	public int replyUpdate(Reply reply, Member member) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply", reply);
		map.put("memberNo", member.getMemberNo());
		return sqlSessionTemplate.update("communityMapper.replyUpdate", map);
	}

	public int replyDelete(Reply reply, Member member) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply", reply);
		map.put("memberNo", member.getMemberNo());
		return sqlSessionTemplate.delete("communityMapper.replyDelete", map);
	}












	
}
