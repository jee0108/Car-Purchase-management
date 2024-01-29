package com.jee.genesis.car.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class MakeCar {
	
	private String carName;		//CAR_NAME	VARCHAR2(30 BYTE)
	private String classCode;	//CLASS_CODE	VARCHAR2(2 BYTE)
	private int carPrice;		//CAR_PRICE	NUMBER
	
	private String invenCode;	//INVEN_CODE	VARCHAR2(3000 BYTE)
	
	
}
