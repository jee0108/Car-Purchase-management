package com.jee.genesis.car.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class MyCarAndMyPart {
	
	private String carName;		//CAR_NAME	VARCHAR2(30 BYTE)
	private String mycarPhone;	//MYCAR_PHONE	VARCHAR2(11 BYTE)
	private String mycarDealer;	//MYCAR_DEALER	VARCHAR2(11 BYTE)
	private int mycarPrice;		//MYCAR_PRICE	NUMBER
	private String mycarDate;	//MYCAR_DATE	DATE
	
	private int mycarNum;	//MYCAR_NUM	NUMBER
	private String invenCode;	//INVEN_CODE	VARCHAR2(3000 BYTE)
	
	private String carNum;	//CAR_NUM	VARCHAR2(30 BYTE)
	private String carStatus;	//CAR_STATUS	VARCHAR2(1 BYTE)
	private String carDate;	//CAR_DATE	DATE
	
	private String memName;
}
