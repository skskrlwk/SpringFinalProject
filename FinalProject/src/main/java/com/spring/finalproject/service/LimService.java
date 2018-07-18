package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public HashMap<String, String> getSchedule(String seq) {
		HashMap<String, String> map = dao.getSchedule(seq);
		return map;
	}

	@Override
	public List<HashMap<String, String>> getSchedule_detail2List(String seq) {
		List<HashMap<String, String>> mapList = dao.getSchedule_detail2List(seq);
		return mapList;
	}

	@Override
	public HashMap<String, String> getFood(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getFood(parmap);
		return map;
	}

	@Override
	public List<HashMap<String, String>> getCalendar(String seq) {
		List<HashMap<String, String>> maplist = dao.getCalendar(seq);
		return maplist;
	}

	@Override
	public int AddSchedule(HashMap<String, String> scheduleMap) {
		int n = dao.AddSchedule(scheduleMap);
		return n;
	}

	@Override
	public String getSeqval(String userid) {
		String str = dao.getSeqval(userid);
		return str;
	}

	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor = {Throwable.class} )
	public int AddDetails(String seq, String[] worldArr, String[] daysArr,  String[] foodArr,
			String[] placeArr, String[] shopArr, String[] tourArr, String[] bookArr) {

		int result = 0;
		
		// tbl_schedule_detail 에 insert 작업
		for(int i=0; i<worldArr.length; i++) {
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("seq", seq);
			map.put("world", worldArr[i]);
			map.put("days", daysArr[i]);
			
			int n = dao.AddScheduleDetail(map);
			
			result += n;
			if(n == 1) { // tbl_schedule_detail2 에 insert 작업
				String sequence = dao.getScheduleDetailseq(seq);// 가장 최근에 넣은 tbl_schedule_detail seq 값 가져오기
				
				// 음식
				if(!foodArr[i].equals("999")) {
					String[] strArr = foodArr[i].split(",");
					
					for(int s=0; s<strArr.length; s++) {
						HashMap<String, String> map2 = new HashMap<String, String>();
						map2.put("seq", sequence);
						map2.put("category", "tbl_food");
						map2.put("categoryseq", strArr[s]);
						dao.AddScheduleDetail2(map2);
					}
				}
				
				// 명소
				if(!placeArr[i].equals("999")) {
					String[] strArr = placeArr[i].split(",");
					
					for(int s=0; s<strArr.length; s++) {
						HashMap<String, String> map2 = new HashMap<String, String>();
						map2.put("seq", sequence);
						map2.put("category", "tbl_tourlist");
						map2.put("categoryseq", strArr[s]);
						dao.AddScheduleDetail2(map2);
					}
				}
				
				// 쇼핑 
				if(!shopArr[i].equals("999")) {
					String[] strArr = shopArr[i].split(",");
					
					for(int s=0; s<strArr.length; s++) {
						HashMap<String, String> map2 = new HashMap<String, String>();
						map2.put("seq", sequence);
						map2.put("category", "tbl_shop");
						map2.put("categoryseq", strArr[s]);
						dao.AddScheduleDetail2(map2);
					}
				}
				
				// 투어 
				if(!tourArr[i].equals("999")) {
					String[] strArr = tourArr[i].split(",");
					
					for(int s=0; s<strArr.length; s++) {
						HashMap<String, String> map2 = new HashMap<String, String>();
						map2.put("seq", sequence);
						map2.put("category", "tbl_tour");
						map2.put("categoryseq", strArr[s]);
						dao.AddScheduleDetail2(map2);
					}
				}
				
				// 책
				if(!bookArr[i].equals("999")) {
					String[] strArr = tourArr[i].split(",");
					
					for(int s=0; s<strArr.length; s++) {
						HashMap<String, String> map2 = new HashMap<String, String>();
						map2.put("seq", sequence);
						map2.put("category", "tbl_book");
						map2.put("categoryseq", strArr[s]);
						dao.AddScheduleDetail2(map2);
					}
				}
					
				
				
				
			}
			
		}// end of for() ----------------------------------
		
		
		return result;
	}

	@Override
	public int AddScheduler(String seq) {
		int n = dao.AddScheduler(seq);
		return n;
	}

	@Override
	public int likecnt(String seq) {
		int n = dao.likecnt(seq);
		return n;
	}
	
	
}
