package com.jee.genesis.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class CarType {
	private String classCode;	
	private String carName;		
	private String className;		
	private Integer  carPrice;
	private String invenCode;
	
	// file
	private Integer fileNum;		//FILE_NUM	NUMBER
	private String originalName;	//ORIGINAL_NAME	VARCHAR2(300 BYTE)
	private String uploadName;		//UPLOAD_NAME	VARCHAR2(3000 BYTE)
	private String uploadDate;		// UPLOAD_DATE	DATE
	
}
