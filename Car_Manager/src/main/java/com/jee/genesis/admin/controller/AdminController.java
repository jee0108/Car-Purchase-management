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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.jee.genesis.admin.model.service.AdminService;
import com.jee.genesis.admin.model.vo.ClassList;
import com.jee.genesis.common.model.vo.PageInfo;
import com.jee.genesis.common.template.Pagination;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private JavaMailSender sender;
	
	// -------------------------- 화면연결
	@GetMapping("item-management")
	public String loginPage() {
		return "admin/itemPage";
	}
	
	// ------------------------------------
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
	
	// ---------------------------------------
	@ResponseBody
	@GetMapping(value="check-class", produces="application/json; charset=UTF-8")
	public String classCheck(String classCode, @RequestParam(value="cPage", defaultValue="1") int currentPage) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(), currentPage, 10, 10);
		ArrayList<ClassList> list = adminService.classCheck(pi, classCode);
		
		HashMap<String, Object> map = new HashMap();
		
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
}
