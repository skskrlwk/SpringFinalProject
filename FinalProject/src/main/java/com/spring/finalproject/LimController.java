package com.spring.finalproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.service.InterLimService;
import com.spring.finalproject.service.InterYJWService;
import com.spring.member.model.MemberVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LimController {
	
	// ===== 의존객체 주입하기(DI: Dependency Injection) =====
	@Autowired
	private InterLimService service;
	
	@Autowired
	private InterYJWService service2;
	
	private static final Logger logger = LoggerFactory.getLogger(LimController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/scheduleAdd.action", method = RequestMethod.GET)
	public String requireLogin_scheduleAdd(HttpServletRequest request, HttpServletResponse response) {
		
		List<HashMap<String, String>> mapList = service.getWorldMap();
		 
		request.setAttribute("mapList", mapList);
		
		return "schedule/scheduleAdd.tiles";
	}

	@RequestMapping(value = "/ScheduleDetail.action", method = RequestMethod.GET)
	public String editSchedule(HttpServletRequest req) {
		
		String seq = req.getParameter("seq");
		
		int likecnt = service.likecnt(seq);
		
		req.setAttribute("likecnt", likecnt);
		
		if(seq.trim().equals("")) {
			String msg = "잘못된 접근입니다.";
			String loc = "javascript:history.back();";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("seq", seq);				// xml의 #{seq} 로 사용
		
		// 시퀀스 번호로 tbl_schedule 정보를 가져옴(구글 지도 출력)
		HashMap<String,String> ScheduleMap = service.getSchedule(seq); 
		req.setAttribute("ScheduleMap", ScheduleMap);
		
		if(ScheduleMap == null) {
			String msg = "잘못된 접근입니다.";
			String loc = "javascript:history.back();";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}
		
		// 스케줄 달력
		List<HashMap<String, String>> calList = service.getCalendar(seq);
		req.setAttribute("calList", calList);
		
		// 일정 디테일 디테일의 정보를 가져옴
		List<HashMap<String, String>> schedule_detailList = service.getSchedule_detail2List(seq);
		
		// 음식
		List<HashMap<String, String>> show_foodList = null;
		// 명소
		List<HashMap<String, String>> show_tourList = null;
		// 쇼핑
		List<HashMap<String, String>> show_shopList = null;
		// 투어/액티비티
		List<HashMap<String, String>> show_TourActivityList = null;
		// 셀프북
		List<HashMap<String, String>> show_bookList = null;
		for(HashMap<String, String> detailmap : schedule_detailList) {
			
			HashMap<String, String> parmap = new HashMap<String, String>();
			String categoryname = detailmap.get("categoryname");
			
			parmap.put("category", detailmap.get("category"));
			parmap.put("category_seq", detailmap.get("category_seq"));
			
			HashMap<String, String> reulstmap = new HashMap<String, String>();
			
			switch (categoryname) {
				case "food":		// 음식 리스트 뽑아오기
					if(show_foodList == null) {
						show_foodList = new ArrayList<HashMap<String, String>>();
					}
					reulstmap = service2.getFood(parmap);
					show_foodList.add(reulstmap);
					break;
				
				case "shop":  		// 쇼핑
					if(show_shopList == null) {
						show_shopList = new ArrayList<HashMap<String, String>>();
					}
					reulstmap = service2.getShop(parmap);
					show_shopList.add(reulstmap);
					break;
					
				case "tourlist":		// 명소
					if(show_tourList == null) {
						show_tourList = new ArrayList<HashMap<String, String>>();
					}
					reulstmap = service2.getTourlist(parmap);
					show_tourList.add(reulstmap);
					
					break;
					
				case "tour":	// 투어/액티비티
					if(show_TourActivityList == null) {
						show_TourActivityList = new ArrayList<HashMap<String, String>>();
					}
					reulstmap = service2.getTourActivityList(parmap);
					show_TourActivityList.add(reulstmap);					
					
					break;
					
				case "book":	// 셀프북
					if(show_bookList == null) {
						show_bookList = new ArrayList<HashMap<String, String>>();
					}
					
					reulstmap = service2.getBookList(parmap);
					show_bookList.add(reulstmap);	
					
					break;
					
					
				default:
					break;
			}
			
		}
		
		req.setAttribute("show_foodList", show_foodList);
		req.setAttribute("show_shopList", show_shopList);
		req.setAttribute("show_tourList", show_tourList);
		req.setAttribute("show_TourActivityList", show_TourActivityList);
		req.setAttribute("show_bookList", show_bookList);
		
		
		// 일정표 1
		List<HashMap<String, String>> show_schedulerList1 = service2.show_schedulerList1(map);
		req.setAttribute("show_schedulerList1", show_schedulerList1);	
		
		String length = String.valueOf(show_schedulerList1.size());
		req.setAttribute("length", length);
		
		// 일정표 2
		HashMap<String, String> show_schedulerList2 = service2.show_schedulerList2(map);
		req.setAttribute("show_schedulerList2", show_schedulerList2);
	
		return "schedule/ScheduleDetail.tiles";
	}
	
	@RequestMapping(value = "/scheduleAddEnd.action", method = RequestMethod.POST)
	public String scheduleAddEnd(HttpServletRequest request) throws Throwable {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String userid = loginuser.getUserid();
		
		// 출발일
		String startDay = request.getParameter("startDay"); // 2018-11-22
		
		// 스케줄제목
		String title = request.getParameter("title");
		
		// 위도 경도 값;
		String[] coordinate = request.getParameterValues("coordinate");
		
		String imgArr = "";
		
		int count = 0;
		if(coordinate.length > 1) { // 여행하는 나라가 1개 이상일떄
			for(int i=0; i<coordinate.length; i++) {
				
				if(count == 0) {
					imgArr += "[";
					count ++;
				}
				
				if(i == (coordinate.length-1)) { // 마지막 반복문일때
					imgArr += coordinate[i] + "]";
				}else {
					imgArr += coordinate[i] + ", ";
				}
				
			}
			
		} else { // 여행하는 나라가 1개 일때
			imgArr += "[" + coordinate[0] + "]";
		}
				
		HashMap<String, String> scheduleMap = new HashMap<String, String>();
		scheduleMap.put("userid", userid);
		scheduleMap.put("title", title);
		scheduleMap.put("imgArr", imgArr);
		scheduleMap.put("startDay", startDay);
		
		// tbl_schedule에 insert 하는 작업
		int result1 = service.AddSchedule(scheduleMap);
				
		// insert 한 seq 값 가져오기 
		String seq = service.getSeqval(userid);
		
		// tbl_scheduler에 insert 하는 작업
		int result2 = service.AddScheduler(seq);
		
		// 나라 배열
		String[] worldArr = request.getParameterValues("worldArr");
		// 체류일 배열
		String[] daysArr = request.getParameterValues("days");
		// 음식 배열
		String[] foodArr = request.getParameterValues("foodArr");
		// 명소 배열
		String[] placeArr = request.getParameterValues("placeArr");
		// 쇼핑 배열
		String[] shopArr = request.getParameterValues("shopArr");
		// 투어상품 배열
		String[] tourArr = request.getParameterValues("tourArr");
		// 책 배열
		String[] bookArr = request.getParameterValues("bookArr");
		
		
		// 트랜잭션 처리(tbl_schedule_detail , tbl_schedule_detail2) 
		int result3 = service.AddDetails(seq, worldArr, daysArr, foodArr, placeArr, shopArr, tourArr, bookArr);
				
		request.setAttribute("seq", seq);
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		request.setAttribute("length", worldArr.length);
		
		
		
		return "resultmsg.notiles";
		/*return "schedule/ScheduleDetail.tiles";*/
	}
	
	@RequestMapping(value = "/scheduleDel.action", method = RequestMethod.POST)
	public String scheduleDel(HttpServletRequest request) {
		
		String seq = request.getParameter("seq");
		System.out.println("seq : " + seq);
		int n = 0;
		n = service.delSchedule(seq);
		
		String msg = "";
		String loc = "";
		
		if(n == 1) {
			msg = "삭제되었습니다.";
			loc = request.getContextPath()+"/index.action";
		}else {
			msg = "삭제가 실패하였습니다.";
			loc = request.getContextPath()+"/index.action";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "msg.notiles";
	}
	
	
	
	
}
