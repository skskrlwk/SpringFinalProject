package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import com.spring.finalproject.model.WorldDetailVO;

// Service단 인터페이스 선언 
public interface InterLimService {

	List<HashMap<String, String>> getWorldMap(); // 도시 정보 알아오기 

	HashMap<String, String> getSchedule(String seq); // 시퀀스 값으로 tbl_schedule의 값을 가져오는 메소드

	List<HashMap<String, String>> getSchedule_detail2List(String seq);
	// 시퀀스 값으로 tbl_schedule, tbl_schedule_detail, tbl_schedule_detail2
	// 3개를 join해서 category("tbl_food" 등) 과 category_seq("1")을 가져오는 것.

	HashMap<String, String> getFood(HashMap<String, String> parmap); // 맵에 있는 값으로  음식 정보 가져오기

	List<HashMap<String, String>> getCalendar(String seq); // 달력에 사용할 정보 가져오기

	int AddSchedule(HashMap<String, String> scheduleMap); // tbl_schedule테이블에 insert하는 작업

	String getSeqval(String userid); // tbl_schedule테이블에서 최근에 넣은 seq값 가져오기

	int AddDetails(String seq, String[] worldArr, String[] daysArr, String[] foodArr, String[] placeArr, String[] shopArr, String[] tourArr, String[] bookArr); // 트랜잭션 처리 

	int AddScheduler(String seq);

	int likecnt(String seq);

	int delSchedule(String seq);


	
	
}
