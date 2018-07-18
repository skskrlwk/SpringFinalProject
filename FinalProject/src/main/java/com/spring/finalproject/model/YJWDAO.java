package com.spring.finalproject.model;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class YJWDAO implements InterYJWDAO {
	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	@Override
	public HashMap<String, String> getSchedule(String seq) {
		HashMap<String, String> map = sqlsession.selectOne("YJW.getSchedule", seq);
		return map;
	}

	@Override
	public List<HashMap<String, String>> getSchedule_detail2List(String seq) {
		List<HashMap<String, String>> mapList = sqlsession.selectList("YJW.getSchedule_detail2List", seq);
		return mapList;
	}

	// 음식
	@Override
	public HashMap<String, String> getFood(HashMap<String, String> parmap) {
		HashMap<String, String> map = sqlsession.selectOne("YJW.getFood", parmap);
		return map;
	}
	
	// 쇼핑
	@Override
	public HashMap<String, String> getShop(HashMap<String, String> parmap) {
		HashMap<String, String> map = sqlsession.selectOne("YJW.getShop", parmap);
		return map;
	}
	
	// 명소
	@Override
	public HashMap<String, String> getTourlist(HashMap<String, String> parmap) {
		HashMap<String, String> map = sqlsession.selectOne("YJW.getTourlist", parmap);
		return map;
	}
	
	// 투어/액티비티
	@Override
	public HashMap<String, String> getTourActivityList(HashMap<String, String> parmap) {
		HashMap<String, String> map = sqlsession.selectOne("YJW.getTourActivityList", parmap);
		return map;
	}
	
	// 셀프북
	@Override
	public HashMap<String, String> getBookList(HashMap<String, String> parmap) {
		HashMap<String, String> map = sqlsession.selectOne("YJW.getBookList", parmap);
		return map;
	}

	
	// 음식 상세정보
	@Override
	public List<HashMap<String, String>> detail_food(String seq_food) {
		List<HashMap<String, String>> detail_food = sqlsession.selectList("YJW.detail_food", seq_food);
		return detail_food;
	}

	// 쇼핑 상세정보
	@Override
	public List<HashMap<String, String>> detail_shop(String seq_shop) {
		List<HashMap<String, String>> detail_shop = sqlsession.selectList("YJW.detail_shop", seq_shop);
		return detail_shop;
	}
	// 쇼핑 매장 가져오기
	@Override
	public List<HashMap<String, String>> detail_shop2(String fk_category) {
		List<HashMap<String, String>> detail_shop2 = sqlsession.selectList("YJW.detail_shop2", fk_category);
		return detail_shop2;
	}
	
	
	// 명소 상세정보
	@Override
	public List<HashMap<String, String>> detail_tourlist(String seq_tourlist) {
		List<HashMap<String, String>> detail_tourlist = sqlsession.selectList("YJW.detail_tourlist", seq_tourlist);
		return detail_tourlist;
	}


	// 일정표 1
	@Override
	public List<HashMap<String, String>> show_schedulerList1(HashMap<String,String> map) {
		List<HashMap<String, String>> show_schedulerList1 = sqlsession.selectList("YJW.show_schedulerList1",map);
		return show_schedulerList1;
	}
	
	// 일정표 2
	@Override
	public HashMap<String, String> show_schedulerList2(HashMap<String, String> map) {
		HashMap<String, String> show_schedulerList2 = sqlsession.selectOne("YJW.show_schedulerList2",map);
		return show_schedulerList2;
	}
	
	// 일정표 수정하기
	@Override
	public int update_scheduler(HashMap<String, String> map) {
		int result = sqlsession.update("YJW.update_scheduler", map);
		return result;
	}
	
	// fk_category로 명소리스트 가져오기
	@Override
	public List<HashMap<String, String>> editTourlist(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editTourlist = sqlsession.selectList("YJW.editTourlist",pramap);
		return editTourlist;
	}

	// fk_category로 음식리스트 가져오기
	@Override
	public List<HashMap<String, String>> editFood(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editFood = sqlsession.selectList("YJW.editFood",pramap);
		return editFood;
	}
	
	// fk_category로 쇼핑리스트 가져오기
	@Override
	public List<HashMap<String, String>> editShop(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editShop = sqlsession.selectList("YJW.editShop", pramap);
		return editShop;
	}
	
	// fk_category로 투어/액티비티 리스트 가져오기
	@Override
	public List<HashMap<String, String>> editTour(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editTour = sqlsession.selectList("YJW.editTour", pramap);
		return editTour;
	}
	
	// fk_category로 셀프북 리스트 가져오기
	@Override
	public List<HashMap<String, String>> editBook(HashMap<String, Object> pramap) {
		List<HashMap<String, String>> editBook = sqlsession.selectList("YJW.editBook", pramap);
		return editBook;
	}

	
	
	@Override
	public String getDetailCategory(HashMap<String, String> map) {
		String str = sqlsession.selectOne("YJW.getDetailCategory", map);
		return str;
	}

	@Override
	public int insertDetail2(HashMap<String, String> map) {
//		System.out.println(map.get("fk_seq"));
//		System.out.println(map.get("category"));
//		System.out.println(map.get("category_seq"));
		int n = sqlsession.insert("YJW.insertDetail2",map);
		return n;
	}

	

	

	




}
