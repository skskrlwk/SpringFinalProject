package com.spring.finalproject.model;

public class BookVO {
	private int seq_book;			// 일련번호     
	private int fk_category;		// 나라테이블의 카테고리 컬럼 참조    
	private String name;			// 가이드북 명      
	private String image;			// 가이드북 이미지      
	private String price;			// 가이드북 가격      	
	private String addr;			// 가이드북 구입페이지주소
	
	public BookVO() {}
	
	public BookVO(int seq_book, int fk_category, String name, String image, String price, String addr) {
		this.seq_book = seq_book;
		this.fk_category = fk_category;
		this.name = name;
		this.image = image;
		this.price = price;
		this.addr = addr;
	}

	public int getSeq_book() {
		return seq_book;
	}

	public void setSeq_book(int seq_book) {
		this.seq_book = seq_book;
	}

	public int getFk_category() {
		return fk_category;
	}

	public void setFk_category(int fk_category) {
		this.fk_category = fk_category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}
