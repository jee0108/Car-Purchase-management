package com.jee.genesis.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jee.genesis.member.model.dao.MemberDao;
import com.jee.genesis.member.model.vo.CertVO;
import com.jee.genesis.member.model.vo.Member;

@EnableTransactionManagement
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int emailCheck(String memEmail) {
		return memberDao.emailCheck(sqlSession, memEmail);
	}

	@Override
	public void sendMail(CertVO certVo) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean validate(CertVO certVo) {
		// TODO Auto-generated method stub
		return false;
	}

}
