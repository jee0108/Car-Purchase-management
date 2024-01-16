package com.jee.genesis.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class Item {
	private String itemCode;	//ITEM_CODE	VARCHAR2(2 BYTE)
	private String itemName;	//ITEM_NAME	VARCHAR2(30 BYTE)
}
