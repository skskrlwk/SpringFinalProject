package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

public interface InterLimDAO {

	List<HashMap<String, String>> getWorldMap();

	HashMap<String, String> getSchedule(String seq);

	List<HashMap<String, String>> getSchedule_detail2List(String seq);

	HashMap<String, String> getFood(HashMap<String, String> parmap);

	List<HashMap<String, String>> getCalendar(String seq);

	int AddSchedule(HashMap<String, String> scheduleMap);

	String getSeqval(String userid);

	int AddScheduleDetail(HashMap<String, String> map);

	String getScheduleDetailseq(String seq);

	int AddScheduleDetail2(HashMap<String, String> map2);

	int AddScheduler(String seq);

	int likecnt(String seq);

	int delSchedule(String seq);

	List<HashMap<String, String>> getCityRank();

	int addShop(HashMap<String, String> map);

	int addTour(HashMap<String, String> map);

	int addBook(HashMap<String, String> map);


}
