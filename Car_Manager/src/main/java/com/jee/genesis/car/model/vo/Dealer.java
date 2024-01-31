package com.jee.genesis.car.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Dealer {
	
	private String dealerPhone;	//MEM_PHONE	VARCHAR2(11 BYTE)
	private String memEmail;	//MEM_EMAIL	VARCHAR2(50 BYTE)
	private String memName;	//MEM_NAME	VARCHAR2(30 BYTE)
	private String memRole;	
}
