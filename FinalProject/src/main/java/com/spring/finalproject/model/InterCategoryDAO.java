package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

public interface InterCategoryDAO {

	List<HashMap<String, String>> getScheduleList();

	List<HashMap<String, String>> getFoodlist(String country);

	List<HashMap<String, String>> getPlacelist(String country);

	List<HashMap<String, String>> getShoppinglist(String country);

	List<HashMap<String, String>> getTourlist(String country);

	List<HashMap<String, String>> getBooklist(String country);

}