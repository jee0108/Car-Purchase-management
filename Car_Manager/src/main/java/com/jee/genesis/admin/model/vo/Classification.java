package com.jee.genesis.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class Classification {
	private String classCode;	//CLASS_CODE	VARCHAR2(2 BYTE)
	private String className;	//CLASS_NAME	VARCHAR2(15 BYTE)
}
