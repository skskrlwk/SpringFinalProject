package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO implements InterCategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> getScheduleList() {
		List<HashMap<String, String>> schedulelist = sqlsession.selectList("kim.getScheduleList");
		return schedulelist;
	}

}