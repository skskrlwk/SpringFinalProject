package com.spring.finalproject.model;

public class SchedulerVO {
	
	private int seq_scheduler;		// 일련번호
	private int fk_schedule;		// 일정일련번호
	private String schedule;		// 일정
	private String transfer;		// 교통
	
	public SchedulerVO() {}
	
	public SchedulerVO(int seq_scheduler, int fk_schedule, String schedule, String transfer) {
		this.seq_scheduler = seq_scheduler;
		this.fk_schedule = fk_schedule;
		this.schedule = schedule;
		this.transfer = transfer;
	}

	public int getSeq_scheduler() {
		return seq_scheduler;
	}

	public void setSeq_scheduler(int seq_scheduler) {
		this.seq_scheduler = seq_scheduler;
	}

	public int getFk_schedule() {
		return fk_schedule;
	}

	public void setFk_schedule(int fk_schedule) {
		this.fk_schedule = fk_schedule;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}
	
	
	
	
}
