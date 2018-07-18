package com.spring.finalproject;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.service.InterYJWService;

@Controller
public class YJWController {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterYJWService service;

	@RequestMapping(value = "/detail_food.action", method = RequestMethod.GET)
	public String detail_food(HttpServletRequest req) {

		String seq_food = req.getParameter("seq_food");

		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.detail_food(seq_food);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("a_seq_food", map.get("a_seq_food"));
				jsonObj.put("a_fk_category", map.get("a_fk_category"));
				jsonObj.put("a_name", map.get("a_name"));
				jsonObj.put("a_image", map.get("a_image"));
				jsonObj.put("a_comments", map.get("a_comments"));

				jsonObj.put("b_name", map.get("b_name"));
				jsonObj.put("b_image", map.get("b_image"));
				jsonObj.put("b_image", map.get("b_image"));
				jsonObj.put("b_addr", map.get("b_addr"));
				jsonObj.put("b_worktime", map.get("b_worktime"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		req.setAttribute("str_jsonArr", str_jsonArr);

		return "detail_foodJSON.notiles";
	}

	@RequestMapping(value = "/detail_shop.action", method = RequestMethod.GET)
	public String detail_shop(HttpServletRequest req) {

		String seq_shop = req.getParameter("seq_shop");

		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.detail_shop(seq_shop);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();

				jsonObj.put("seq_shop", map.get("seq_shop"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));
				jsonObj.put("addr", map.get("addr"));
				jsonObj.put("worktime", map.get("worktime"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		req.setAttribute("str_jsonArr", str_jsonArr);

		return "detail_shopJSON.notiles";
	}
	
	@RequestMapping(value = "/detail_shop2.action", method = RequestMethod.GET)
	public String detail_shop2(HttpServletRequest req) {

		String fk_category = req.getParameter("fk_category");

		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.detail_shop2(fk_category);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();

				jsonObj.put("seq_shop", map.get("seq_shop"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));
				jsonObj.put("addr", map.get("addr"));
				jsonObj.put("worktime", map.get("worktime"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		req.setAttribute("str_jsonArr", str_jsonArr);

		return "detail_shopJSON2.notiles";
	}
	
	// 명소 상세정보
	@RequestMapping(value = "/detail_tourlist.action", method = RequestMethod.GET)
	public String detail_tourlist(HttpServletRequest req) {

		String seq_tourlist = req.getParameter("seq_tourlist");
		// fk_category = fk_category.substring(0, 2) + "1";

		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		// List<HashMap<String, String>> list = service.detail_tourlist(fk_category);
		List<HashMap<String, String>> list = service.detail_tourlist(seq_tourlist);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("a_name", map.get("a_name")); // map.get("xml에있는 resultMap의 키값")
				jsonObj.put("a_image", map.get("a_image"));
				jsonObj.put("a_comments", map.get("a_comments"));

				jsonObj.put("b_name", map.get("b_name"));
				jsonObj.put("b_image", map.get("b_image"));
				jsonObj.put("b_price", map.get("b_price"));
				jsonObj.put("b_addr", map.get("b_addr"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		// System.out.println("str_jsonArr=>"+str_jsonArr);

		req.setAttribute("str_jsonArr", str_jsonArr);

		return "detail_tourlistJSON.notiles";
	}
	
	// 스케줄러 수정
	@RequestMapping(value = "/update_scheduler.action", method = RequestMethod.POST)
	public String update_scheduler(HttpServletRequest req) {

		String loginuser = "leess"; // req.getParameter("userid");

		String seq_scheduler = req.getParameter("seq_scheduler");
		String transfer = req.getParameter("transferEdit");
		String schedule = req.getParameter("scheduleEdit");

		transfer = transfer.replaceAll("\n", "<br>");
		schedule = schedule.replaceAll("\n", "<br>");

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("seq_scheduler", seq_scheduler);
		map.put("transfer", transfer);
		map.put("schedule", schedule);

		int result = 0;

		result = service.update_scheduler(map);

		JSONObject jsonObj = new JSONObject();

		if (result != 0) {
			jsonObj.put("transfer", transfer);
			jsonObj.put("schedule", schedule);

		}

		req.setAttribute("str_jsonObj", jsonObj);

		return "update_schedulerJSON.notiles";
	}
	
	// fk_category로 명소리스트 가져오기
	@RequestMapping(value = "/editTourlist.action", method = RequestMethod.GET)
	public String editTourlist(HttpServletRequest req) {

		String str_fk_categoryArr = req.getParameter("fk_category");
		String[] fk_categoryArr = str_fk_categoryArr.split(",");
		
		for(int i=0; i<fk_categoryArr.length; i++) {
			if(fk_categoryArr[i].length() < 4) {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 2) + "1";
			}
			else {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 3) + "1";
			}
		}
		
	//	for(int i=0; i<fk_categoryArr.length; i++) {
	//		System.out.println("fk_category : " + fk_categoryArr[i]);
	//	}
		
		HashMap<String, Object> pramap = new HashMap<String, Object>(); 
		pramap.put("fk_categoryArr", fk_categoryArr);
		
		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.editTourlist(pramap);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_tourlist", map.get("seq_tourlist"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		// System.out.println("str_jsonArr=>"+str_jsonArr);

		req.setAttribute("str_jsonArr", str_jsonArr);

		return "editTourlistJSON.notiles";
	}
	
	// fk_category로 음식리스트 가져오기
	@RequestMapping(value = "/editFood.action", method = RequestMethod.GET)
	public String editFood(HttpServletRequest req) {

		String str_fk_categoryArr = req.getParameter("fk_category");
		String[] fk_categoryArr = str_fk_categoryArr.split(",");
		
		for(int i=0; i<fk_categoryArr.length; i++) {
			if(fk_categoryArr[i].length() < 4) {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 2) + "1";
			}
			else {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 3) + "1";
			}
		}
		
	
		HashMap<String, Object> pramap = new HashMap<String, Object>(); 
		pramap.put("fk_categoryArr", fk_categoryArr);
		
		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.editFood(pramap);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_food", map.get("seq_food"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		
		req.setAttribute("str_jsonArr", str_jsonArr);

		return "editFoodJSON.notiles";
	}
	
	// fk_category로 쇼핑리스트 가져오기
	@RequestMapping(value = "/editShop.action", method = RequestMethod.GET)
	public String editShop(HttpServletRequest req) {

		String str_fk_categoryArr = req.getParameter("fk_category");
		String[] fk_categoryArr = str_fk_categoryArr.split(",");
		
		for(int i=0; i<fk_categoryArr.length; i++) {
			if(fk_categoryArr[i].length() < 4) {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 2) + "1";
			}
			else {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 3) + "1";
			}
		}
		
	
		HashMap<String, Object> pramap = new HashMap<String, Object>(); 
		pramap.put("fk_categoryArr", fk_categoryArr);
		
		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.editShop(pramap);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_shop", map.get("seq_shop"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("comments", map.get("comments"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		
		req.setAttribute("str_jsonArr", str_jsonArr);

		return "editShopJSON.notiles";
	}
	
	// fk_category로 투어/액티비티 리스트 가져오기
	@RequestMapping(value = "/editTour.action", method = RequestMethod.GET)
	public String editTour(HttpServletRequest req) {

		String str_fk_categoryArr = req.getParameter("fk_category");
		String[] fk_categoryArr = str_fk_categoryArr.split(",");
		
		for(int i=0; i<fk_categoryArr.length; i++) {
			if(fk_categoryArr[i].length() < 4) {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 2) + "1";
			}
			else {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 3) + "1";
			}
		}
		
	
		HashMap<String, Object> pramap = new HashMap<String, Object>(); 
		pramap.put("fk_categoryArr", fk_categoryArr);
		
		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.editTour(pramap);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_tour", map.get("seq_tour"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("price", map.get("price"));
				jsonObj.put("addr", map.get("addr"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		
		req.setAttribute("str_jsonArr", str_jsonArr);

		return "editTourJSON.notiles";
	}
	
	// fk_category로 셀프북 리스트 가져오기
	@RequestMapping(value = "/editBook.action", method = RequestMethod.GET)
	public String editBook(HttpServletRequest req) {

		String str_fk_categoryArr = req.getParameter("fk_category");
		String[] fk_categoryArr = str_fk_categoryArr.split(",");
		
		for(int i=0; i<fk_categoryArr.length; i++) {
			if(fk_categoryArr[i].length() < 4) {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 2) + "1";
			}
			else {
				fk_categoryArr[i] = fk_categoryArr[i].substring(0, 3) + "1";
			}
		}
		
	
		HashMap<String, Object> pramap = new HashMap<String, Object>(); 
		pramap.put("fk_categoryArr", fk_categoryArr);
		
		JSONArray jsonArr = new JSONArray();

		String str_jsonArr = "";

		List<HashMap<String, String>> list = service.editBook(pramap);

		if (list != null && list.size() > 0) {
			for (HashMap<String, String> map : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("seq_book", map.get("seq_book"));
				jsonObj.put("fk_category", map.get("fk_category"));
				jsonObj.put("name", map.get("name"));
				jsonObj.put("image", map.get("image"));
				jsonObj.put("price", map.get("price"));
				jsonObj.put("addr", map.get("addr"));

				jsonArr.put(jsonObj);
			} // end of for()------------

		} // end of if()---------

		str_jsonArr = jsonArr.toString();

		
		req.setAttribute("str_jsonArr", str_jsonArr);

		return "editBookJSON.notiles";
	}
	
	
	@RequestMapping(value = "/editDetail2.action", method = RequestMethod.POST)
	public String editDetail2(HttpServletRequest req) {
		
		String seq = req.getParameter("seq"); // 게시판 seq
		String category = req.getParameter("category"); // tbl_schedule_detail2 에 들어가는 category
	//	System.out.println("category : " + category);
		
		String imgseq = req.getParameter("imgseq"); // 선택한  이미지의 seq 
		String[] imgseqArr = imgseq.split(",");
		
		
		String fk_category = req.getParameter("fk_category"); // 선택한 이미지의 나라 카테고리  
		String[] fk_categoryArr = fk_category.split(",");
	
		List<String> detail_seq  = service.getDetailCategory(seq, fk_categoryArr); // tbl_schedule_detail 의 seq값 받아오기
//		for(int i = 0; i<detail_seq.size(); i++) {
//			System.out.println(i+"번 : " + detail_seq.get(i));
//		}
		int n = service.insertDetail2(imgseqArr, detail_seq,category); // tbl_schedule_detail2 의 insert작업
		String msg = "";
		if(n == detail_seq.size()) {
			msg = "수정 완료!";
		}else {
			msg = "수정 실패!";
		}
		
		req.setAttribute("seq", seq);
		req.setAttribute("msg", msg);
		
		return "Ymsg.notiles";
	}
}
