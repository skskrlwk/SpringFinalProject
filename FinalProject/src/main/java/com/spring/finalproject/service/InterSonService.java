package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import com.spring.finalproject.model.ScheduleDetailVO;
import com.spring.finalproject.model.ScheduleVO;

// service 단 인터페이스 선언
public interface InterSonService {

	int getTotalCount2(HashMap<String, String> map);
	int getTotalCount();

	List<ScheduleVO> schedulevoList2(HashMap<String, String> map);
	
	
	List<ScheduleVO> schedulevoList(HashMap<String, String> map);
	
	List<HashMap<String, String>> getindex();
	
	String getCategory(String seq_schedule);
	String getImage(String fk_category);
	List<HashMap<String, String>> likerank();




	

	

	
	
	
	

}
