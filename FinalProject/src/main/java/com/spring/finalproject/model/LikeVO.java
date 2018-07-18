package com.spring.finalproject.model;

public class LikeVO {

	private String fk_seq_schedule;
	private String fk_userid;
	private String likecnt;
	
	public LikeVO() {}

	public LikeVO(String fk_seq_schedule, String fk_userid, String likecnt) {
		this.fk_seq_schedule = fk_seq_schedule;
		this.fk_userid = fk_userid;
		this.likecnt = likecnt;
	}

	public String getFk_seq_schedule() {
		return fk_seq_schedule;
	}

	public void setFk_seq_schedule(String fk_seq_schedule) {
		this.fk_seq_schedule = fk_seq_schedule;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(String likecnt) {
		this.likecnt = likecnt;
	};
	
}
