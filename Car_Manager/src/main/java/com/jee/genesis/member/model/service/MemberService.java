package com.jee.genesis.member.model.service;

import com.jee.genesis.member.model.vo.CertVO;
import com.jee.genesis.member.model.vo.Member;

public interface MemberService {
	
	// 로그인(SELECT)
	Member loginMember(Member m);
	
	// 회원가입(INSERT)
	int insertMember(Member m);

	// 회원정보 수정(UPDATE)
	int updateMember(Member m);
	
	// 회원탈퇴(UPDATE)
	int deleteMember(Member m);
	
	// 아이디(이메일) 중복체크
	int emailCheck(String memEmail);
	
	//admin 등록
	int insertAdmin(Member m);
	
	
}
