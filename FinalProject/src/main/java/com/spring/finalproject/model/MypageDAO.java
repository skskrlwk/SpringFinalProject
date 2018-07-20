package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO implements InterMypageDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<HashMap<String, String>> getMySchedules(String userid) {
		List<HashMap<String, String>> myschedules = sqlsession.selectList("kim.getMySchedules", userid);
		return myschedules;
	}

	@Override
	public String getImgsrc(String seq_schedule) {
		String imgsrc = sqlsession.selectOne("kim.getImgsrc", seq_schedule);
		return imgsrc;
	}

}