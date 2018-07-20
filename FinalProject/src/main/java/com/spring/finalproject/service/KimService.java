package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterCategoryDAO;
import com.spring.finalproject.model.InterMypageDAO;

@Service
public class KimService implements InterKimService {

	@Autowired
	private InterCategoryDAO cdao;
	@Autowired
	private InterMypageDAO mdao;

	@Override
	public List<HashMap<String, String>> getScheduleList() {
		List<HashMap<String, String>> schedulelist = cdao.getScheduleList();
		return schedulelist;
	}

	@Override
	public List<HashMap<String, String>> getFoodlist(String country) {
		List<HashMap<String, String>> foodlist = cdao.getFoodlist(country);
		return foodlist;
	}

	@Override
	public List<HashMap<String, String>> getPlacelist(String country) {
		List<HashMap<String, String>> placelist = cdao.getPlacelist(country);
		return placelist;
	}

	@Override
	public List<HashMap<String, String>> getShoppinglist(String country) {
		List<HashMap<String, String>> shoppinglist = cdao.getShoppinglist(country);
		return shoppinglist;
	}

	@Override
	public List<HashMap<String, String>> getTourlist(String country) {
		List<HashMap<String, String>> tourlist = cdao.getTourlist(country);
		return tourlist;
	}

	@Override
	public List<HashMap<String, String>> getBooklist(String country) {
		List<HashMap<String, String>> booklist = cdao.getBooklist(country);
		return booklist;
	}
	
	@Override
	public List<HashMap<String, String>> getMySchedules(String userid) {
		List<HashMap<String, String>> myschedules = mdao.getMySchedules(userid);
		return myschedules;
	}

	@Override
	public String getImgsrc(String seq_schedule) {
		String imgsrc = mdao.getImgsrc(seq_schedule);
		return imgsrc;
	}

}