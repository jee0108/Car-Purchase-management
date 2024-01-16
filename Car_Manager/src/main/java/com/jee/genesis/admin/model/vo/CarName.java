package com.jee.genesis.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class CarName {
	private String carName;		//CAR_NAME	VARCHAR2(30 BYTE)
	private String classCode;	//CLASS_CODE	VARCHAR2(2 BYTE)
}
