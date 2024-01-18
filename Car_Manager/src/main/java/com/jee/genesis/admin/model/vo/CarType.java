package com.jee.genesis.admin.model.vo;


import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class CarType {
	private String classCode;	
	private String carName;		
	private String className;		
	private Integer  carPrice;
	private String invenCode;
	
	// file
	private Integer fileNum;		//FILE_NUM	NUMBER
	private String originalName;	//ORIGINAL_NAME	VARCHAR2(30 BYTE)
	private String uploadName;	//UPLOAD_NAME	VARCHAR2(30 BYTE)
	private String filePath;	//FILE_PATH	VARCHAR2(1000 BYTE)
	private Date uploadDate;	// UPLOAD_DATE	DATE
	
}
