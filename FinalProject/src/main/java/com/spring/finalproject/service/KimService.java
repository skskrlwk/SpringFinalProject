package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterCategoryDAO;

@Service
public class KimService implements InterKimService {

	@Autowired
	private InterCategoryDAO dao;

	@Override
	public List<HashMap<String, String>> getScheduleList() {
		List<HashMap<String, String>> schedulelist = dao.getScheduleList();
		return schedulelist;
	}

	@Override
	public List<HashMap<String, String>> getFoodlist(String country) {
		List<HashMap<String, String>> foodlist = dao.getFoodlist(country);
		return foodlist;
	}

	@Override
	public List<HashMap<String, String>> getPlacelist(String country) {
		List<HashMap<String, String>> placelist = dao.getPlacelist(country);
		return placelist;
	}

	@Override
	public List<HashMap<String, String>> getShoppinglist(String country) {
		List<HashMap<String, String>> shoppinglist = dao.getShoppinglist(country);
		return shoppinglist;
	}

	@Override
	public List<HashMap<String, String>> getTourlist(String country) {
		List<HashMap<String, String>> tourlist = dao.getTourlist(country);
		return tourlist;
	}

	@Override
	public List<HashMap<String, String>> getBooklist(String country) {
		List<HashMap<String, String>> booklist = dao.getBooklist(country);
		return booklist;
	}

}