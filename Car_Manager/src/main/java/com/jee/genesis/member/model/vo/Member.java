package com.jee.genesis.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Member {

	private String memPhone;	//MEM_PHONE	VARCHAR2(11 BYTE)
	private String memEmail;	//MEM_EMAIL	VARCHAR2(50 BYTE)
	private String memName;		//MEM_NAME	VARCHAR2(30 BYTE)
	private String memPwd;		//MEM_PWD	VARCHAR2(30 BYTE)
	private String memRole;		//MEM_ROLE	VARCHAR2(1 BYTE)
}
