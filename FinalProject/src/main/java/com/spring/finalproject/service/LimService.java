package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterLimDAO;


@Service
public class LimService implements InterLimService {

	// ===== 의존객체 주입하기(DI: Dependency Injection) =====
	@Autowired
	private InterLimDAO dao;

	@Override
	public List<HashMap<String, String>> getWorldMap() {
		List<HashMap<String, String>> mapList = dao.getWorldMap();
		return mapList;
	}
	
	
}
