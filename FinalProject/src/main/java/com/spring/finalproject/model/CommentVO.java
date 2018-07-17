package com.spring.finalproject.model;

public class CommentVO {

	 private String seq_comment;
	 private String fk_seq_board;
	 private String fk_userid;
	 private String name;
	 private String comments;
	 private String regdate;   
	 private String status;
	
	 public CommentVO() {}
	 
	 public CommentVO(String seq_comment, String fk_seq_board, String fk_userid, String name, String comments,
			String regdate, String status) {

		this.seq_comment = seq_comment;
		this.fk_seq_board = fk_seq_board;
		this.fk_userid = fk_userid;
		this.name = name;
		this.comments = comments;
		this.regdate = regdate;
		this.status = status;
	}

	public String getSeq_comment() {
		return seq_comment;
	}

	public void setSeq_comment(String seq_comment) {
		this.seq_comment = seq_comment;
	}

	public String getFk_seq_board() {
		return fk_seq_board;
	}

	public void setFk_seq_board(String fk_seq_board) {
		this.fk_seq_board = fk_seq_board;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	} 
	
	 
	 
}
