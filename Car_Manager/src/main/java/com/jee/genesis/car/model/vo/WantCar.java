package com.jee.genesis.car.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class WantCar {
	
	private int exNum;			//EX_NUM	NUMBER
	private String carName;		//CAR_NAME	VARCHAR2(30 BYTE)
	private String exInven;		//EX_INVEN	VARCHAR2(3000 BYTE)
	private int exPrice;		//EX_PRICE	NUMBER
	private String memberPhone;	//MEMBER_PHONE	VARCHAR2(11 BYTE)
	private String dealerPhone;	//DEALER_PHONE	VARCHAR2(11 BYTE)
	
	private String engineGroup;
	private String driveGroup;
	private String colorGroup;
	private String wheelGroup;
	private String innerGroup;
	private String checkBoxGroup;
}
