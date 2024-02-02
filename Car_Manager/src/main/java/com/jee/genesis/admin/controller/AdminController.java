package com.jee.genesis.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.jee.genesis.admin.model.service.AdminService;
import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.admin.model.vo.ExCar;
import com.jee.genesis.admin.model.vo.Inventory;
import com.jee.genesis.admin.model.vo.StockAndDelovery;
import com.jee.genesis.car.model.service.CarService;
import com.jee.genesis.car.model.vo.CarModel;
import com.jee.genesis.car.model.vo.MakeCar;
import com.jee.genesis.common.model.vo.PageInfo;
import com.jee.genesis.common.template.Pagination;
import com.jee.genesis.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private CarService carService;
	@Autowired
	private JavaMailSender sender;
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)Math.random()*90000 +10000;
			
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "resources/uploadFiles/" + changeName;
	}
	
	// -------------------------- 화면연결
	@GetMapping("item-management")
	public String itemPage(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(), currentPage, 5, 5);
		
		model.addAttribute("allList", adminService.allList(pi));
		model.addAttribute("pi", pi);
		
		return "admin/itemPage";
	}
	
	@GetMapping("equipment-management")
	public String equipment(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(adminService.equipmentListCount(), currentPage, 10, 10);
		
		model.addAttribute("list", adminService.equipmentList(pi));
		model.addAttribute("pi", pi);
		
		model.addAttribute("insertList", adminService.insertList());
		
		return "admin/equipmentPage";
	}
	
	@GetMapping("write-quote")
	public String adminEquipment(Model model) {
		ArrayList<CarModel> list = carService.modelAll();
		List<com.jee.genesis.car.model.vo.Inventory> inven = carService.invenCodesList();
		model.addAttribute("list", list);
		model.addAttribute("inven", inven);
		
		return "admin/adminCarMakingPage";
	}
	
	@GetMapping("estimate")
	public String estimate(HttpSession session, Model model, @RequestParam(value="cPage", defaultValue="1") int currentPage) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String dealerPhone = loginUser.getMemPhone();
		
		PageInfo pi = Pagination.getPageInfo(adminService.estimateListCount(dealerPhone), currentPage, 10, 10);
		ArrayList<ExCar> estimate = adminService.estimateList(pi, dealerPhone);
		List<com.jee.genesis.car.model.vo.Inventory> inven = carService.invenCodesList();
		
		model.addAttribute("estimate", estimate);
		model.addAttribute("pi", pi);
		model.addAttribute("inven", inven);

		return "admin/dealerPage";
	}
	
	
	
	// --------------------------------------- 기능구현
	@ResponseBody
	@GetMapping(value="codeCheck", produces="application/json; charset=UTF-8")
	public String codeCheck(String classCode, @RequestParam(value="cPage", defaultValue="1") int currentPage) {
		PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(), currentPage, 10, 10);
		ArrayList<CarType> list = adminService.codeCheck(pi, classCode);
		HashMap<String, Object> map = new HashMap();
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	@PostMapping("enroll-model")
	public String enrollCarType(MultipartFile upfile, HttpSession session, CarType c, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")){
			c.setOriginalName(upfile.getOriginalFilename());
			c.setUploadName(saveFile(upfile, session));
		}
		
		if(adminService.enrollCarTypeFile(c)>0) {
			adminService.enrollCarType(c);
			adminService.enrollCarTypePart(c);
			session.setAttribute("alertMsg", "모델 추가 성공");
			return "redirect:item-management";
			
		}else {
			model.addAttribute("errorMsg", "모델 추가 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@GetMapping(value="detail-item", produces="application/json; charset=UTF-8")
	public String detailView(String carName){
		
		CarType car = adminService.detailView(carName);
		return new Gson().toJson(car);
	}
	
	@PostMapping("update-model")
	public String updateModel(MultipartFile upfile, HttpSession session, CarType c, Model model) {
		if(!upfile.getOriginalFilename().equals("")){
			c.setOriginalName(upfile.getOriginalFilename());
			c.setUploadName(saveFile(upfile, session));
			
			adminService.updateCarTypeFile(c);
			adminService.updateCarType(c);
			adminService.updateCarTypePart(c);
			
		}else {
			adminService.updateCarType(c);
			adminService.updateCarTypePart(c);
		}
		return "redirect:item-management";
	}
	
	@ResponseBody
	@GetMapping(value="deleteModel", produces="application/json; charset=UTF-8")
	public String deleteModel(String carName, Integer fileNum){
		String message = "";
		if(adminService.deleteModelPart(carName)>0) {
			adminService.deleteModel(carName);
			adminService.deleteModelFile(fileNum);
		}else {
			message = "삭제 실패";
		}
		
		return new Gson().toJson(message);
	}
	
	@ResponseBody
	@GetMapping(value="selectItem", produces="application/json; charset=UTF-8")
	public String selectItem(String itemCode, @RequestParam(value="cPage", defaultValue="1") int currentPage){
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectItemCount(itemCode), currentPage, 10, 10);
		ArrayList<Inventory> invenList = adminService.selectItem(itemCode, pi);
		
		HashMap<String, Object> map = new HashMap();
		map.put("pi", pi);
		map.put("invenList", invenList);
		
			
		return new Gson().toJson(map);
	}
	
	@PostMapping(value="enroll-invenType")
	public String insertInvenType(Inventory inven, HttpSession session){
		
		if(adminService.insertInvenType(inven)>0) {
			session.setAttribute("alertMsg", "추가 성공");
			return "redirect:equipment-management";
		}
		else {
			session.setAttribute("alertMsg", "추가 실패");
			return "common/errorPage";
		}
	}
	
	@PostMapping(value="enroll-stock")
	public String insertStock(StockAndDelovery stock, HttpSession session){
		
		if(adminService.insertStock(stock)>0) {
			session.setAttribute("alertMsg", "추가 성공");
			return "redirect:equipment-management";
		}
		else {
			session.setAttribute("alertMsg", "추가 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@GetMapping(value="detail-estimate", produces="application/json; charset=UTF-8")
	public String detailEstimate(int exNum){
		
		ExCar excar = adminService.detailEstimate(exNum);
		
		return new Gson().toJson(excar);
	}
	
}
