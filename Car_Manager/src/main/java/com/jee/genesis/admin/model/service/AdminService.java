package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import com.jee.genesis.admin.model.vo.ClassList;
import com.jee.genesis.common.model.vo.PageInfo;

public interface AdminService {

	ArrayList<ClassList> classCheck(PageInfo pi, String classCode);

	int selectListCount();

}
