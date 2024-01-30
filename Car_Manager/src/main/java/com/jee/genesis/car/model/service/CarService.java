package com.jee.genesis.car.model.service;

import java.util.ArrayList;
import java.util.List;

import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;

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

}
