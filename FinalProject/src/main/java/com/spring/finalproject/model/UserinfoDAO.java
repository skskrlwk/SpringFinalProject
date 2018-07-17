package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.model.MemberVO;

@Repository
public class UserinfoDAO implements InterUserinfoDAO {
	
	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	// ===== 로그인 여부 알아오기 =====
	@Override
	public MemberVO getLoginMemeber(HashMap<String, String> map) {
		MemberVO loginuser = sqlsession.selectOne("Yoon.getLoginMemeber", map);
		return loginuser;
	}

	// ===== id 중복 검사 =====
	@Override
	public int idCheck(String userid) {
		int idCheck = sqlsession.selectOne("Yoon.idCheck", userid);
		return idCheck;
	}

	// ==== 회원가입 ====
	@Override
	public int registerMember(MemberVO membervo) {
		int result = sqlsession.insert("Yoon.registerMember", membervo);
		return result;
	}

	// ==== 아이디 찾기 =====
	@Override
	public String getUserid(HashMap<String, String> map) {
		String userid = sqlsession.selectOne("Yoon.getUserid", map);
		return userid;
	}

	@Override
	public int isUserExists(HashMap<String, String> map) {
		int n = sqlsession.selectOne("Yoon.isUserExists", map);
		return n;
	}

	@Override
	public int updatePwdUser(HashMap<String, String> map) {
		int n = sqlsession.update("Yoon.updatePwdUser", map);
		return n;
	}

	@Override
	public int editMember(MemberVO membervo) {
		int result = sqlsession.update("Yoon.editMember", membervo);
		return result;
	}

	@Override
	public int memberQuit(HashMap<String, String> map) {
		int result = sqlsession.update("Yoon.memberQuit", map);
		return result;
	}
	
}
