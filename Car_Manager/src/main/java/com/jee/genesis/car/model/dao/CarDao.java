package com.jee.genesis.car.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.car.model.vo.CarModel;


@Repository
public class CarDao {

	public ArrayList<CarModel> modelAll(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("carMapper.modelAll");
	}

}
