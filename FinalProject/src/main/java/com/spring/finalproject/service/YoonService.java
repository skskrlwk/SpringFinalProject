package com.spring.finalproject.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.model.InterLikeDAO;
import com.spring.finalproject.model.InterUserinfoDAO;
import com.spring.member.model.MemberVO;

// ===== Service 선언 ======
@Service
public class YoonService implements InterYoonService {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterUserinfoDAO dao;
	
	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterLikeDAO dao2;

	
	// ===== 로그인 여부 알아오기  =====
	@Override
	public MemberVO getLoginMemeber(HashMap<String, String> map) {
		MemberVO loginuser = dao.getLoginMemeber(map);
		return loginuser;
	}


	@Override
	public int idCheck(String userid) {
		int checkId = dao.idCheck(userid);
		return checkId;
	}


	@Override
	public int registerMember(MemberVO membervo) {
		int result = dao.registerMember(membervo);
		return result;
	}


	@Override
	public String getUserid(HashMap<String, String> map) {
		String userid = dao.getUserid(map); 
		return userid;
	}


	@Override
	public int isUserExists(HashMap<String, String> map) {
		int n = dao.isUserExists(map);
		return n;
	}


	@Override
	public int updatePwdUser(HashMap<String, String> map) {
		int n = dao.updatePwdUser(map);
		return n;
	}


	@Override
	public int editMember(MemberVO membervo) {
		int n = dao.editMember(membervo);
		return n;
	}


	@Override
	public int memberQuit(HashMap<String, String> map) {
		int n = dao.memberQuit(map);
		return n;
	}


	@Override
	public int likecnt(HashMap<String, String> map) {
		int n = dao2.likecnt(map);
		return n;
	}


	@Override
	public int checklike(HashMap<String, String> map) {
		int n = dao2.checklike(map);
		return n;
	}


	@Override
	public int addlike(HashMap<String, String> map) {
		int n = dao2.addlike(map);
		return n;
	}

	
	
	
}
