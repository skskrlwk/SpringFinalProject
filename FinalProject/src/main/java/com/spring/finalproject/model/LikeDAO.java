package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//=====  DAO 선언 =====
@Repository
public class LikeDAO implements InterLikeDAO {
	
		// =====  의존객체 주입(DI : Dependency Injection) =====
		@Autowired
		private SqlSessionTemplate sqlsession;

		@Override
		public int likecnt(HashMap<String, String> map) {
			int result = sqlsession.selectOne("Yoon.likecnt", map);
			return result;
		}

		@Override
		public int checklike(HashMap<String, String> map) {
			int result = sqlsession.selectOne("Yoon.checklike", map);
			return result;
		}

		@Override
		public int addlike(HashMap<String, String> map) {
			int result = sqlsession.insert("Yoon.addlike", map);
			return result;
		}

		
}
