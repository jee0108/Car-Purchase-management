package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.admin.model.vo.ClassList;
import com.jee.genesis.common.model.vo.PageInfo;

public interface AdminService {

	ArrayList<ClassList> classCheck(PageInfo pi, String classCode);

	int selectListCount();

	int enrollCarType(CarType c);

	int enrollCarTypePart(CarType c);

	int enrollCarTypeFile(CarType c);

}
