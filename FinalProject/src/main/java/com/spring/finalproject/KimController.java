package com.spring.finalproject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.common.MyUtil;
import com.spring.finalproject.service.InterKimService;
import com.spring.member.model.MemberVO;

@Controller
public class KimController {
		
	// ==== #33. 의존객체 주입하기(DI : Dependency Injection) ====
	@Autowired
	private InterKimService service;
		
	// 일정 카테고리 목록 띄우기
	@RequestMapping(value="/category/selectCategory.action", method={RequestMethod.GET})  
	public String selectCategory(HttpServletRequest req) {
		
		List<HashMap<String, String>> schedulelist = service.getScheduleList();
		req.setAttribute("schedulelist", schedulelist);
		
		return "category/selectCategory.tiles";

	}
	
	// 음식 목록 띄우기
	@RequestMapping(value="/getFoodlist.action", method={RequestMethod.GET})  
	public String getFoodlist(HttpServletRequest req) {
		
		String country = req.getParameter("country"); 
		
		if(country.length() < 4) {
			country = country.substring(0, 2) + "1";
		}
		else {
			country = country.substring(0, 3) + "1";
		}
		
		List<HashMap<String, String>> foodlist = service.getFoodlist(country);
		
		JSONArray jsonArr = new JSONArray();  
		
		if(foodlist != null) {
			for(HashMap<String, String> map : foodlist) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_food", map.get("seq_food"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));
				
				jsonArr.put(jsonObj);
			}
		}
			
		String str_jsonArr = jsonArr.toString();
		
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "getFoodlistJSON.notiles";

	}
	
	// 명소 목록 띄우기
	@RequestMapping(value="/getPlacelist.action", method={RequestMethod.GET})  
	public String getPlacelist(HttpServletRequest req) {
		
		String country = req.getParameter("country");
		
		if(country.length() < 4) {
			country = country.substring(0, 2) + "1";
		}
		else {
			country = country.substring(0, 3) + "1";
		}
		
		List<HashMap<String, String>> placelist = service.getPlacelist(country);
		
		JSONArray jsonArr = new JSONArray();  
		
		if(placelist != null) {
			for(HashMap<String, String> map : placelist) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_tourlist", map.get("seq_tourlist"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));
				
				jsonArr.put(jsonObj);
			}
		}
			
		String str_jsonArr = jsonArr.toString();
		
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "getPlacelistJSON.notiles";

	}
	
	// 쇼핑 목록 띄우기
	@RequestMapping(value="/getShoppinglist.action", method={RequestMethod.GET})  
	public String getShoppinglist(HttpServletRequest req) {
		
		String country = req.getParameter("country");
		
		if(country.length() < 4) {
			country = country.substring(0, 2) + "1";
		}
		else {
			country = country.substring(0, 3) + "1";
		}
		
		List<HashMap<String, String>> shoppinglist = service.getShoppinglist(country);
		
		JSONArray jsonArr = new JSONArray();  
		
		if(shoppinglist != null) {
			for(HashMap<String, String> map : shoppinglist) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_shop", map.get("seq_shop"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));
				jsonObj.put("addr", map.get("addr"));
				jsonObj.put("worktime", map.get("worktime"));
				
				jsonArr.put(jsonObj);
			}
		}
			
		String str_jsonArr = jsonArr.toString();
		
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "getShoppinglistJSON.notiles";

	}
	
	// 투어 목록 띄우기
	@RequestMapping(value="/getTourlist.action", method={RequestMethod.GET})  
	public String getTourlist(HttpServletRequest req) {
		
		String country = req.getParameter("country");
		
		if(country.length() < 4) {
			country = country.substring(0, 2) + "1";
		}
		else {
			country = country.substring(0, 3) + "1";
		}
		
		List<HashMap<String, String>> tourlist = service.getTourlist(country);
		
		JSONArray jsonArr = new JSONArray();  
		
		if(tourlist != null) {
			for(HashMap<String, String> map : tourlist) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_tour", map.get("seq_tour"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("price", map.get("price"));
				jsonObj.put("addr", map.get("addr"));
				
				jsonArr.put(jsonObj);
			}
		}
			
		String str_jsonArr = jsonArr.toString();
		
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "getTourlistJSON.notiles";

	}
	
	// 도서 목록 띄우기
	@RequestMapping(value="/getBooklist.action", method={RequestMethod.GET})  
	public String getBooklist(HttpServletRequest req) {
		
		String country = req.getParameter("country");
		
		if(country.length() < 4) {
			country = country.substring(0, 2) + "1";
		}
		else {
			country = country.substring(0, 3) + "1";
		}
		
		List<HashMap<String, String>> booklist = service.getBooklist(country);
		
		JSONArray jsonArr = new JSONArray();  
		
		if(booklist != null) {
			for(HashMap<String, String> map : booklist) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_book", map.get("seq_book"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("price", map.get("price"));
				jsonObj.put("addr", map.get("addr"));
				
				jsonArr.put(jsonObj);
			}
		}
			
		String str_jsonArr = jsonArr.toString();
		
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "getBooklistJSON.notiles";

	}
	
	// 내 일정 목록 띄우기
	@RequestMapping(value="/mypage/mySchedules.action", method={RequestMethod.GET})  
	public String mySchedules(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("loginuser");
		
		if(mvo != null) {
			String userid = mvo.getUserid();
			
			List<HashMap<String, String>> temp_myschedules = service.getMySchedules(userid);
			List<HashMap<String, String>> myschedules = new ArrayList<HashMap<String, String>>();
			
			for(HashMap<String, String> map : temp_myschedules) {
				String imgsrc = service.getImgsrc(map.get("seq_schedule"));
				map.put("imgsrc", imgsrc);
				myschedules.add(map);
			}
			
			req.setAttribute("myschedules", myschedules);
		}
		
		else {
			String msg = "먼저 로그인 하세요.";
			String loc = "/finalproject/login.action";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			// >>>> 로그인 성공 후 로그인 하기전 페이지로 돌아가는 작업하기 <<<<
			// ===> 현재 페이지의 주소(URL) 알아내기 <====
			String url = MyUtil.getCurrentURL(req);
			
			// System.out.println(">>>> 확인용 현재 페이지 URL : " + url);
			
			session.setAttribute("gobackURL", url); // 세션에 url 정보를 저장시켜둔다.
							
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
			
			try {
				dispatcher.forward(req, res);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "mypage/mySchedules.tiles";

	}

}