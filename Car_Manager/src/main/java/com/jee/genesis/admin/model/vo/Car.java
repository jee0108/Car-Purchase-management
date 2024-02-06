package com.jee.genesis.admin.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Car {
	private String carNum;		//CAR_NUM	VARCHAR2(15 BYTE)
	private String memPhone;	//MEM_PHONE	VARCHAR2(11 BYTE)
	private String classCode;	//MODEL_CODE	VARCHAR2(1 BYTE)
	private String carStatus;	//CAR_STATUS	VARCHAR2(1 BYTE)
	private String carDate;		 //CAR_DATE	DATE
	
}
