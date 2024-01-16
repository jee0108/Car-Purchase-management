package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.jee.genesis.admin.model.dao.AdminDao;
import com.jee.genesis.admin.model.vo.ClassList;
import com.jee.genesis.common.model.vo.PageInfo;

@EnableTransactionManagement
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return adminDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<ClassList> classCheck(PageInfo pi, String classCode) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.classCheck(sqlSession, classCode, rowBounds);
	}

	
}
