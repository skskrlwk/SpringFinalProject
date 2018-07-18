package com.spring.finalproject.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterYJWDAO;

@Service
public class YJWService implements InterYJWService {
	
	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterYJWDAO dao;
		
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

	// 음식
	@Override
	public HashMap<String, String> getFood(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getFood(parmap);
		return map;
	}
	
	// 쇼핑
	@Override
	public HashMap<String, String> getShop(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getShop(parmap);
		return map;
	}
	
	// 명소
	@Override
	public HashMap<String, String> getTourlist(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getTourlist(parmap);
		return map;
	}
	
	// 투어/액티비티
	@Override
	public HashMap<String, String> getTourActivityList(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getTourActivityList(parmap);
		return map;
	}
	
	// 셀프북
	@Override
	public HashMap<String, String> getBookList(HashMap<String, String> parmap) {
		HashMap<String, String> map = dao.getBookList(parmap);
		return map;
	}
	
	
	// 음식 상세정보
	@Override
	public List<HashMap<String, String>> detail_food(String seq_food) {
		List<HashMap<String, String>> detail_food = dao.detail_food(seq_food);
		return detail_food;
	}
	 
	// 쇼핑 상세정보
	@Override
	public List<HashMap<String, String>> detail_shop(String seq_shop) {
		List<HashMap<String, String>> detail_shop = dao.detail_shop(seq_shop);
		return detail_shop;
	}
	
	// 쇼핑 매장 가져오기
	@Override
	public List<HashMap<String, String>> detail_shop2(String fk_category) {
		List<HashMap<String, String>> detail_shop2 = dao.detail_shop2(fk_category);
		return detail_shop2;
	}
	

	// 명소 상세정보
	@Override
	public List<HashMap<String, String>> detail_tourlist(String seq_tourlist) {
		List<HashMap<String, String>> detail_tourlist = dao.detail_tourlist(seq_tourlist);
		return detail_tourlist;
	}
	
	// 일정표 1
	@Override
	public List<HashMap<String, String>> show_schedulerList1(HashMap<String,String> map) {
		List<HashMap<String, String>> show_schedulerList1 = dao.show_schedulerList1(map);
		return show_schedulerList1;
	}

	// 일정표 2
	@Override
	public HashMap<String, String> show_schedulerList2(HashMap<String, String> map) {
		HashMap<String, String> show_schedulerList2 = dao.show_schedulerList2(map);
		return show_schedulerList2;
	}

	@Override
	public int update_scheduler(HashMap<String, String> map) {
		int result = dao.update_scheduler(map);
		return result;
	}
	
	// fk_category로 명소리스트 가져오기
	@Override
	public List<HashMap<String, String>> editTourlist(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editTourlist = dao.editTourlist(pramap);
		return editTourlist;
	}
	
	// fk_category로 음식리스트 가져오기
	@Override
	public List<HashMap<String, String>> editFood(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editFood = dao.editFood(pramap);
		return editFood;
	}
	
	// fk_category로 쇼핑리스트 가져오기
	@Override
	public List<HashMap<String, String>> editShop(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editShop = dao.editShop(pramap);
		return editShop;
	}
	
	// fk_category로 투어/액티비티 리스트 가져오기
	@Override
	public List<HashMap<String, String>> editTour(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editTour = dao.editTour(pramap);
		return editTour;
	}

	// fk_category로 셀프북 리스트 가져오기
	@Override
	public List<HashMap<String, String>> editBook(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editBook = dao.editBook(pramap);
		return editBook;
	}

	@Override
	public List<String> getDetailCategory(String seq, String[] fk_categoryArr) {
		
		List<String> list = new ArrayList<String>();
		
		for(int i=0; i<fk_categoryArr.length; i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("seq", seq);
						
			if(fk_categoryArr[i].length() < 4) {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 2);
			}
			else {
				fk_categoryArr[i] =fk_categoryArr[i].substring(0, 3);
			}
		//	System.out.println("fk_categoryArr[i]" + fk_categoryArr[i]);
			map.put("fk_category",fk_categoryArr[i]);
			
			String detailseq = dao.getDetailCategory(map);
			list.add(detailseq);
		}
		
				
		
		return list;
	}

	
	@Override
	public int insertDetail2(String[] imgseqArr, List<String> detail_seq, String category) {
		int n = 0;
		
		for(int i=0; i<imgseqArr.length; i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("category_seq", imgseqArr[i]);
			map.put("category", category);
			map.put("fk_seq", detail_seq.get(i));
			
			int m = dao.insertDetail2(map);
			n += m;
		}
		
		return n;
	}

	

	

	



	

	

	



	

	
	
}
