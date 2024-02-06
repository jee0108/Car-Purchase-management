package com.jee.genesis.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jee.genesis.admin.model.vo.CarType;
import com.jee.genesis.admin.model.vo.ExCar;
import com.jee.genesis.admin.model.vo.Inventory;
import com.jee.genesis.admin.model.vo.StockAndDelovery;
import com.jee.genesis.member.model.vo.Member;

@Repository
public class AdminDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<CarType> codeCheck(SqlSessionTemplate sqlSession, String classCode, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.codeCheck", classCode, rowBounds);
	}

	public int enrollCarType(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.insert("adminMapper.enrollCarType", c);
	}

	public int enrollCarTypePart(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.insert("adminMapper.enrollCarTypePart", c);
	}

	public int enrollCarTypeFile(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.insert("adminMapper.enrollCarTypeFile", c);
	}

	public ArrayList<CarType> allList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.allList", null, rowBounds);
	}

	public CarType detailView(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.selectOne("adminMapper.detailView", carName);
	}

	public int updateCarTypeFile(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.update("adminMapper.updateCarTypeFile", c);
	}

	public int updateCarType(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.update("adminMapper.updateCarType", c);
	}

	public int updateCarTypePart(SqlSessionTemplate sqlSession, CarType c) {
		return sqlSession.update("adminMapper.updateCarTypePart", c);
	}

	public int deleteModelFile(SqlSessionTemplate sqlSession, Integer fileNum) {
		return sqlSession.delete("adminMapper.deleteModelFile", fileNum);
	}

	public int deleteModelPart(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.delete("adminMapper.deleteModelPart", carName);
	}
	
	public int deleteModel(SqlSessionTemplate sqlSession, String carName) {
		return sqlSession.delete("adminMapper.deleteModel", carName);
	}

	public int equipmentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.equipmentListCount");
	}

	public ArrayList<Inventory> equipmentList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.equipmentList", null, rowBounds);
	}

	public ArrayList<Inventory> selectItem(SqlSessionTemplate sqlSession, String itemCode) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectItem", itemCode);
	}

	public int selectItemCount(SqlSessionTemplate sqlSession, String itemCode) {
		return sqlSession.selectOne("adminMapper.selectItemCount", itemCode);
	}

	public int insertInvenType(SqlSessionTemplate sqlSession, Inventory inven) {
		return sqlSession.insert("adminMapper.insertInvenType", inven);
	}

	public int insertStock(SqlSessionTemplate sqlSession, StockAndDelovery stock) {
		return sqlSession.insert("adminMapper.insertStock", stock);
	}

	public int estimateListCount(SqlSessionTemplate sqlSession, String dealerPhone) {
		return sqlSession.selectOne("adminMapper.estimateListCount", dealerPhone);
	}

	public ArrayList<ExCar> estimateList(SqlSessionTemplate sqlSession, RowBounds rowBounds, String dealerPhone) {
		return (ArrayList)sqlSession.selectList("adminMapper.estimateList", dealerPhone, rowBounds);
	}
	
	public ArrayList<Inventory> insertList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.insertList");
	}

	public ExCar detailEstimate(SqlSessionTemplate sqlSession, int exNum) {
		return sqlSession.selectOne("adminMapper.detailEstimate", exNum);
	}

	public ArrayList<StockAndDelovery> stockAllList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.stockAllList");
	}

	public ArrayList<StockAndDelovery> deloveryAllList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.deloveryAllList");
	}

	public ArrayList<StockAndDelovery> detailInvenresult(SqlSessionTemplate sqlSession, RowBounds rowBounds,
			String invenCode) {
		return (ArrayList)sqlSession.selectList("adminMapper.detailInvenresult", invenCode, rowBounds);
	}

	public int detailInvenresultCount(SqlSessionTemplate sqlSession, String invenCode) {
		return sqlSession.selectOne("adminMapper.detailInvenresultCount", invenCode);
	}


}
