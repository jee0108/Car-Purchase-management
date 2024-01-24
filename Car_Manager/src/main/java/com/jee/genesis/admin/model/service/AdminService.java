package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.admin.model.vo.Inventory;
import com.jee.genesis.common.model.vo.PageInfo;

public interface AdminService {

	// 품목관리
	ArrayList<CarType> codeCheck(PageInfo pi, String classCode);

	int selectListCount();

	int enrollCarType(CarType c);

	int enrollCarTypePart(CarType c);

	int enrollCarTypeFile(CarType c);

	ArrayList<CarType> allList(PageInfo pi);

	CarType detailView(String carName);

	int updateCarTypeFile(CarType c);

	int updateCarType(CarType c);

	int updateCarTypePart(CarType c);

	int deleteModelFile(Integer fileNum);

	int deleteModel(String carName);

	int deleteModelPart(String carName);

	// 비품관리
	int equipmentListCount();

	ArrayList<Inventory> equipmentList(PageInfo pi);

	ArrayList<Inventory> insertList();

	ArrayList<Inventory> selectItem(String itemCode, PageInfo pi);

	int selectItemCount(String itemCode);

	int insertInvenType(Inventory inven);

}
