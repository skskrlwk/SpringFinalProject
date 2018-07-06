package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import com.spring.finalproject.model.WorldDetailVO;

// Service단 인터페이스 선언 
public interface InterLimService {

	List<HashMap<String, String>> getWorldMap(); // 도시 정보 알아오기 

	
	
}
