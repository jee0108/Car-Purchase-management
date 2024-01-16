package com.jee.genesis.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.admin.model.vo.ClassList;

@Repository
public class AdminDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<ClassList> classCheck(SqlSessionTemplate sqlSession, String classCode, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.classCheck", classCode, rowBounds);
	}

	

}
