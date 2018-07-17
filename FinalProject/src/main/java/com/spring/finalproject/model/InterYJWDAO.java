package com.spring.finalproject.model;


import java.util.HashMap;
import java.util.List;

public interface InterYJWDAO {

//	List<FoodVO> foodList();		// 추천 음식
	/*
	List<HashMap<String, String>> show_tourList(HashMap<String,String> map);				// 명소	

	List<HashMap<String, String>> show_foodList(HashMap<String,String> map);				// 음식

	List<HashMap<String, String>> show_shopList(HashMap<String,String> map);				// 쇼핑

	List<HashMap<String, String>> show_TourActivityList(HashMap<String,String> map);		// 투어/액티비티

	List<BookVO> bookList();									// 셀프북

	

	

	List<HashMap<String, String>> detail_food(String seq_food);		// 음식 상세정보

	List<HashMap<String, String>> detail_shop(String seq_shop);		// 쇼핑 상세정보

	

	int updateScheduler(SchedulerVO schedulervo);	// 일정표2 수정

*/
	
	HashMap<String, String> getSchedule(String seq);

	List<HashMap<String, String>> getSchedule_detail2List(String seq);

	HashMap<String, String> getFood(HashMap<String, String> parmap);		// 음식
	
	HashMap<String, String> getShop(HashMap<String, String> parmap);		// 쇼핑
	
	HashMap<String, String> getTourlist(HashMap<String, String> parmap);	// 명소
	
	HashMap<String, String> getTourActivityList(HashMap<String, String> parmap);	// 투어/액티비티
	
	HashMap<String, String> getBookList(HashMap<String, String> parmap);			// 셀프북
	
	
	List<HashMap<String, String>> detail_food(String seq_food);		// 음식 상세정보

	List<HashMap<String, String>> detail_shop(String seq_shop);		// 쇼핑 상세정보

	List<HashMap<String, String>> detail_tourlist(String fk_category);	// 명소 상세정보
	
	List<HashMap<String, String>> show_schedulerList1(HashMap<String,String> map);		// 일정표 1
	
	HashMap<String, String> show_schedulerList2(HashMap<String, String> map);			// 일정표 2

	int update_scheduler(HashMap<String, String> map);	// 일정표 수정

	

}
