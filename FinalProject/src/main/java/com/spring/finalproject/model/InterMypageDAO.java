package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

public interface InterMypageDAO {

	List<HashMap<String, String>> getMySchedules(String userid);

	String getImgsrc(String seq_schedule);

}