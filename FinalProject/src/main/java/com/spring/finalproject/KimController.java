package com.spring.finalproject;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.service.InterKimService;

@Controller
public class KimController {
		
	// ==== #33. 의존객체 주입하기(DI : Dependency Injection) ====
	@Autowired
	private InterKimService service;
	
	// ==== #40. 메인 페이지 요청 ====
	@RequestMapping(value="/index.action", method={RequestMethod.GET})  
	public String index(HttpServletRequest req) {
		
		return "main/index.tiles";
 
	}
	
	// 일정 카테고리 목록 띄우는 페이지
	@RequestMapping(value="/category/selectCategory.action", method={RequestMethod.GET})  
	public String selectCategory(HttpServletRequest req) {
		
		List<HashMap<String, String>> schedulelist = service.getScheduleList();
		req.setAttribute("schedulelist", schedulelist);
		
		return "main/selectCategory.notiles";
 
	}

}