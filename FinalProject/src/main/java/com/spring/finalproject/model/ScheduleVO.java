package com.spring.finalproject.model;

public class ScheduleVO {
	
	private int seq_schedule; // 일련번호
	private String fk_userid; // 회원ID
	private String title; // 제목
	private String startday; // 여행시작일
	private String registerday; // 작성일
	private String image; // 나라 대표 이미지
	
	private String cnt; // 작성일수
	
	private int alldays;
	
	
	public ScheduleVO() {}
	public ScheduleVO(int seq_schedule, String fk_userid, String title, String startday, String registerday,
			String image, int alldays, String cnt) {
		super();
		this.seq_schedule = seq_schedule;
		this.fk_userid = fk_userid;
		this.title = title;
		this.startday = startday;
		this.registerday = registerday;
		this.image = image;
		this.alldays = alldays;
		this.cnt=cnt;
		
	}


	/*
	public ScheduleVO(int seq_schedule, String fk_userid, String title, String startday, String registerday,
	String image) {
		
		this.seq_schedule = seq_schedule;
		this.fk_userid = fk_userid;
		this.title = title;
		this.startday = startday;
		this.registerday = registerday;
		this.image = image;
		
		// 추가하기
		
		
	}*/

	public int getSeq_schedule() {
		return seq_schedule;
	}

	public void setSeq_schedule(int seq_schedule) {
		this.seq_schedule = seq_schedule;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public int getAlldays() {
		return alldays;
	}

	public void setAlldays(int alldays) {
		this.alldays = alldays;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	

	
	

}
