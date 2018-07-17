package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

public interface InterScheduleDAO {

	int getTotalCount2(HashMap<String, String> map);
	int getTotalCount();

	List<ScheduleVO> schedulevoList2(HashMap<String, String> map);
	
	List<ScheduleVO> schedulevoList(HashMap<String, String> map);
	
	List<HashMap<String, String>> getindex();
	
	String getCategory(String seq_schedule);
	String getImage(String fk_category);

	
}
