package com.jee.genesis.car.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;
import com.jee.genesis.car.model.vo.MyCarAndMyPart;
import com.jee.genesis.car.model.vo.WantCar;
import com.jee.genesis.common.model.vo.PageInfo;
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

	CarModel selectCar(String carName);

	String checkOptionPay(String option);

	int mycar(MyCarAndMyPart carPart);

	int mypart(String invenCode);

	ArrayList<MyCarAndMyPart> carPartList(PageInfo pi, String mycarDealer);

	int insertCar(String carNum);

	int carPartListCount(String mycarDealer);

	int adminCarPartListCount();

	ArrayList<MyCarAndMyPart> adminCarPartList(PageInfo pi);

	int insertEngineGroup(String engineGroup);

	int insertDriveGroup(String driveGroup);

	int insertColorGroup(String colorGroup);

	int insertWheelGroup(String wheelGroup);

	int insertInnerGroup(String innerGroup);

	int insertCheckBoxGroup(String checkBoxes);

	int updateCarStatus(int mycarNum);

}
