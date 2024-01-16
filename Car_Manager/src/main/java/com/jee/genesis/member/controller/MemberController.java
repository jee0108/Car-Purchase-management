package com.jee.genesis.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jee.genesis.member.model.service.MemberService;
import com.jee.genesis.member.model.vo.CertVO;
import com.jee.genesis.member.model.vo.Member;

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
	@GetMapping("admin")
	public String webAdmin() {
		return "member/adminPage";
	}
	@GetMapping("admin-enroll")
	public String adminEnroll() {
		return "member/adminEnrollForm";
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
		
        return new Gson().toJson(randomNum);
	}
	
	// ------------------------ 메일인증
	@ResponseBody
	@GetMapping(value="duplicate-check", produces="application/json; charset=UTF-8")
	public String emailCheck(String memEmail) {
		
		String result = "";
		
		if(memberService.emailCheck(memEmail) > 0) {
			result = "N";
		} else {
			result = "Y";
		}
		return new Gson().toJson(result);
	}
	
	
	@ResponseBody
	@GetMapping(value="mail-check", produces="application/json; charset=UTF-8")
	public String sendMailCheck(String memEmail, HttpServletRequest request) throws MessagingException {
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		String ip = request.getRemoteAddr();
		
		Random r = new Random();
		int i = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(i);
		
		CertVO certVo = CertVO.builder()
							  .who(ip)
							  .secret(secret)
							  .build();
		
		helper.setTo(memEmail);;
		helper.setSubject("회원가입 인증번호입니다.");
		helper.setText("인증번호 : " +secret+"\n");
		
		sender.send(message);
		
		return new Gson().toJson(secret);
	}
	@ResponseBody
	@GetMapping(value="enrollMember", produces="application/json; charset=UTF-8")
	public String insertMember(Member m) {
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		String message = "";
		
		if(memberService.insertMember(m)>0) {
			message = "success";
		} else {
			message = "error";
		}
		return new Gson().toJson(message);
	}
	
	@ResponseBody
	@GetMapping(value="enrollAdmin", produces="application/json; charset=UTF-8")
	public String insertAdmin(Member m) {
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		String message = "";
		
		if(memberService.insertAdmin(m)>0) {
			message = "success";
		} else {
			message = "error";
		}
		return new Gson().toJson(message);
	}
	
	@RequestMapping("login")
	public ModelAndView login(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {// 로그인 실페 => 
			mv.addObject("errorMsg", "아이디와 비밀번호가 일치하지 않습니다.")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
}
