package com.jee.genesis.car.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jee.genesis.car.model.dao.CarDao;
import com.jee.genesis.car.model.vo.CarModel;

@Service
public class CarServiceImpl implements CarService {

	@Autowired
	private CarDao carDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<CarModel> modelAll() {
		return carDao.modelAll(sqlSession);
	}

}
