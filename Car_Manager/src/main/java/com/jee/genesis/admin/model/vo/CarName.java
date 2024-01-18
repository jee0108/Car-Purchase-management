package com.jee.genesis.admin.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class CarName {
	private String carName;		//CAR_NAME	VARCHAR2(30 BYTE)
	private String classCode;	//CLASS_CODE	VARCHAR2(2 BYTE)
	private String className;	//CLASS_NAME	VARCHAR2(2 BYTE)
	private int carPrice;		//CAR_PRICE	NUMBER
	
	
	// file
	private int fileNum;		//FILE_NUM	NUMBER
	private String originalName;	//ORIGINAL_NAME	VARCHAR2(30 BYTE)
	private String uploadName;	//UPLOAD_NAME	VARCHAR2(30 BYTE)
	private String filePath;	//FILE_PATH	VARCHAR2(1000 BYTE)
	private Date uploadDate;	// UPLOAD_DATE	DATE
	
}
