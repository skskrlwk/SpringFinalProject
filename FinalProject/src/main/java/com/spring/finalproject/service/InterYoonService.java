package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import com.spring.member.model.MemberVO;

// === Service단 인터페이스 선언 ===
public interface InterYoonService {

	MemberVO getLoginMemeber(HashMap<String, String> map);  // 로그인 여부 알아오기   

	int idCheck(String userid);		// 아이디 중복검사

	int registerMember(MemberVO membervo);		// 회원 가입 insert

	String getUserid(HashMap<String, String> map);	// 아이디 찾기

	int isUserExists(HashMap<String, String> map);	// 비밀번호 찾기

	int updatePwdUser(HashMap<String, String> map);	// 비밀번호 새로 등록

	int editMember(MemberVO membervo);				// 회원 정보 수정

	int memberQuit(HashMap<String, String> map);	// 회원 탈퇴

	int likecnt(HashMap<String, String> map);		// 좋아요 갯수 가져오기

	int checklike(HashMap<String, String> map);		// 이미 좋아요 눌렀나 체크

	int addlike(HashMap<String, String> map);		// 좋아요 증가 시키기

	List<HashMap<String, String>> getAllMembers(HashMap<String, String> map);	// 모든 회원 정보 가져오기

	int deleteMember(String userid);				// 관리자의 회원 삭제

	int recoverMember(String userid);				// 관리자의 회원 복구

	int getMemberCnt();								// 회원 목록 페이징처리 위한 회원 수 가져오기

}
