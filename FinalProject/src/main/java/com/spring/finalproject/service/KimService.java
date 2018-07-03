package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterCategoryDAO;

@Service
public class KimService implements InterKimService {

	@Autowired
	InterCategoryDAO dao;

	@Override
	public List<HashMap<String, String>> getScheduleList() {
		List<HashMap<String, String>> schedulelist = dao.getScheduleList();
		return schedulelist;
	}

}