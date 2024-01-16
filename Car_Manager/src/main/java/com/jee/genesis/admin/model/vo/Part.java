package com.jee.genesis.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class Part {
	private String invenCode;	//INVEN_CODE	VARCHAR2(10 BYTE)
	private String carNum;	//CAR_NUM	VARCHAR2(15 BYTE)
}
