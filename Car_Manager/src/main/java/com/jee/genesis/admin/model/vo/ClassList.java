package com.jee.genesis.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class ClassList {
	private String itemCode;
	private String itemName;
	private String classCode;
	private String carName;
	private String invenCode;
	private String invenName;
}
