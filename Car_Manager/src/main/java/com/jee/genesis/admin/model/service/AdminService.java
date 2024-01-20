package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.common.model.vo.PageInfo;

public interface AdminService {

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

}
