package com.jee.genesis.car.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class CarModel {
	
	private String carName;		//CAR_NAME
	private String classCode;	//CLASS_CODE
	private int fileNum;		//FILE_NUM
	private int carPrice;		//CAR_PRICE
	
	private String originalName;	//ORIGINAL_NAME	VARCHAR2(300 BYTE)
	private String uploadName;	//UPLOAD_NAME	VARCHAR2(1000 BYTE)
	private String uploadDate;	//UPLOAD_DATE	DATE
}
