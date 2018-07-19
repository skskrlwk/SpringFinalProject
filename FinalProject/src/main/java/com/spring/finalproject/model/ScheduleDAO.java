package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//=====  DAO 선언 =====
@Repository
public class ScheduleDAO implements InterScheduleDAO {
	
		// =====  의존객체 주입(DI : Dependency Injection) =====
		@Autowired
		private SqlSessionTemplate sqlsession;

		@Override
		public int getTotalCount2(HashMap<String, String> map) {
			int count = sqlsession.selectOne("Son.getTotalCount2",map);
			return count;
		}

		@Override
		public int getTotalCount() {
			int count = sqlsession.selectOne("Son.getTotalCount");
			return count;
		}

		@Override
		public List<ScheduleVO> schedulevoList2(HashMap<String, String> map) {
			List<ScheduleVO> schedulevoList = sqlsession.selectList("Son.schedulevoList2", map);
			return schedulevoList;
		}

		@Override
		public List<ScheduleVO> schedulevoList(HashMap<String, String> map) {
			List<ScheduleVO> schedulevoList = sqlsession.selectList("Son.schedulevoList", map);
			return schedulevoList;
		}

		@Override
		public List<HashMap<String, String>> getindex() {
			
			List<HashMap<String, String>> traplist = sqlsession.selectList("Son.getindex");
			
			return traplist;
		}

		@Override
		public String getCategory(String seq_schedule) {
			String str = sqlsession.selectOne("Son.getCategory", seq_schedule);
			return str;
		}

		@Override
		public String getImage(String fk_category) {
			String str = sqlsession.selectOne("Son.getImage", fk_category);
			return str;
		}

		@Override
		public List<HashMap<String, String>> likerank() {			
			List<HashMap<String, String>> likeranklist = sqlsession.selectList("Son.getlikerank");
			
			return likeranklist;
		}
		
		
	

	
	
	


}
