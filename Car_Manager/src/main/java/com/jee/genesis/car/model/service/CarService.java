package com.jee.genesis.car.model.service;

import java.util.ArrayList;
import java.util.List;

import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;
import com.jee.genesis.car.model.vo.WantCar;
import com.jee.genesis.member.model.vo.Member;

public interface CarService {

	ArrayList<CarModel> modelAll();

	ArrayList<CarModel> modelSedan();

	ArrayList<CarModel> modelSuv();

	ArrayList<CarModel> modelEv();

	MakeCar carOption(String carName);

	List<Inventory> invenCodesList();

	String checkEnginePay(String engine);

	String checkDrivePay(String drive);

	String checkColorPay(String color);

	String checkWheelPay(String wheel);

	String checkInnerPay(String inner);

	ArrayList<Member> checkDealer();

	int wantCar(WantCar car);


}
