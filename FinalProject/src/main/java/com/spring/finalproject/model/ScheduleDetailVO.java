package com.spring.finalproject.model;

public class ScheduleDetailVO {
	
	int seq_schedule_detail;	//  시퀀스 일련번호
	int seq_schedule;	// tbl_schedule 참조
	int fk_category;	// tbl_world 카테고리 참조
	int days;			// 체류일
	
	public ScheduleDetailVO() {}
	
	public ScheduleDetailVO(int seq_schedule_detail, int seq_schedule, int fk_category, int days) {
		
		this.seq_schedule_detail = seq_schedule_detail;
		this.seq_schedule = seq_schedule;
		this.fk_category = fk_category;
		this.days = days;
	}

	public int getSeq_schedule_detail() {
		return seq_schedule_detail;
	}

	public void setSeq_schedule_detail(int seq_schedule_detail) {
		this.seq_schedule_detail = seq_schedule_detail;
	}

	public int getSeq_schedule() {
		return seq_schedule;
	}

	public void setSeq_schedule(int seq_schedule) {
		this.seq_schedule = seq_schedule;
	}

	public int getFk_category() {
		return fk_category;
	}

	public void setFk_category(int fk_category) {
		this.fk_category = fk_category;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}
	
	
	

}
