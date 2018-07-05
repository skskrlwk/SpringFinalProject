package com.spring.member.model;

/*
   VO(Value Object) 
   �Ǵ� 
   DTO(Data Transfer Object)
   �����ϱ� 
 */

public class MemberVO {
	
	private String userid;    		 // ȸ�����̵�
	private String password;      	 // ��й�ȣ
	private String name;     		 // ȸ����
	private String email;    		 // �̸���
	private String tel;       		 // �ڵ���
	private int gender;    		 // ���� (����:1, ����:2)
	private String birthday;  		 // ����
	private String registerday; 	 // ��������
	private int quitYN;      		 // ȸ����밡�� ����, 1:��밡�� / 0:���Ҵ�
	
	
	
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




