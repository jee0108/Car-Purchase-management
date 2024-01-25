package com.jee.genesis.car.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jee.genesis.car.model.service.CarService;
import com.jee.genesis.car.model.vo.CarModel;

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
}
