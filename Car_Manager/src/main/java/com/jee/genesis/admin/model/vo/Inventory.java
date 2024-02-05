package com.jee.genesis.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Inventory {
	private String invenCode;	//INVEN_CODE	VARCHAR2(20 BYTE)
	private String invenName;	//INVEN_NAME	VARCHAR2(50 BYTE)
	private int invenPay;		//INVEN_PAY	NUMBER
	private int invenNum;		//INVEN_NUM	NUMBER
	private String invenDate;		//INVEN_DATE	DATE
	private String itemCode;	//ITEM_CODE	VARCHAR2(2 BYTE)
	private String itemName;	//ITEM_NAME
	private int invenPlusPay;
	
}
