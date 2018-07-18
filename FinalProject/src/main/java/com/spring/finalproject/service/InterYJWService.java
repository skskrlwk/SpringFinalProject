package com.spring.finalproject.service;


import java.util.HashMap;
import java.util.List;


// Service단 인터페이스 선언 
public interface InterYJWService {

	HashMap<String, String> getSchedule(String seq); 						// 시퀀스 값으로 tbl_schedule의 값을 가져오는 메소드

	List<HashMap<String, String>> getSchedule_detail2List(String seq);
	// 시퀀스 값으로 tbl_schedule, tbl_schedule_detail, tbl_schedule_detail2
	// 3개를 join해서 category("tbl_food" 등) 과 category_seq("1")을 가져오는 것.

	HashMap<String, String> getFood(HashMap<String, String> parmap);				// 맵에 있는 값으로  음식 정보 가져오기

	HashMap<String, String> getShop(HashMap<String, String> parmap);				// 쇼핑
	
	HashMap<String, String> getTourlist(HashMap<String, String> parmap);			// 명소
	
	HashMap<String, String> getTourActivityList(HashMap<String, String> parmap);	// 투어/액티비티

	HashMap<String, String> getBookList(HashMap<String, String> parmap);			// 셀프북
	
	List<HashMap<String, String>> detail_food(String seq_food);				// 음식 상세정보

	List<HashMap<String, String>> detail_shop(String seq_shop);				// 쇼핑 상세정보
	List<HashMap<String, String>> detail_shop2(String fk_category);			// 쇼핑 매장 가져오기
	
	List<HashMap<String, String>> detail_tourlist(String seq_tourlist);		// 명소 상세정보


	List<HashMap<String, String>> show_schedulerList1(HashMap<String,String> map);		// 일정표 1

	HashMap<String, String> show_schedulerList2(HashMap<String, String> map);			// 일정표 2

	int update_scheduler(HashMap<String, String> map);									// 일정표 수정
	
	List<HashMap<String, String>> editTourlist(HashMap<String, Object> pramap);	// fk_category로 명소리스트 가져오기

	List<String> getDetailCategory(String seq, String[] fk_categoryArr);		// fk_category로 명소리스트 가져오기

	List<HashMap<String, String>> editFood(HashMap<String, Object> pramap);		// fk_category로 음식리스트 가져오기

	List<HashMap<String, String>> editShop(HashMap<String, Object> pramap);		// fk_category로 쇼핑리스트 가져오기
	
	List<HashMap<String, String>> editTour(HashMap<String, Object> pramap);		// fk_category로 투어/액티비티 리스트 가져오기
	
	List<HashMap<String, String>> editBook(HashMap<String, Object> pramap);		// fk_category로 셀프북 리스트 가져오기
	
	int insertDetail2(String[] imgseqArr, List<String> detail_seq, String category);	// 리스트 추가하기



	

	
	
	


	
	


	


	

	

	
	
}
