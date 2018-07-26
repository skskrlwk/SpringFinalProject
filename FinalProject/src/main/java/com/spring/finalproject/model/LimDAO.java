package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LimDAO implements InterLimDAO {
	
	// ===== 의존객체 주입하기(DI: Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override 
	public List<HashMap<String, String>> getWorldMap() {
		
		List<HashMap<String, String>> mapList = sqlsession.selectList("Lim.getWorldMap");
		return mapList;
	}

	@Override
	public HashMap<String, String> getSchedule(String seq) {
		HashMap<String, String> map = sqlsession.selectOne("Lim.getSchedule", seq);
		return map;
	}

	@Override
	public List<HashMap<String, String>> getSchedule_detail2List(String seq) {
		List<HashMap<String, String>> mapList = sqlsession.selectList("Lim.getSchedule_detail2List", seq);
		return mapList;
	}


	@Override
	public HashMap<String, String> getFood(HashMap<String, String> parmap) {
		HashMap<String, String> map = sqlsession.selectOne("Lim.getFood", parmap);
		return map;
	}

	@Override
	public List<HashMap<String, String>> getCalendar(String seq) {
		List<HashMap<String, String>> maplist = sqlsession.selectList("Lim.getCalendar", seq);
		return maplist;
	}

	@Override
	public int AddSchedule(HashMap<String, String> scheduleMap) {
		int n = sqlsession.insert("Lim.AddSchedule", scheduleMap);
		return n;
	}

	@Override
	public String getSeqval(String userid) {
		String str = sqlsession.selectOne("Lim.getSeqval",userid);
		return str;
	}

	@Override
	public int AddScheduleDetail(HashMap<String, String> map) {
		int n = sqlsession.insert("Lim.AddScheduleDetail", map);
		return n;
	}

	@Override
	public String getScheduleDetailseq(String seq) {
		String n = sqlsession.selectOne("Lim.getScheduleDetailseq", seq);
		return n;
	}

	@Override
	public int AddScheduleDetail2(HashMap<String, String> map2) {
		int n = sqlsession.insert("Lim.AddScheduleDetail2", map2);
		return n;
	}

	@Override
	public int AddScheduler(String seq) {
		int n = sqlsession.insert("Lim.AddScheduler", seq);
		return n;
	}

	@Override
	public int likecnt(String seq) {
		int result = sqlsession.selectOne("Yoon.likecnt2", seq);
		return result;
	}

	@Override
	public int delSchedule(String seq) {
		int n = sqlsession.delete("Lim.delSchedule",seq);
		return n;
	}

	@Override
	public List<HashMap<String, String>> getCityRank() {
		List<HashMap<String, String>> listmap = sqlsession.selectList("Lim.getCityRank");
		return listmap;
	}

	@Override
	public int addShop(HashMap<String, String> map) {
		int n = sqlsession.insert("Lim.addShop", map);
		return n;
	}

	@Override
	public int addTour(HashMap<String, String> map) {
		int n = sqlsession.insert("Lim.addTour", map);
		return n;
	}

	@Override
	public int addBook(HashMap<String, String> map) {
		int n = sqlsession.insert("Lim.addBook", map);
		return n;
	}



}
