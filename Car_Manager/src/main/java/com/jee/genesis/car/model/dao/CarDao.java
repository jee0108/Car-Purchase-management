package com.jee.genesis.car.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;


@Repository
public class CarDao {

	public ArrayList<CarModel> modelAll(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("carMapper.modelAll");
	}

	public ArrayList<CarModel> modelSedan(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("carMapper.modelSedan");
	}

	public ArrayList<CarModel> modelSuv(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("carMapper.modelSuv");
	}

	public ArrayList<CarModel> modelEv(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("carMapper.modelEv");
	}

	public MakeCar carOption(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.selectOne("carMapper.carOption", carName);
	}

	public List<Inventory> invenCodesList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("carMapper.invenCodesList");
	}

}
