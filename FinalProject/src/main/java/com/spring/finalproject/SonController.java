package com.spring.finalproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.MyUtil;
import com.spring.finalproject.model.ScheduleDetailVO;
import com.spring.finalproject.model.ScheduleVO;
import com.spring.finalproject.service.InterSonService;

	
	//컨트롤러 선언
	@Controller
	@Component
	/*
	   XML에서 빈을 만드는 대신에 클래스명 앞에 @Component 어노테이션을 적어주면
	     해당 클래스(지금은 BoardController)는 bean으로 자동 등록된다.
	     그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명(지금은 BoardController)이 된다.
	     지금은 bean의 이름은 boardController 이 된다.
	 */
	public class SonController {
		
		private static final Logger logger = LoggerFactory.getLogger(SonController.class);
	
		// ===== #33. 의존객체 주입하기(DI : Dependency Injection) =====
		@Autowired
		private InterSonService service;
		
		// ===== #132. 파일업로드 및 다운로드를 해주는 FileManager클래스 의존객체 주입하기 =====
		@Autowired
		private FileManager fileManager;
		
		
		// == 메인 페이지 요청 === //
		@RequestMapping(value = "/index.action", method = RequestMethod.GET)
		public String index(HttpServletRequest req) {
		
			
			List<HashMap<String,String>> traplist = service.getindex();
			List<HashMap<String,String>> likeranklist = service.likerank();
			
			for(HashMap<String, String> trapmap : traplist) {
				 String seq_schedule = trapmap.get("SEQ_SCHEDULE");
				 String fk_category = service.getCategory(seq_schedule);
				 String cityImg = service.getImage(fk_category);
				 trapmap.put("cityImg", cityImg);
			}
			
			req.setAttribute("traplist", traplist);
			
			for(HashMap<String, String> likerankmap : likeranklist) {
				 String seq_schedule = likerankmap.get("SEQ_SCHEDULE");
				 String fk_category = service.getCategory(seq_schedule);
				 String cityImg = service.getImage(fk_category);
				 likerankmap.put("cityImg", cityImg);
			}
			req.setAttribute("likeranklist", likeranklist);
			
			return "index.tiles";
		}
		
		
		
		// #다른 사용자의 여행 정보 페이지 요청 //
		@RequestMapping(value="/otherview.action", method= RequestMethod.GET)
		public String other_detail(ScheduleVO schedulevo,HttpServletRequest req) {
			HttpSession session = req.getSession();
			session.setAttribute("readCountPermission", "yes");	
			
			List<ScheduleVO> schedulevoList  = null;
			
			// 다른 사용자의 여행 정보 총 게시물 건수를 구하기.
			
			String colname = req.getParameter("colname");
			String search = req.getParameter("search");
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("colname",colname); // 키값  value값 기재
			map.put("search",search);
			
			// 페이징 처리 //
			String str_currentShowPageNo = req.getParameter("currentShowPageNo");
			int totalCount  = 0; // 총 게시물 건수 초기값 선언
			
			int sizePerPage = 4; // 한 페이지당 보여줄 게시물 건수
			int currentShowPageNo = 0; //현재 보여주는 초기치 1 페이지
			int totalPage = 0;
			
			int startRno = 0;// 시작행 번호
			int endRno = 0;// 끝행 번호
			
			int blockSize = 10; // "페이지바"에 보여줄 페이지의 갯수
						
			
				
			totalCount = service.getTotalCount();
			
			
			
			totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
			
			if(str_currentShowPageNo == null) {
				// 게시판 초기화면에 보여지는 것은
				// req.getParameter("currentShowPageNo");이 값이 없으므로
				// str_currentShowPageNo은 null이 된다. 
				currentShowPageNo = 1;
			}else {
				try {
					currentShowPageNo =Integer.parseInt(str_currentShowPageNo);
					if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
						currentShowPageNo = 1;
					}
				}catch(NumberFormatException e) {
					currentShowPageNo = 1;
				}
			}
			
			startRno = (currentShowPageNo-1)*sizePerPage+1;
			endRno = startRno +sizePerPage - 1;
			
			System.out.println("startRno : " + startRno );
			System.out.println("endRno : " + endRno );
			// ===== #111. 페이징 처리를 위해 startRno, endRno를 map에 추가하여 
			//             파라미터로 넘겨서 select되도록 한다.
			map.put("startRno",String.valueOf(startRno));
			map.put("endRno",String.valueOf(endRno));
			
			schedulevoList = service.schedulevoList2(map);
			for(ScheduleVO vo :schedulevoList) {
				int seq = vo.getSeq_schedule();
				String seq_str = String.valueOf(seq);
				String fk_category = service.getCategory(seq_str);
				String cityImg = service.getImage(fk_category);
				vo.setImage(cityImg);
			}
			
			
			totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
			
			// System.out.println("==> 확인용 totalCount: " + totalPage);
			String pageBar ="<ul>";		
			pageBar += MyUtil.getPageBar1("otherview.action", currentShowPageNo, sizePerPage, totalPage, blockSize);		
			pageBar+="</ul>";
			
			req.setAttribute("colname", colname);
			//req.setAttribute("search", search);
			req.setAttribute("schedulevoList", schedulevoList);
			req.setAttribute("pageBar", pageBar);
			
					
			String goBackURL = MyUtil.getCurrentURL(req);
			req.setAttribute("goBackURL", goBackURL);
			
			return "otherview.tiles";
		}
		
		
		
		
	
		
		
		
}