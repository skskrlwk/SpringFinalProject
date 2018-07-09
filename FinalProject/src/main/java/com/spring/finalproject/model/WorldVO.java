package com.spring.finalproject.model;

public class WorldVO {

	private String seq_scheduler;
	private String fk_schedule;
	private String schedule;
	private String transfer;
	
	public WorldVO() {};
	
	public WorldVO(String seq_scheduler, String fk_schedule, String schedule, String transfer) {
		super();
		this.seq_scheduler = seq_scheduler;
		this.fk_schedule = fk_schedule;
		this.schedule = schedule;
		this.transfer = transfer;
	}

	public String getSeq_scheduler() {
		return seq_scheduler;
	}

	public void setSeq_scheduler(String seq_scheduler) {
		this.seq_scheduler = seq_scheduler;
	}

	public String getFk_schedule() {
		return fk_schedule;
	}

	public void setFk_schedule(String fk_schedule) {
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
