package com.spring.finalproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.finalproject.model.BoardCommentVO;
import com.spring.finalproject.model.BoardVO;
import com.spring.finalproject.model.CommentVO;
import com.spring.finalproject.model.InterBoardDAO;

@Service
public class JeoungService implements InterJeoungService {
	
	@Autowired
	private InterBoardDAO dao;

	@Override
	public int boardadd(BoardVO boardvo) {
		if(boardvo.getFk_seq() == null || boardvo.getFk_seq().trim().isEmpty()) {	
			// 원글 쓰기인 경우
			int groupno = dao.getGroupMaxno()+1;			
			boardvo.setGroupno(String.valueOf(groupno));
		}		
		
		int n = dao.boardadd(boardvo);		
		
		return n;
	}

	@Override
	public int boardadd_withFile(BoardVO boardvo) {
		if(boardvo.getFk_seq() == null || boardvo.getFk_seq().trim().isEmpty()) {	// null 이던지 텅비었다면 (.equals 도 괜찮다)
			// 원글 쓰기인 경우
			int groupno = dao.getGroupMaxno()+1;			
			boardvo.setGroupno(String.valueOf(groupno));	
		}	
		int n = dao.boardadd_withFile(boardvo);
		return n;
	}

	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = dao.getTotalCount2(map);
		return count;
	}

	@Override
	public int getTotalCount() {
		int count = dao.getTotalCount();
		return count;
	}

	@Override
	public List<BoardVO> boardList(HashMap<String, String> map) {
		
		List<BoardVO> boardList = dao.boardList(map);
		return boardList;
	}

	@Override
	public List<BoardVO> boardList2(HashMap<String, String> map) {
		
		List<BoardVO> boardList = dao.boardList2(map);
		return boardList;
	}

	@Override
	public BoardVO getView(String seq_board, String userid) {
		BoardVO boardvo = dao.getView(seq_board);
		
		if(userid != null && !boardvo.getFk_userid().equals(userid)) {
			dao.setAddReadCount(seq_board);
			boardvo = dao.getView(seq_board);
		}
		return boardvo;
	}

	@Override
	public BoardVO getViewWithNoReadCount(String seq_board) {
		
		BoardVO boardvo = dao.getView(seq_board);
		return boardvo;
	}

	@Override
	public List<CommentVO> listComment(String seq_board) {
		List<CommentVO> list = dao.listComment(seq_board);
		return list;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class} )
	public int addComments(BoardCommentVO bcommentvo)throws Throwable {
		int result = 0;
		
		int n = 0;
		
		n = dao.addComment(bcommentvo); 
		// tblComment 테이블에 insert
		
		if(n == 1) { // tblComment 테이블에 insert가 성공했다라면
		
			result = dao.updateCommentCount(bcommentvo.getFk_seq_board());
			// tblBoard 테이블에 commentCount 컬럼의 값이 1증가(update)
		}
		
		return result;
	}

	@Override
	public int edit(BoardVO boardvo) {
		int n = dao.updateComments(boardvo);
		return n;
	}

	@Override
	public int del(String seq_board) {
		int result1=0, result2=0, n=0;
		List<String> list = null;
	
		list = null;
		
		do {
			
			if(list != null) {
				
				String[] listArr = list.toArray(new String[list.size()]);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("listArr", listArr);
				boolean bool = false;
				bool = dao.isExistsComment2(map);
				result1 = dao.deleteContent2(map); 
				
				if(bool) { 
					result2 = dao.deleteComment2(map);  
				}
				
				if( (bool==true && result1==1 && result2>0) ||
						(bool==false && result1==1 && result2==0) )	
						n = 1;
				
				list = dao.fk_seq2(map); // List<String>
				if(list == null || list.isEmpty()) {
					break;
				}
			}else {
				boolean bool = false;
				
				bool = dao.isExistsComment(seq_board);
				
				result1 = dao.deleteContent(seq_board); 
				
				if(bool) { 
					result2 = dao.deleteComment(seq_board);  
				}
				
				if( (bool==true && result1==1 && result2>0) ||
						(bool==false && result1==1 && result2==0) )	
						n = 1;
				
				list = dao.fk_seq(seq_board); // List<String>
				
				if(list == null || list.isEmpty()) {
					break;
				}
				
			}

			
		} while (list != null);

		return n;
	}

	@Override
	public String readseqcomment(BoardCommentVO bcommentvo) {
		String readseqcomment = dao.readseqcomment(bcommentvo);
		return readseqcomment;
	}

	@Override
	public int delcomment(String seq_comment) {
		int n = dao.delcomment(seq_comment);
		return n;
	}

	@Override
	public int viewcommentcount(String seq_board) {
		int count = dao.viewcommentcount(seq_board);
		return count;
	}

	@Override
	public int updatecomment(HashMap<String, String> map) {
		int n = dao.updatecomment(map);
		return n;
	}

	@Override
	public List<String> titleList(String search) {
		List<String> titlelist = dao.titleList(search);
		return titlelist;
	}

	@Override
	public int updateclicksearch(HashMap<String, String> map) {
		int n = dao.updateclicksearch(map);
		return n;
	}

	@Override
	public List<String> nowsearch() {
		List<String> nowsearchlist = dao.nowsearch();
		return nowsearchlist;
	}

	@Override
	public int ynseq_board(String seq_board) {
		int n =  dao.ynseq_board(seq_board);
		return n;
	}
}
