package com.jee.genesis.car.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;
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


}
