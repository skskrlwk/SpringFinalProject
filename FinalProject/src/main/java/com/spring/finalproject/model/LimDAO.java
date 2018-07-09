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
		System.out.println("도착");
		List<HashMap<String, String>> mapList = sqlsession.selectList("Lim.getWorldMap");
		System.out.println("확인" + mapList.get(1).get("name"));
		return mapList;
	}

}
