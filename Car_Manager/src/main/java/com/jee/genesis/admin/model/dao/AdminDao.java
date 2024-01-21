package com.jee.genesis.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.admin.model.vo.CarType;

@Repository
public class AdminDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<CarType> codeCheck(SqlSessionTemplate sqlSession, String classCode, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.codeCheck", classCode, rowBounds);
	}

	public int enrollCarType(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.insert("adminMapper.enrollCarType", c);
	}

	public int enrollCarTypePart(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.insert("adminMapper.enrollCarTypePart", c);
	}

	public int enrollCarTypeFile(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.insert("adminMapper.enrollCarTypeFile", c);
	}

	public ArrayList<CarType> allList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.allList", null, rowBounds);
	}

	public CarType detailView(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.selectOne("adminMapper.detailView", carName);
	}

	public int updateCarTypeFile(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.update("adminMapper.updateCarTypeFile", c);
	}

	public int updateCarType(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.update("adminMapper.updateCarType", c);
	}

	public int updateCarTypePart(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.update("adminMapper.updateCarTypePart", c);
	}

	public int deleteModelFile(SqlSessionTemplate sqlSession, Integer fileNum) {
		return sqlSession.delete("adminMapper.deleteModelFile", fileNum);
	}

	public int deleteModelPart(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.delete("adminMapper.deleteModelPart", carName);
	}
	
	public int deleteModel(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.delete("adminMapper.deleteModel", carName);
	}


	

}
