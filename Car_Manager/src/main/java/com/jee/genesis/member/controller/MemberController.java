package com.jee.genesis.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jee.genesis.member.model.service.MemberService;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender sender;
	
	// -------------------------- 화면연결
	@GetMapping("login-page")
	public String loginPage() {
		return "member/loginPage";
	}
	@GetMapping("member-login")
	public String loginForm() {
		return "member/loginForm";
	}
	@GetMapping("member-enroll")
	public String enrollForm() {
		return "member/enrollForm";
	}
	
	// --------------------- 휴대폰인증 메세지
	@ResponseBody
	@GetMapping(value="check-phone-meessage", produces="application/json; charset=UTF-8")
	public String sendPhoneCheckMessage(String memPhone) {
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSCRHEL0Z2CDDBK", "QLJSBBDDWZBTYM91WCGJRGFYLOUE4RVH", "https://api.coolsms.co.kr");
		Message message = new Message();
		message.setFrom("01040718816");
		message.setTo(memPhone);
		
		int randomNum = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		
		message.setText("인증번호 : ["+randomNum +"] 입니다.\n절대 타인에게는 알려주지 마세요.");

		try {
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
        return  new Gson().toJson(randomNum);
	}
}
