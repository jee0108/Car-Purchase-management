package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.admin.model.vo.ExCar;
import com.jee.genesis.admin.model.vo.Inventory;
import com.jee.genesis.admin.model.vo.StockAndDelovery;
import com.jee.genesis.common.model.vo.PageInfo;
import com.jee.genesis.member.model.vo.Member;

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

	ArrayList<Inventory> selectItem(String itemCode, PageInfo pi);

	int selectItemCount(String itemCode);

	int insertInvenType(Inventory inven);

	int insertStock(StockAndDelovery stock);

	int estimateListCount(String dealerPhone);

	ArrayList<ExCar> estimateList(PageInfo pi, String dealerPhone);

	ExCar detailEstimate(int exNum);

	ArrayList<StockAndDelovery> stockAllList();

	ArrayList<StockAndDelovery> deloveryAllList();

	ArrayList<StockAndDelovery> detailInvenresult(PageInfo pi, String invenCode);

	int detailInvenresultCount(String invenCode);

	ArrayList<Inventory> insertList();

}
