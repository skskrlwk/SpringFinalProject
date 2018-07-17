package com.spring.finalproject.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private String seq_board;
	private String fk_userid;
	private String name;
	private String title;
	private String comments;
	private String readcount;       
	private String regdate;
	private String status;        
	private String commentcount;
	private String groupno;
	private String fk_seq;        
	private String depthno;        
	private String filename;           
	private String orgfilename;           
	private String filesize;  
	private MultipartFile attach;
	
	public BoardVO() {}
	
	public BoardVO(String seq_board, String fk_userid, String name, String title, String comments, String readcount,
			String regdate, String status, String commentcount, String groupno, String fk_seq, String depthno,
			String filename, String orgfilename, String filesize) {
		
		this.seq_board = seq_board;
		this.fk_userid = fk_userid;
		this.name = name;
		this.title = title;
		this.comments = comments;
		this.readcount = readcount;
		this.regdate = regdate;
		this.status = status;
		this.commentcount = commentcount;
		this.groupno = groupno;
		this.fk_seq = fk_seq;
		this.depthno = depthno;
		this.filename = filename;
		this.orgfilename = orgfilename;
		this.filesize = filesize;

	}

	public String getSeq_board() {
		return seq_board;
	}

	public void setSeq_board(String seq_board) {
		this.seq_board = seq_board;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
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

	public String getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}

	public String getGroupno() {
		return groupno;
	}

	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}

	public String getFk_seq() {
		return fk_seq;
	}

	public void setFk_seq(String fk_seq) {
		this.fk_seq = fk_seq;
	}

	public String getDepthno() {
		return depthno;
	}

	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	
	
	
}
