package com.jee.genesis.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String memEmail) {
		return sqlSession.selectOne("memberMapper.memEmail", memEmail);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int insertAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertAdmin", m);
	}

	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, String memName) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchMember", memName);
	}

	public Member buyMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.buyMember", m);
	}
}
