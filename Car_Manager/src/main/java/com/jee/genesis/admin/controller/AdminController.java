package com.jee.genesis.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import com.jee.genesis.common.model.vo.PageInfo;
import com.jee.genesis.common.template.Pagination;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
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
	
}
