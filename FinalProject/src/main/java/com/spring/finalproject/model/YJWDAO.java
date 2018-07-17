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

	// 명소 상세정보
	@Override
	public List<HashMap<String, String>> detail_tourlist(String fk_category) {
		List<HashMap<String, String>> detail_tourlist = sqlsession.selectList("YJW.detail_tourlist", fk_category);
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
	
	
	
	





}
