package com.spring.member.model;

/*
   VO(Value Object) 
   또는 
   DTO(Data Transfer Object)
   생성하기 
 */

public class MemberVO {
	
	private String userid;    		 // 회원아이디
	private String password;      	 // 비밀번호
	private String name;     		 // 회원명
	private String email;    		 // 이메일
	private String tel;       		 // 핸드폰
	private int gender;    		 // 성별 (남자:1, 여자:2)
	private String birthday;  		 // 생일
	private String registerday; 	 // 가입일자
	private int quitYN;      		 // 회원사용가능 유무, 1:사용가능 / 0:사용불능
	
	
	
	public MemberVO() {}
	
	
	public MemberVO(String userid, String password, String name, String email, String tel, int gender, String birthday,
			String registerday, int quitYN) {
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.gender = gender;
		this.birthday = birthday;
		this.registerday = registerday;
		this.quitYN = quitYN;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	public int getQuitYN() {
		return quitYN;
	}
	public void setQuitYN(int quitYN) {
		this.quitYN = quitYN;
	}

	
	
}




