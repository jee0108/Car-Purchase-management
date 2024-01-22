package com.jee.genesis.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.jee.genesis.admin.model.dao.AdminDao;
import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.admin.model.vo.Inventory;
import com.jee.genesis.common.model.vo.PageInfo;

@EnableTransactionManagement
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return adminDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<CarType> codeCheck(PageInfo pi, String classCode) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.codeCheck(sqlSession, classCode, rowBounds);
	}

	@Override
	public int enrollCarType(CarType c) {
		return adminDao.enrollCarType(sqlSession, c);
	}

	@Override
	public int enrollCarTypePart(CarType c) {
		return adminDao.enrollCarTypePart(sqlSession, c);
	}

	@Override
	public int enrollCarTypeFile(CarType c) {
		return adminDao.enrollCarTypeFile(sqlSession, c);
	}

	@Override
	public ArrayList<CarType> allList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.allList(sqlSession, rowBounds);
	}

	@Override
	public CarType detailView(String carName) {
		return adminDao.detailView(sqlSession, carName);
	}

	@Override
	public int updateCarTypeFile(CarType c) {
		return adminDao.updateCarTypeFile(sqlSession, c);
	}

	@Override
	public int updateCarType(CarType c) {
		return adminDao.updateCarType(sqlSession, c);
	}

	@Override
	public int updateCarTypePart(CarType c) {
		return adminDao.updateCarTypePart(sqlSession, c);
	}
	
	@Override
	public int deleteModelPart(String carName) {
		return adminDao.deleteModelPart(sqlSession, carName);
	}

	@Override
	public int deleteModel(String carName) {
		return adminDao.deleteModel(sqlSession, carName);
	}

	@Override
	public int deleteModelFile(Integer fileNum) {
		return adminDao.deleteModelFile(sqlSession, fileNum);
	}

	@Override
	public int equipmentListCount() {
		return adminDao.equipmentListCount(sqlSession);
	}

	@Override
	public ArrayList<Inventory> equipmentList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.equipmentList(sqlSession, rowBounds);
	}

	@Override
	public ArrayList<Inventory> insertList() {
		return adminDao.insertList(sqlSession);
	}
	@Override
	public int selectItemCount(String itemCode) {
		return adminDao.selectItemCount(sqlSession, itemCode);
	}

	@Override
	public ArrayList<Inventory> selectItem(String itemCode, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.selectItem(sqlSession, itemCode);
	}

	
}
