package com.spring.finalproject;


import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartFile;


import com.spring.finalproject.common.MyUtil;
import com.spring.finalproject.common.ThumbnailManagerLarge;
import com.spring.finalproject.model.CommentVO;
import com.spring.finalproject.model.PhotoVO;
import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.model.BoardCommentVO;
import com.spring.finalproject.model.BoardVO;
import com.spring.finalproject.service.InterJeoungService;
import com.spring.member.model.MemberVO;

@Controller
public class JeoungController {

	@Autowired
	private InterJeoungService service;
	
	@Autowired
	private FileManager filemanager;
	
	@RequestMapping(value="/boardlist.action",method= {RequestMethod.GET})
	public String boardlist(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.setAttribute("readCountPermission", "yes");
		
		List<BoardVO> boardList = null;
		
		String colname = req.getParameter("colname");
		String search = req.getParameter("search");
		String search2 = req.getParameter("search2");
		if(search2 == null) {
			search2 = "1";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("colname", colname);
		map.put("search", search);
		map.put("search2", search2);
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         
		int sizePerPage = 5;       
		int currentShowPageNo = 0;  
		int totalPage = 0;          
		
		int startRno = 0;          
		int endRno = 0;            
		
		int blockSize = 10;
		
		if( (colname != null && search != null) && 
				(!colname.equals("null") && !search.equals("null"))	&& 
				(!colname.trim().isEmpty() && !search.trim().isEmpty()) 
			  ) {
				   totalCount = service.getTotalCount2(map); // 검색어가 있는 총게시물 건수
		}
		else {
			   totalCount = service.getTotalCount(); // 검색어가 없는 총게시물 건수
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			currentShowPageNo = 1; 
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = (currentShowPageNo - 1) * sizePerPage + 1;
		endRno = startRno + sizePerPage - 1;
			
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		if( (colname != null && search != null) && 
			(!colname.equals("null") && !search.equals("null"))	&& 
			(!colname.trim().isEmpty() && !search.trim().isEmpty()) 
		  ) {
			  boardList = service.boardList2(map); // 검색어가 있는 페이징처리
		}
		else {
			  boardList = service.boardList(map); // 검색어가 없는 페이징처리
		}
		
		if(search2.equals("2")) {
			
			int n = service.updateclicksearch(map);
		}
		
		String pagebar = "<ul>"; 
		pagebar += MyUtil.getSearchPageBar("boardlist.action", currentShowPageNo, sizePerPage, totalPage, blockSize, colname, search, null);     
		pagebar += "</ul>";
		
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("boardList", boardList);
		
		req.setAttribute("colname", colname);
		req.setAttribute("search", search);
		
		String goBackURL = MyUtil.getCurrentURL(req);
		req.setAttribute("goBackURL", goBackURL);
		
		return "board/boardlist.tiles";
	}
	
	@RequestMapping(value="/boardadd.action",method= {RequestMethod.GET})
	public String requireLogin_boardadd(HttpServletRequest req, HttpServletResponse res) {
		
		String fk_seq = req.getParameter("fk_seq");
		String groupno = req.getParameter("groupno");
		String depthno = req.getParameter("depthno");
		
		
		req.setAttribute("fk_seq", fk_seq);
		req.setAttribute("groupno", groupno);
		req.setAttribute("depthno", depthno);
		
		return "board/boardadd.tiles";
	}
	
	@RequestMapping(value="/boardaddEnd.action",method= {RequestMethod.POST})
	public String boardaddEnd(BoardVO boardvo, MultipartHttpServletRequest req, HttpSession session) {
		
		String content = req.getParameter("content");
		boardvo.setComments(content);
		
		if(!boardvo.getAttach().isEmpty()) {
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			String newfilename = "";	// WAS(톰캣) 디스크에 저장할 파일명.
			
			byte[] bytes = null;		
			
			long filesize = 0;			
			
			try {	
				bytes = boardvo.getAttach().getBytes();
				
				newfilename = filemanager.doFileUpload(bytes, boardvo.getAttach().getOriginalFilename(), path);
				// 파일을 업로드 한 후 현재시간+나노타임.확장자로 되어진 파일명을
				// 리턴받아 newFileName 으로 저장한다.
				// boardvo.getAttach().getOriginalFilename() 은 첨부된 파일의 실제 파일명(문자열)을 얻어오는 것이다. 
				
				boardvo.setFilename(newfilename);
				// newFileName 이 WAS(톰캣)에 저장될 파일명(ex.201806283242343422424585453454547341.png)
				
				boardvo.setOrgfilename(boardvo.getAttach().getOriginalFilename());
				// 사용자가 파일을 다운로드할 때 사용되어지는 파일명
				
				filesize = boardvo.getAttach().getSize();	
				// boardvo.getAttach().getSize() 은 첨부한 파일의 크기
				
				boardvo.setFilesize(String.valueOf(filesize));	// String 타입으로 변경 후 vo에 넣어준다.
				
			} catch (Exception e) {
				
			}
		
		}
		
		String comments = boardvo.getComments().replaceAll("\r\n", "<br/>");
		boardvo.setComments(comments);
		
		int n = 0;
		
		if(boardvo.getAttach().isEmpty()) {	
			// 파일첨부가 없다면
			n = service.boardadd(boardvo);
		}
		
		if(!boardvo.getAttach().isEmpty()) {	
			// 파일첨부가 있다면
			n = service.boardadd_withFile(boardvo);
		}
				
		req.setAttribute("n", n);
		
		
		return "board/boardaddEnd.tiles";
	}
	
	@RequestMapping(value="/boardview.action",method= {RequestMethod.GET})
	public String boardview(HttpServletRequest req) {
		
		String seq_board = req.getParameter("seq_board");
		String goBackURL = req.getParameter("goBackURL");
		boolean a = Pattern.matches("^[0-9]*$", seq_board);

		
		
		int b = service.ynseq_board(seq_board);
		
		if(!a || b == 0) {
			return"board/boardnoturl.tiles";
		}
		
		BoardVO boardvo = null;
		
		HttpSession session = req.getSession();
		
		if("yes".equals(session.getAttribute("readCountPermission")) ) {
			
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			String userid = null;
			
			if(loginuser != null) {
				userid = loginuser.getUserid();
			}
			
			boardvo = service.getView(seq_board, userid);
			session.removeAttribute("readCountPermission");
		}
		else {	// 웹브라우저에서 새로고침(F5)을 누른 경우
			
			// 조회수 1증가 없이 그냥 글 1개를 가져오는 것
			boardvo = service.getViewWithNoReadCount(seq_board);
		}
		
		req.setAttribute("boardvo", boardvo);
		
		
		// ==== 댓글 내용 가져오기 ====
		List<CommentVO> commentList = service.listComment(seq_board);
		int count = service.viewcommentcount(seq_board);
		
		req.setAttribute("commentList", commentList);
		req.setAttribute("goBackURL", goBackURL);
		req.setAttribute("count", count);
		
		return "board/boardview.tiles";
	}
	@RequestMapping(value="/addComments.action", method= {RequestMethod.POST})
	public String addComments(BoardCommentVO bcommentvo,HttpServletRequest req,HttpServletResponse response)throws Throwable{
		
		int n = service.addComments(bcommentvo); 
		String seq_comment = service.readseqcomment(bcommentvo);
		JSONArray jsonarry = new JSONArray();
		String str_jsonarray = null;
		
		if(n != 0) {
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("name", bcommentvo.getName());
			jsonObj.put("comments", bcommentvo.getComments());
			jsonObj.put("seq_comment", seq_comment);
			jsonObj.put("regdate", MyUtil.getNowTime());
			jsonarry.put(jsonObj);
		}
		
		str_jsonarray = jsonarry.toString();
		
		req.setAttribute("str_jsonarray", str_jsonarray);
		
		return "addCommentEndJSON.notiles";
	}
	
	@RequestMapping(value="/download.action", method={RequestMethod.GET})
	public void requireLogin_download(HttpServletRequest req, HttpServletResponse res) {
		
		String seq_board = req.getParameter("seq_board");
		// 첨부파일이 있는 글번호를 받아옴
		
		BoardVO vo = service.getViewWithNoReadCount(seq_board);	// 메소드 호출
		
		String filename = vo.getFilename();
		String orgfilename = vo.getOrgfilename();
		
		// WAS(톰캣)의 webapp 의 절대경로를 알아와야 한다.
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "files";
		
		
		boolean bool = false;		
	
		bool = filemanager.doFileDownload(filename, orgfilename, path, res);
		// 다운로드가 성공이면 true 를 반납해주고, 실패하면 false를 반납해준다.
		
		if(!bool) {
			// 다운로드가 실패할 경우 메시지를 띄워준다.
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = null;
			
			try {
				writer = res.getWriter();
				// 웹브라우저 상에 메시지를 쓰기 위한 객체생성
			} catch (Exception e) {
				
			}
			
			writer.println("<script type='text/javascript'>alert('파일 다운로드가 실패했습니다.')</script>");
			
		}// end of if()-----		
	}
	
	@RequestMapping(value="/image/photoUpload.action", method={RequestMethod.POST})
	public String photoUpload(PhotoVO photovo, HttpServletRequest req) {
	    
		String callback = photovo.getCallback();
	    String callback_func = photovo.getCallback_func();
	    String file_result = "";
	    
		if(!photovo.getFiledata().isEmpty()) {
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"photo_upload";
			
			String newFilename = "";
			// WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
						
			try {
				bytes = photovo.getFiledata().getBytes(); 
				
				String original_name = photovo.getFiledata().getOriginalFilename();
				//  photovo.getFiledata().getOriginalFilename() 은 첨부된 파일의 실제 파일명(문자열)을 얻어오는 것이다. 
				newFilename = filemanager.doFileUpload(bytes, original_name, path);
				
				int width = filemanager.getImageWidth(path+File.separator+newFilename);
				
				if(width > 600)
					width = 600;
				
				String CP = req.getContextPath();  
				file_result += "&bNewLine=true&sFileName="+newFilename+"&sWidth="+width+"&sFileURL="+CP+"/resources/photo_upload/"+newFilename; 
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			file_result += "&errstr=error";
		}
		return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		}
	
	// ==== #스마트에디터2. 드래그앤드롭을 사용한 다중사진 파일업로드 ====
		@RequestMapping(value="/image/multiplePhotoUpload.action", method={RequestMethod.POST})
		public void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res) {

			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"photo_upload";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
		//	System.out.println(">>>> 확인용 path ==> " + path); 
			   
			
			File dir = new File(path);
			if(!dir.exists())
				dir.mkdirs();
			
			String strURL = "";
			
			try {
				if(!"OPTIONS".equals(req.getMethod().toUpperCase())) {
		    		String filename = req.getHeader("file-name"); //파일명을 받는다 - 일반 원본파일명
		    		
		    		InputStream is = req.getInputStream();
		    	
		    		String newFilename = filemanager.doFileUpload(is, filename, path);
		    		
					int width = filemanager.getImageWidth(path+File.separator+newFilename);
				
					if(width > 600) {
						width = 600;
						newFilename = ThumbnailManagerLarge.doCreateThumbnail(newFilename, path);
					}
					
		    	
					String CP = req.getContextPath(); 
				
					strURL += "&bNewLine=true&sFileName="; 
	            	strURL += newFilename;
	            	strURL += "&sWidth="+width;
	            	strURL += "&sFileURL="+CP+"/resources/photo_upload/"+newFilename;
		    	}
			
		    	/// 웹브라우저상에 사진 이미지를 쓰기 ///
				PrintWriter out = res.getWriter();
				out.print(strURL);
			} catch(Exception e){
				e.printStackTrace();
			}
			
		}// end of void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res)---------------- 
	
		@RequestMapping(value="/edit.action", method={RequestMethod.GET})
		public String requireLogin_edit(HttpServletRequest req, HttpServletResponse response) {
			
			String seq_board = req.getParameter("seq_board"); // 수정해야할 글번호 가져오기
			
			// 수정해야할 글 전체 내용 가져오기
			// 조회수 1증가 없이 그냥 글 1개를 가져오는 것
			BoardVO boardvo = service.getViewWithNoReadCount(seq_board);
			
			HttpSession session = req.getSession();
			
			
				// 가져온 1개글을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
				req.setAttribute("boardvo", boardvo);
				
				return "board/boardedit.tiles";
				// /Board/src/main/webapp/WEB-INF/views2/board/edit.jsp 파일을 생성한다. 
			}

		
		@RequestMapping(value="/editEnd.action", method={RequestMethod.POST}) 
		public String editEnd(BoardVO boardvo, HttpServletRequest req) {
			String comments = req.getParameter("content");
			
			boardvo.setComments(comments);
			
			/* 글 수정을 하려면 원본글의 암호와 수정시 입력해주는 암호가 일치할때만
			      글수정이 가능하도록 해야 한다. 
	     	*/
		    int n = service.edit(boardvo);
		    // n 이 1 이면 update 성공
		    // n 이 0 이면 update 실패(암호가 틀리므로)
		    
		    req.setAttribute("n", n);
		    req.setAttribute("seq_board", boardvo.getSeq_board());
		    
			return "board/boardeditEnd.tiles";
			// /Board/src/main/webapp/WEB-INF/views2/board/editEnd.jsp 파일을 생성한다. 
		}
		
		
		@RequestMapping(value="/del.action", method={RequestMethod.POST})
		public String requireLogin_del(HttpServletRequest req, HttpServletResponse response) {
			
			// 삭제해야할 글번호 가져오기
			String seq_board = req.getParameter("seq_board");
			
			int n = service.del(seq_board);

			req.setAttribute("n", n);
			return "board/boarddel.tiles";
				
		}
		@RequestMapping(value="/delcomment.action", method={RequestMethod.POST})
		public String requireLogin_delcomment(HttpServletRequest req, HttpServletResponse response) {
			
			// 삭제해야할 글번호 가져오기
			String seq_comment = req.getParameter("seq_comment");
			String seq_board = req.getParameter("seq_board");
			String goBackURL = req.getParameter("goBackURL");
		
			int n = service.delcomment(seq_comment);
			req.setAttribute("seq_board", seq_board);
			req.setAttribute("goBackURL", goBackURL);
			req.setAttribute("n", n);
			
			return "board/boarddelcomment.tiles";
				
		}	

		@RequestMapping(value="/editcomment.action",method={RequestMethod.POST})
		public String requireLogin_editcomment(CommentVO commentvo, HttpServletRequest req, HttpServletResponse response) {
			String seq_comment = req.getParameter("seq_comment");
			String comments = req.getParameter("comments");
			String seq_board = req.getParameter("seq_board");
			String goBackURL = req.getParameter("goBackURL");
			
			HashMap<String,String> map = new HashMap<String, String>();
			
			map.put("seq_comment", seq_comment);
			map.put("comments", comments);
			
			int n = service.updatecomment(map);
			req.setAttribute("seq_board", seq_board);
			req.setAttribute("goBackURL", goBackURL);
			req.setAttribute("n", n);
			
			return "board/editcomment.tiles";
		}
		
		@RequestMapping(value="/reload.action",method= {RequestMethod.GET})
		public String reload( HttpServletRequest req) {
			String seq_board = req.getParameter("seq_board");
			req.setAttribute("seq_board", seq_board);
			return "board/reload.tiles";
		}
		
		@RequestMapping(value="/titleList.action",method= {RequestMethod.GET})
		public String titleList(HttpServletRequest req) {
			String search = req.getParameter("search");
			List<String> titlelist= service.titleList(search);
			
			JSONArray jsonarry = new JSONArray();
			String str_jsonarray = null;
			
			for(String title: titlelist) {
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("title", title);
				jsonarry.put(jsonObj);
			}
			
			str_jsonarray = jsonarry.toString();
			
			
			req.setAttribute("str_jsonarray", str_jsonarray);
			return "titleList.notiles";
		}
		
		
		@RequestMapping(value="/nowsearch.action",method= {RequestMethod.GET})
		public String nowsearch(HttpServletRequest req) {
			
			List<String> nowsearchlist = service.nowsearch();
			
			JSONArray jsonarry = new JSONArray();
			String str_jsonarray = null;
			
			for(String title: nowsearchlist) {
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("title", title);
				jsonarry.put(jsonObj);
			}
			str_jsonarray = jsonarry.toString();
			
			req.setAttribute("str_jsonarray", str_jsonarray);
			return "nowsearch.notiles";
		}
		
}






