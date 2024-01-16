package com.jee.genesis.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class Car {
	private String carNum;		//CAR_NUM	VARCHAR2(15 BYTE)
	private String memPhone;	//MEM_PHONE	VARCHAR2(11 BYTE)
	private String classCode;	//MODEL_CODE	VARCHAR2(1 BYTE)
	private String carStatus;	//CAR_STATUS	VARCHAR2(1 BYTE)
	private Date carDate;		 //CAR_DATE	DATE
}
