package com.jee.genesis.car.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jee.genesis.admin.model.vo.ExCar;
import com.jee.genesis.car.model.service.CarService;
import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.Inventory;
import com.jee.genesis.car.model.vo.MakeCar;
import com.jee.genesis.car.model.vo.WantCar;
import com.jee.genesis.member.model.vo.Member;

@Controller
public class CarController {
	@Autowired
	private CarService carService;
	
	// -------------------------- 화면연결
	@GetMapping("model-list")
	public String modelListPage(Model model) {
		
		ArrayList<CarModel> list = carService.modelAll();
		model.addAttribute("list", list);
		
		return "model/modelListPage";
	}
	
	// --------------------------- 기능
	@ResponseBody
	@GetMapping(value="modelAll", produces="application/json; charset=UTF-8")
	public String modelAll() {
		ArrayList<CarModel> list = carService.modelAll();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@GetMapping(value="modelSedan", produces="application/json; charset=UTF-8")
	public String modelSedan() {
		ArrayList<CarModel> list = carService.modelSedan();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@GetMapping(value="modelSuv", produces="application/json; charset=UTF-8")
	public String modelSuv() {
		ArrayList<CarModel> list = carService.modelSuv();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@GetMapping(value="modelEv", produces="application/json; charset=UTF-8")
	public String modelEv() {
		ArrayList<CarModel> list = carService.modelEv();
		return new Gson().toJson(list);
	}
	
	@GetMapping("carMaking")
	public String carMaking(String carName, Model model) {
		MakeCar car = carService.carOption(carName);
		List<Inventory> inven = carService.invenCodesList();
		model.addAttribute("car", car);
		model.addAttribute("inven", inven);
		return "model/carMakingPage";
	}
	
	@ResponseBody
	@GetMapping(value="checkEnginePay", produces="application/json; charset=UTF-8")
	public String checkEnginePay(String engine) {
		String enginePay = carService.checkEnginePay(engine);
		return new Gson().toJson(enginePay);
	}
	
	@ResponseBody
	@GetMapping(value="checkDrivePay", produces="application/json; charset=UTF-8")
	public String checkDrivePay(String drive) {
		String drivePay = carService.checkDrivePay(drive);
		return new Gson().toJson(drivePay);
	}
	
	@ResponseBody
	@GetMapping(value="checkColorPay", produces="application/json; charset=UTF-8")
	public String checkColorPay(String color) {
		String colorPay = carService.checkColorPay(color);
		return new Gson().toJson(colorPay);
	}
	
	@ResponseBody
	@GetMapping(value="checkWheelPay", produces="application/json; charset=UTF-8")
	public String checkWheelPay(String wheel) {
		String wheelPay = carService.checkWheelPay(wheel);
		return new Gson().toJson(wheelPay);
	}
	
	@ResponseBody
	@GetMapping(value="checkInnerPay", produces="application/json; charset=UTF-8")
	public String checkInnerPay(String inner) {
		String innerPay = carService.checkInnerPay(inner);
		return new Gson().toJson(innerPay);
	}
	
	@ResponseBody
	@GetMapping(value="checkOptionPay", produces="application/json; charset=UTF-8")
	public String checkOptionPay(String option) {
		String optionPay = carService.checkOptionPay(option);
		return new Gson().toJson(optionPay);
	}
	
	@ResponseBody
	@GetMapping(value="check-dealer", produces="application/json; charset=UTF-8")
	public String checkDealer() {
		ArrayList<Member> dealer= carService.checkDealer();
		return new Gson().toJson(dealer);
	}
	
	@PostMapping("wantCar")
	public ModelAndView wantCar(WantCar car, ModelAndView mv) {
		
		String exInven = car.getCheckBoxGroup()+','+car.getColorGroup()+','+car.getDriveGroup()
		+','+car.getEngineGroup()+','+car.getInnerGroup()+','+car.getWheelGroup();
		
		car.setExInven(exInven);
		
		if(carService.wantCar(car)>0) {
			mv.addObject("alertMsg", "상담신청 완료되셨습니다")
			  .setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "상담신청에 실패하셨습니다.")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="selectCar", produces="application/json; charset=UTF-8")
	public String selectCar(String carName) {
		CarModel car= carService.selectCar(carName);
		return new Gson().toJson(car);
	}
	
	@ResponseBody
	@GetMapping(value="selectCarOption", produces="application/json; charset=UTF-8")
	public String selectCarOption(String carName){
		
		MakeCar car = carService.carOption(carName);
		
		return new Gson().toJson(car);
	}
}
