package com.spring.finalproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterYJWDAO;

@Service
public class YJWService implements InterYJWService {
	
	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterYJWDAO dao;
		
	@Override
	public HashMap<String, String> getSchedule(String seq) {
		HashMap<String, String> map = dao.getSchedule(seq);
		return map;
	}

	@Override
	public List<HashMap<String, String>> getSchedule_detail2List(String seq) {
		List<HashMap<String, String>> mapList = dao.getSchedule_detail2List(seq);
		return mapList;
	}

	// 음식
	@Override
	public HashMap<String, String> getFood(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getFood(parmap);
		return map;
	}
	
	// 쇼핑
	@Override
	public HashMap<String, String> getShop(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getShop(parmap);
		return map;
	}
	
	// 명소
	@Override
	public HashMap<String, String> getTourlist(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getTourlist(parmap);
		return map;
	}
	
	// 투어/액티비티
	@Override
	public HashMap<String, String> getTourActivityList(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getTourActivityList(parmap);
		return map;
	}
	
	// 셀프북
	@Override
	public HashMap<String, String> getBookList(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getBookList(parmap);
		return map;
	}
	
	
	// 음식 상세정보
	@Override
	public List<HashMap<String, String>> detail_food(String seq_food) {
		List<HashMap<String, String>> detail_food = dao.detail_food(seq_food);
		return detail_food;
	}
	 
	// 쇼핑 상세정보
	@Override
	public List<HashMap<String, String>> detail_shop(String seq_shop) {
		List<HashMap<String, String>> detail_shop = dao.detail_shop(seq_shop);
		return detail_shop;
	}

	// 명소 상세정보
	@Override
	public List<HashMap<String, String>> detail_tourlist(String fk_category) {
		List<HashMap<String, String>> detail_tourlist = dao.detail_tourlist(fk_category);
		return detail_tourlist;
	}
	
	// 일정표 1
	@Override
	public List<HashMap<String, String>> show_schedulerList1(HashMap<String,String> map) {
		List<HashMap<String, String>> show_schedulerList1 = dao.show_schedulerList1(map);
		return show_schedulerList1;
	}

	// 일정표 2
	@Override
	public HashMap<String, String> show_schedulerList2(HashMap<String, String> map) {
		HashMap<String, String> show_schedulerList2 = dao.show_schedulerList2(map);
		return show_schedulerList2;
	}

	@Override
	public int update_scheduler(HashMap<String, String> map) {
		int result = dao.update_scheduler(map);
		return result;
	}
	
	
	



	

	

	



	

	
	
}
