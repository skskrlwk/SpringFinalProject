package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO implements InterCategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> getScheduleList() {
		List<HashMap<String, String>> schedulelist = sqlsession.selectList("kim.getScheduleList");
		return schedulelist;
	}

	@Override
	public List<HashMap<String, String>> getFoodlist(String country) {
		List<HashMap<String, String>> foodlist = sqlsession.selectList("kim.getFoodlist", country);
		return foodlist;
	}

	@Override
	public List<HashMap<String, String>> getPlacelist(String country) {
		List<HashMap<String, String>> placelist = sqlsession.selectList("kim.getPlacelist", country);
		return placelist;
	}

	@Override
	public List<HashMap<String, String>> getShoppinglist(String country) {
		List<HashMap<String, String>> shoppinglist = sqlsession.selectList("kim.getShoppinglist", country);
		return shoppinglist;
	}

	@Override
	public List<HashMap<String, String>> getTourlist(String country) {
		List<HashMap<String, String>> tourlist = sqlsession.selectList("kim.getTourlist", country);
		return tourlist;
	}

	@Override
	public List<HashMap<String, String>> getBooklist(String country) {
		List<HashMap<String, String>> booklist = sqlsession.selectList("kim.getBooklist", country);
		return booklist;
	}

}