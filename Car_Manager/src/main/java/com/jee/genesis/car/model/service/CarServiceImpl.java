package com.jee.genesis.car.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jee.genesis.car.model.dao.CarDao;
import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;
import com.jee.genesis.car.model.vo.MyCarAndMyPart;
import com.jee.genesis.car.model.vo.WantCar;
import com.jee.genesis.common.model.vo.PageInfo;
import com.jee.genesis.member.model.vo.Member;

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
		return carDao.checkDrivePay(sqlSession, drive);
	}

	@Override
	public String checkColorPay(String color) {
		return carDao.checkColorPay(sqlSession, color);
	}

	@Override
	public String checkWheelPay(String wheel) {
		return carDao.checkWheelPay(sqlSession, wheel);
	}

	@Override
	public String checkInnerPay(String inner) {
		return carDao.checkInnerPay(sqlSession, inner);
	}

	@Override
	public ArrayList<Member> checkDealer() {
		return carDao.checkDealer(sqlSession);
	}

	@Override
	public int wantCar(WantCar car) {
		return carDao.wantCar(sqlSession, car);
	}

	@Override
	public CarModel selectCar(String carName) {
		return carDao.selectCar(sqlSession, carName);
	}

	@Override
	public String checkOptionPay(String option) {
		return carDao.checkOptionPay(sqlSession, option);
	}

	@Override
	public int mycar(MyCarAndMyPart carPart) {
		return carDao.mycar(sqlSession, carPart);
	}

	@Override
	public int mypart(String invenCode) {
		return carDao.mypart(sqlSession, invenCode);
	}
	
	@Override
	public int insertCar(String carNum) {
		return carDao.insertCar(sqlSession, carNum);
	}
	
	@Override
	public int carPartListCount(String mycarDealer) {
		return carDao.carPartListCount(sqlSession, mycarDealer);
	}

	@Override
	public ArrayList<MyCarAndMyPart> carPartList(PageInfo pi, String mycarDealer) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return carDao.carPartList(sqlSession, mycarDealer, rowBounds);
	}

	@Override
	public int adminCarPartListCount() {
		return carDao.adminCarPartListCount(sqlSession);
	}

	@Override
	public ArrayList<MyCarAndMyPart> adminCarPartList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return carDao.adminCarPartList(sqlSession, null, rowBounds);
	}

}
