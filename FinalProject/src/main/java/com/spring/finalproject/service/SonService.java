package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterScheduleDAO;
import com.spring.finalproject.model.ScheduleDetailVO;
import com.spring.finalproject.model.ScheduleVO;



//===== #30. Service 선언 ======
@Service
public class SonService implements InterSonService {
	
	@Autowired
	private InterScheduleDAO dao;

	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int cnt = dao.getTotalCount2(map);
		return cnt;
	}

	@Override
	public int getTotalCount() {
		int cnt = dao.getTotalCount();
		return cnt;
	}



	@Override
	public List<ScheduleVO> schedulevoList(HashMap<String, String> map) {
		List<ScheduleVO> schedulevoList = dao.schedulevoList(map);
		return schedulevoList;
	}

	
	@Override
	public List<ScheduleVO> schedulevoList2(HashMap<String, String> map) {
		List<ScheduleVO> schedulevoList = dao.schedulevoList2(map);
		return schedulevoList;
	}

	@Override
	public List<HashMap<String, String>> getindex() {
	
		 List<HashMap<String, String>> traplist = dao.getindex();
		
		
		return traplist;
	}

	@Override
	public List<HashMap<String, String>> getindex2() {
		List<HashMap<String, String>> traplist2 = dao.getindex2();
		return traplist2;
	}
	
	



		
		
		
		
		
		
	
	
	
	

}
