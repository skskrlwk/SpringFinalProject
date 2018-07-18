package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.member.model.MemberVO;

public interface InterUserinfoDAO {

	MemberVO getLoginMemeber(HashMap<String, String> map);  // 로그인 여부 알아오기 

	int idCheck(String userid);		// id 중복 검사

	int registerMember(MemberVO membervo);		// 회원 가입 insert

	String getUserid(HashMap<String, String> map);	// 아이디 찾기

	int isUserExists(HashMap<String, String> map);	// 비밀번호 찾기

	int updatePwdUser(HashMap<String, String> map);	// 비밀번호 새로 등록

	int editMember(MemberVO membervo);				// 회원정보 수정

	int memberQuit(HashMap<String, String> map);	// 회원 탈퇴
}
