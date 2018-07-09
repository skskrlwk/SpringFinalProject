package com.spring.finalproject;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.model.WorldDetailVO;
import com.spring.finalproject.model.WorldVO;
import com.spring.finalproject.service.InterLimService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LimController {
	
	// ===== 의존객체 주입하기(DI: Dependency Injection) =====
	@Autowired
	private InterLimService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LimController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index.action", method = RequestMethod.GET)
	public String index() {
		
		return "index.tiles";
	}
	
	@RequestMapping(value = "/scheduleAdd.action", method = RequestMethod.GET)
	public String scheduleAdd(HttpServletRequest request) {
		
		List<HashMap<String, String>> mapList = service.getWorldMap();
		 
		request.setAttribute("mapList", mapList);
		
		
		 
		return "schedule/scheduleAdd.tiles";
	}
	
	
	
}
