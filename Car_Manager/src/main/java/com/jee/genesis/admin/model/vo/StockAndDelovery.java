package com.jee.genesis.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class StockAndDelovery {
	
	private int stockPkno;		//STOCK_PKNO	NUMBER
	private int StockNum;		//STOCK_NUM	NUMBER
	private String stockDate;	//STOCK_DATE	DATE
	
	private String invenCode;	//INVEN_CODE	VARCHAR2(20 BYTE)
	
	private int deloveryPkno;		//DELOVERY_PKNO	NUMBER
	private int deloveryNum;		//DELOVERY_NUM	NUMBER
	private String deloveryDate;	//DELOVERY_DATE	DATE

}
