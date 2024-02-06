package com.jee.genesis.car.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;
import com.jee.genesis.car.model.vo.MyCarAndMyPart;
import com.jee.genesis.car.model.vo.WantCar;
import com.jee.genesis.member.model.vo.Member;


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

	public String checkEnginePay(SqlSessionTemplate sqlSession, String engine) {
		return sqlSession.selectOne("carMapper.checkEnginePay", engine);
	}

	public String checkDrivePay(SqlSessionTemplate sqlSession, String drive) {
		return sqlSession.selectOne("carMapper.checkDrivePay", drive);
	}

	public String checkColorPay(SqlSessionTemplate sqlSession, String color) {
		return sqlSession.selectOne("carMapper.checkColorPay", color);
	}

	public String checkWheelPay(SqlSessionTemplate sqlSession, String wheel) {
		return sqlSession.selectOne("carMapper.checkWheelPay", wheel);
	}

	public String checkInnerPay(SqlSessionTemplate sqlSession, String inner) {
		return sqlSession.selectOne("carMapper.checkInnerPay", inner);
	}

	public ArrayList<Member> checkDealer(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("carMapper.checkDealer");
	}

	public int wantCar(SqlSessionTemplate sqlSession, WantCar car) {
		return sqlSession.insert("carMapper.wantCar", car);
	}

	public CarModel selectCar(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.selectOne("carMapper.selectCar", carName);
	}

	public String checkOptionPay(SqlSessionTemplate sqlSession, String option) {
		return sqlSession.selectOne("carMapper.checkOptionPay", option);
	}

	public int mycar(SqlSessionTemplate sqlSession, MyCarAndMyPart carPart) {
		return sqlSession.insert("carMapper.mycar", carPart);
	}

	public int mypart(SqlSessionTemplate sqlSession, String invenCode) {
		return sqlSession.insert("carMapper.mypart", invenCode);
	}

	public int insertCar(SqlSessionTemplate sqlSession, String carNum) {
		return sqlSession.insert("carMapper.insertCar", carNum);
	}

	public int carPartListCount(SqlSessionTemplate sqlSession, String mycarDealer) {
		return sqlSession.selectOne("carMapper.carPartListCount", mycarDealer);
	}
	
	public ArrayList<MyCarAndMyPart> carPartList(SqlSessionTemplate sqlSession, String mycarDealer, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("carMapper.carPartList", mycarDealer, rowBounds);
	}

	public int adminCarPartListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("carMapper.adminCarPartListCount");
	}

	public ArrayList<MyCarAndMyPart> adminCarPartList(SqlSessionTemplate sqlSession, Object object,
			RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("carMapper.adminCarPartList", null, rowBounds);
	}

	public int insertEngineGroup(SqlSessionTemplate sqlSession, String engineGroup) {
		return sqlSession.insert("carMapper.insertEngineGroup", engineGroup);
	}

	public int insertDriveGroup(SqlSessionTemplate sqlSession, String driveGroup) {
		return sqlSession.insert("carMapper.insertDriveGroup", driveGroup);
	}

	public int insertColorGroup(SqlSessionTemplate sqlSession, String colorGroup) {
		return sqlSession.insert("carMapper.insertColorGroup", colorGroup);
	}

	public int insertWheelGroup(SqlSessionTemplate sqlSession, String wheelGroup) {
		return sqlSession.insert("carMapper.insertWheelGroup", wheelGroup);
	}

	public int insertInnerGroup(SqlSessionTemplate sqlSession, String innerGroup) {
		return sqlSession.insert("carMapper.insertInnerGroup", innerGroup);
	}

	public int insertCheckBoxGroup(SqlSessionTemplate sqlSession, String checkBoxes) {
		return sqlSession.insert("carMapper.insertCheckBoxGroup", checkBoxes);
	}

	public int updateCarStatus(SqlSessionTemplate sqlSession, int mycarNum) {
		return sqlSession.update("carMapper.updateCarStatus", mycarNum);
	}

}
