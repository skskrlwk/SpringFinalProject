package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

public interface InterBoardDAO {

	int boardadd(BoardVO boardvo);  //파일 첨부가 없는 글쓰기

	int boardadd_withFile(BoardVO boardvo); // 파일 첨부가 있는 글쓰기

	int getGroupMaxno(); // tbl_board 테이블의 groupno 의 max값 알아오기

	int getTotalCount(); //검색어가 없는 글 전체 목록 조회

	int getTotalCount2(HashMap<String, String> map);//검색어가 있는 글 전체 목록 조회

	List<BoardVO> boardList(HashMap<String, String> map);//검색어가 없는 글목록 페이징 처리

	List<BoardVO> boardList2(HashMap<String, String> map);//검색어가 있는 글 목록 페이징 처리

	void setAddReadCount(String seq_board);//조횟수 1 증가 시키기

	BoardVO getView(String seq_board);// 글 한개 보여주기

	List<CommentVO> listComment(String seq_board);//코멘트 보여주기

	int addComment(BoardCommentVO bcommentvo);//댓글쓰기

	int updateCommentCount(String fk_seq_board);//댓글 수 읽어오기

	int updateComments(BoardVO boardvo);// 글 수정하기

	boolean isExistsComment(String seq_board);//댓글 유무

	int deleteContent(String seq_board);//원글 삭제

	int deleteComment(String seq_board);//댓글삭제

	String readseqcomment(BoardCommentVO bcommentvo);//seq_comment읽어오기

	int delcomment(String seq_comment);//댓글 한개 삭제하기

	int viewcommentcount(String seq_board);//글 한개에 댓글 수 읽어오기

	int updatecomment(HashMap<String, String> map);//댓글 업데이트

	List<String> titleList(String search);//제목리스트 가져오기

	int updateclicksearch(HashMap<String, String> map);//실시간 검색어 순위 카운트시키기

	List<String> nowsearch();//실시간 검색어 순위 리스트

	int ynseq_board(String seq_board);//없는 글번호 방지

	List<String> fk_seq(String seq_board);// 답글 번호 읽어옥기

	boolean isExistsComment2(HashMap<String, Object> map);//댓글 있나없나

	int deleteContent2(HashMap<String, Object> map);//글 삭제

	int deleteComment2(HashMap<String, Object> map);//댓글 삭제

	List<String> fk_seq2(HashMap<String, Object> map);//답글 번호 읽어옥기

	void updatecommentcnt(String seq_board);// 댓글 삭제 후 댓글 수 줄이기


	

}
