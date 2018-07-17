package com.spring.finalproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements InterBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public int boardadd(BoardVO boardvo) {
		int n = sqlsession.insert("Jeoung.boardadd", boardvo);
		
		return n;
	}

	@Override
	public int boardadd_withFile(BoardVO boardvo) {
		int n = sqlsession.insert("Jeoung.boardadd_withFile", boardvo);
		return n;
	}

	@Override
	public int getGroupMaxno() {
		int max = sqlsession.selectOne("Jeoung.getGroupMaxno");
		return max;
	}

	@Override
	public int getTotalCount() {
		int count = sqlsession.selectOne("Jeoung.getTotalCount");
		return count;
	}

	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = sqlsession.selectOne("Jeoung.getTotalCount2",map);
		
		return count;
	}

	@Override
	public List<BoardVO> boardList(HashMap<String, String> map) {
		List<BoardVO> boardList = sqlsession.selectList("Jeoung.boardlist",map);
		return boardList;
	}

	@Override
	public List<BoardVO> boardList2(HashMap<String, String> map) {
		List<BoardVO> boardList2 = sqlsession.selectList("Jeoung.boardlist2",map);
		return boardList2;
	}

	@Override
	public void setAddReadCount(String seq_board) {
		sqlsession.update("Jeoung.setAddReadCount", seq_board);
		
	}

	@Override
	public BoardVO getView(String seq_board) {
		BoardVO boardvo = sqlsession.selectOne("Jeoung.getView",seq_board);
		return boardvo;
	}

	@Override
	public List<CommentVO> listComment(String seq_board) {
		List<CommentVO> listcomment = sqlsession.selectList("Jeoung.listComment",seq_board);
		return listcomment;
	}

	@Override
	public int addComment(BoardCommentVO bcommentvo) {
		int n = sqlsession.insert("Jeoung.addComment", bcommentvo);
		return n;
	}

	@Override
	public int updateCommentCount(String fk_seq_board) {
		int n = sqlsession.update("Jeoung.updateCommentCount", fk_seq_board);
		return n;
	}

	@Override
	public int updateComments(BoardVO boardvo) {
		int n = sqlsession.update("Jeoung.updateComments", boardvo);
		return n;
	}

	@Override
	public boolean isExistsComment(String seq_board) {
		int count = sqlsession.selectOne("Jeoung.isExistsComment", seq_board);
		if(count > 0)
			return true;
		else
			return false;
	}

	@Override
	public int deleteContent(String seq_board) {
		int n = sqlsession.update("Jeoung.deleteContent",seq_board);
		return n;
	}

	@Override
	public int deleteComment(String seq_board) {
		int n = sqlsession.update("Jeoung.deleteComment", seq_board);
		return n;
	}

	@Override
	public String readseqcomment(BoardCommentVO bcommentvo) {
		String readseqcomment = sqlsession.selectOne("Jeoung.readseqcomment",bcommentvo);
		return readseqcomment;
	}

	@Override
	public int delcomment(String seq_comment) {
		int n = sqlsession.update("Jeoung.delcomment",seq_comment);
		return n;
	}

	@Override
	public int viewcommentcount(String seq_board) {
		int count = sqlsession.selectOne("Jeoung.viewcommentcount",seq_board);
		return count;
	}

	@Override
	public int updatecomment(HashMap<String, String> map) {
		int n = sqlsession.update("Jeoung.updatecomment",map);
		return n;
	}

	@Override
	public List<String> titleList(String search) {
		List<String> titlelist = sqlsession.selectList("Jeoung.titleList", search);
		return titlelist;
	}

	@Override
	public int updateclicksearch(HashMap<String, String> map) {
		int n = sqlsession.update("Jeoung.updateclicksearch",map);
		return n;
	}

	@Override
	public List<String> nowsearch() {
		List<String> nowsearchlist = sqlsession.selectList("Jeoung.nowsearch");
		return nowsearchlist;
	}

	@Override
	public int ynseq_board(String seq_board) {
		int n = sqlsession.selectOne("Jeoung.ynseq_board",seq_board);
		return n;
	}

	@Override
	public List<String> fk_seq(String seq_board) {
		List<String> list  = sqlsession.selectList("Jeoung.fk_seq",seq_board);
		return list;
	}

	@Override
	public boolean isExistsComment2(HashMap<String, Object> map) {
		int count = sqlsession.selectOne("Jeoung.isExistsComment2", map);
		if(count > 0)
			return true;
		else
			return false;
	}

	@Override
	public int deleteContent2(HashMap<String, Object> map) {
		int n = sqlsession.update("Jeoung.deleteContent2",map);
		return n;
	}

	@Override
	public int deleteComment2(HashMap<String, Object> map) {
		int n = sqlsession.update("Jeoung.deleteComment2", map);
		return n;
	}

	@Override
	public List<String> fk_seq2(HashMap<String, Object> map) {
		List<String> list  = sqlsession.selectList("Jeoung.fk_seq2",map);
		return list;
	}

}
