package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

public interface InterKimService {

	// 일정 디테일 가져오기
	List<HashMap<String, String>> getScheduleList();

	// 음식 목록 가져오기
	List<HashMap<String, String>> getFoodlist(String country);

	// 명소 목록 가져오기
	List<HashMap<String, String>> getPlacelist(String country);

	// 쇼핑 목록 가져오기
	List<HashMap<String, String>> getShoppinglist(String country);

	// 투어 목록 가져오기
	List<HashMap<String, String>> getTourlist(String country);

	// 도서 목록 가져오기
	List<HashMap<String, String>> getBooklist(String country);
	
	// 내 일정 목록 가져오기
	List<HashMap<String, String>> getMySchedules(String userid);

	// 일정 대표이미지 가져오기
	String getImgsrc(String seq_schedule);

}