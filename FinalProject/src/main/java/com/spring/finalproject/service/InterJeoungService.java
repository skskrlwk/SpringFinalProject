package com.spring.finalproject.service;

import java.util.HashMap;
import java.util.List;

import com.spring.finalproject.model.BoardCommentVO;
import com.spring.finalproject.model.BoardVO;
import com.spring.finalproject.model.CommentVO;

public interface InterJeoungService {

	int boardadd(BoardVO boardvo); //첨부 파일이 없는 글쓰기

	int boardadd_withFile(BoardVO boardvo); // 파일 첨부가 있는 글쓰기

	int getTotalCount2(HashMap<String, String> map); // 검색어가 있는 총게시물 건수

	int getTotalCount(); // 검색어가 없는 총게시물 건수

	List<BoardVO> boardList(HashMap<String, String> map);//검색어가 없는 페이징 처리

	List<BoardVO> boardList2(HashMap<String, String> map);//검색어가 있는 페이징 처리

	BoardVO getView(String seq_board, String userid);// 조횟수 증가후 한개 글 보여주기

	BoardVO getViewWithNoReadCount(String seq_board);//조횟수 증가 없이 한개 글 보여주기

	List<CommentVO> listComment(String seq_board);//댓글 내용 가져오기

	int addComments(BoardCommentVO bcommentvo) throws Throwable;// 댓글내용 입력하기

	int edit(BoardVO boardvo);// 글 수정

	int del(String seq_board);//글삭제

	String readseqcomment(BoardCommentVO bcommentvo);//seq_comment를 읽어오는 것

	int delcomment(String seq_comment);//댓글 1개삭제하기

	int viewcommentcount(String seq_board);//글 한개에 있는 댓글 수 

	int updatecomment(HashMap<String, String> map);//댓글 수정하기

	List<String> titleList(String search);//글제목 목록가져오기

	int updateclicksearch(HashMap<String, String> map);//실시간 검색어 순위 카운트시키기

	List<String> nowsearch();//실시간 검색어 순위

	int ynseq_board(String seq_board);//없는 글번호 방지

	void updatecommentcnt(String seq_board);//댓글 삭제 후 댓글 숫자 줄이기
	

}
