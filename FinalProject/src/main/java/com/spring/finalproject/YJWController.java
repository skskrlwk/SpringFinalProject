package com.spring.finalproject;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.border.EmptyBorder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.model.BookVO;
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
		
		if(list != null && list.size() > 0) {
			for(HashMap<String,String> map :list) {
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
			}// end of for()------------
			
		}// end of if()---------
			
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
		
		if(list != null && list.size() > 0) {
			for(HashMap<String,String> map :list) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("seq_shop", map.get("seq_shop")); 	
				jsonObj.put("fk_category", map.get("fk_category"));				
				jsonObj.put("name", map.get("name"));	
				jsonObj.put("image", map.get("image"));	
				jsonObj.put("comments", map.get("comments"));	
				jsonObj.put("addr", map.get("addr"));	
				jsonObj.put("worktime", map.get("worktime"));	
									
				jsonArr.put(jsonObj);
			}// end of for()------------
			
		}// end of if()---------
			
		str_jsonArr = jsonArr.toString();
			
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "detail_shopJSON.notiles";
	}
	
	@RequestMapping(value = "/detail_tourlist.action", method = RequestMethod.GET)
	public String detail_tourlist(HttpServletRequest req) {
		
		String fk_category = req.getParameter("fk_category");
		fk_category = fk_category.substring(0, 2) + "1";
		
		
		JSONArray jsonArr = new JSONArray();	
		
		String str_jsonArr = "";
				
		
		List<HashMap<String, String>> list = service.detail_tourlist(fk_category);
		
		if(list != null && list.size() > 0) {
			for(HashMap<String,String> map :list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("w_name", map.get("w_name")); 	// map.get("xml에있는 resultMap의 키값")
				jsonObj.put("w_flag", map.get("w_flag"));				
				jsonObj.put("w_image", map.get("w_image"));	
				jsonObj.put("w_comments", map.get("w_comments"));	
				
				jsonObj.put("t_fk_category", map.get("t_fk_category"));				
				jsonObj.put("t_name", map.get("t_name"));				
				jsonObj.put("t_image", map.get("t_image"));				
				
				jsonArr.put(jsonObj);
			}// end of for()------------
			
		}// end of if()---------
			
		str_jsonArr = jsonArr.toString();
		
	//	System.out.println("str_jsonArr=>"+str_jsonArr);
	
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "detail_tourlistJSON.notiles";
	}	


	
	@RequestMapping(value = "/update_scheduler.action", method = RequestMethod.GET)
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
		
		if(result != 0) {
			jsonObj.put("transfer", transfer); 	
			jsonObj.put("schedule", schedule); 	
		
		}
		
		req.setAttribute("str_jsonObj", jsonObj);
		
		return "update_schedulerJSON.notiles";
	}	
	

}
	
	

