package com.jee.genesis.car.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jee.genesis.car.model.dao.CarDao;
import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;

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

	@Override
	public ArrayList<CarModel> modelSedan() {
		return carDao.modelSedan(sqlSession);
	}

	@Override
	public ArrayList<CarModel> modelSuv() {
		return carDao.modelSuv(sqlSession);
	}

	@Override
	public ArrayList<CarModel> modelEv() {
		return carDao.modelEv(sqlSession);
	}

	@Override
	public MakeCar carOption(String carName) {
		return carDao.carOption(sqlSession, carName);
	}

	@Override
	public List<Inventory> invenCodesList() {
		return carDao.invenCodesList(sqlSession);
	}

	@Override
	public String checkEnginePay(String engine) {
		return carDao.checkEnginePay(sqlSession, engine);
	}

	@Override
	public String checkDrivePay(String drive) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String checkColorPay(String color) {
		// TODO Auto-generated method stub
		return null;
	}

}
