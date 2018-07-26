package com.spring.finalproject;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.finalproject.common.MyUtil;
import com.spring.finalproject.service.InterYoonService;
import com.spring.member.model.MemberVO;

// ===== 컨트롤러 선언 =====
@Controller
@Component
/*
   XML에서 빈을 만드는 대신에 클래스명 앞에 @Component 어노테이션을 적어주면
     해당 클래스(지금은 BoardController)는 bean으로 자동 등록된다.
     그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명(지금은 BoardController)이 된다.
     지금은 bean의 이름은 boardController 이 된다.
 */
public class YoonController {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterYoonService service;

	// ==== 로그인 페이지 요청 ====
	@RequestMapping(value="/login.action", method={RequestMethod.GET})  
	public String login(HttpServletRequest req) {
		
		return "login/loginform.tiles";
	}
	
	
	// ==== 로그인 여부 요청 ====
	@RequestMapping(value="/loginEnd.action", method={RequestMethod.POST})  
	public String loginEnd(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		String password = req.getParameter("password");
		
		HashMap<String, String> map = new HashMap<String, String>(); 
		map.put("userid", userid);
		map.put("password", password);
		
		MemberVO loginuser = service.getLoginMemeber(map);
		
		if(loginuser != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", loginuser);
		
			
			String gobackURL = (String)session.getAttribute("gobackURL");
			req.setAttribute("gobackURL", gobackURL);
			session.removeAttribute("gobackURL");
		}
		
		return "login/loginEnd.tiles";
	}
	

	// ==== 로그아웃 완료 요청 ====
	@RequestMapping(value="/logout.action", method={RequestMethod.GET})  
	public String logout(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "login/logout.tiles";
	}
	
	// ==== 회원가입 페이지 요청 ====
	@RequestMapping(value="/register.action", method={RequestMethod.GET})  
	public String register() {
		
		return "register/register.tiles";
	}
	
	// ==== 회원가입 id 중복검사 ====
	@RequestMapping(value="/idCheckJSON.action", method={RequestMethod.GET})  
	public String idCheck(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		
		int result = service.idCheck(userid);
		JSONObject json = new JSONObject();
		
		json.put("result", result);
		String str_result = json.toString();
		
	//	System.out.println("str_result : " + str_result);
		
		req.setAttribute("str_result", str_result);
				
		return "idCheckJSON.notiles";
	}
	
	
	// ==== 회원가입 ====
	@RequestMapping(value="/registerMember.action", method={RequestMethod.POST})  
	public String registerMember(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		String password = req.getParameter("password1");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		int gender = 1;
		if(req.getParameter("gender").equals("female")) {
			gender = 2;
		}
		String birthday = req.getParameter("birthday");
		
		
		MemberVO membervo = new MemberVO();
		
		membervo.setUserid(userid);
		membervo.setPassword(password);
		membervo.setName(name);
		membervo.setEmail(email);
		membervo.setTel(tel);
		membervo.setGender(gender);
		membervo.setBirthday(birthday);
		
				
		int result = service.registerMember(membervo);

		if(result == 1) {
			
			HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("userid", userid);
			map.put("password", password);
			
			MemberVO loginuser = service.getLoginMemeber(map);
			
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", loginuser);
			
			return "register/registerSuccess.tiles";
		}
		else {
			return "register/registerFail.tiles";
		}
		
	}// end of  ==== 회원가입 ====-------------------------------------

	
	
	// ==== 아이디 찾기 ====
	@RequestMapping(value="/idFind.action", method={RequestMethod.GET, RequestMethod.POST})  
	public String idFind(HttpServletRequest req) {
		
		String method = req.getMethod();
		
		req.setAttribute("method", method);
		
		if("post".equalsIgnoreCase(method)) {
		
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			
			HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("name", name);
			map.put("tel", tel);
			
			String userid = service.getUserid(map);
			
			if(userid != null) {
				req.setAttribute("userid", userid);
			}
			else {
				req.setAttribute("userid", "존재하지 않습니다.");
			}
		
			req.setAttribute("name", name);
			req.setAttribute("tel", tel);
			
		}
		
		return "idFind.notiles";
	}
	
	
	// ==== 비밀번호 찾기 ====
	@RequestMapping(value="/pwdFind.action", method={RequestMethod.GET, RequestMethod.POST})  
	public String pwdFind(HttpServletRequest req) {
		
		String method = req.getMethod();
		req.setAttribute("method", method);
		
		if("post".equalsIgnoreCase(method)) {
			// 비밀번호 찾기 모달창에서 찾기 버튼을 클릭했을 경우
			String userid = req.getParameter("userid");
			String email = req.getParameter("email");
			
			HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("userid", userid);
			map.put("email", email);
			
			int n = service.isUserExists(map); 
			
			if(n == 1) {
				
				GoogleMail mail = new GoogleMail();
				
				Random rnd = new Random();
				
				String certificationCode = "";
				// certificationCode ==> "ewtyq0452029"
				
				char randchar = ' ';
				for(int i=0; i<5; i++) {
					// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면
					// int rndnum = rnd.nextInt(max - min + 1) + min;  
					randchar = (char)(rnd.nextInt('z' - 'a' + 1) + 'a');
					certificationCode += randchar;
				}
				
				int randnum = 0;
				for(int i=0; i<7; i++) {
					randnum = (int)(rnd.nextInt(10-0+1)+0);
					certificationCode += randnum;
				}
				
				try {
					mail.sendmail(email, certificationCode, req);
					req.setAttribute("certificationCode", certificationCode);
					
				} catch(Exception e) {
					e.printStackTrace();
					
					req.setAttribute("sendFailmsg", "메일발송에 실패했습니다.");
					n = -1;
				}
				
			}
			
			req.setAttribute("n", n);  
			// n이 0이면 존재하지 않은 userid 또는 email 인 경우
			// n이 1이면 userid 와 email 존재하면서 메일발송이 성공한 경우
			// n이 -1이면 userid 와 email 존재하는데 메일발송이 실패한 경우
			
			req.setAttribute("userid", userid);
			req.setAttribute("email", email);
		}
		
		return "pwdFind.notiles";
	}
	
	
	
	// ==== 비밀번호 새로 등록 ====
	@RequestMapping(value="/pwdConfirm.action", method={RequestMethod.GET, RequestMethod.POST})  
	public String pwdConfirm(HttpServletRequest req) {
		
		String method = req.getMethod();
		req.setAttribute("method", method);
		
	    String userid =	req.getParameter("userid");
	    req.setAttribute("userid", userid);
	    
	    if("POST".equalsIgnoreCase(method)) {
	    	String pwd = req.getParameter("pwd");
	    	
	    	HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("userid", userid);
			map.put("pwd", pwd);
	    		    	
	    	int n = 0;
	    	if(userid != null && pwd != null) {
	    		n = service.updatePwdUser(map);
	    	}
	    	
	    	req.setAttribute("n", n);
	    }
		
		return "pwdConfirm.notiles";
	}
	
	
	
	// ==== 회원수정 페이지 요청 ====
	@RequestMapping(value="/myInfoEdit.action", method={RequestMethod.GET})  
	public String requireLogin_myInfoEdit(HttpServletRequest req, HttpServletResponse res) {
		
		return "edit/myInfoEdit.tiles";
	}
	
	
	// ==== 회원정보 수정 ====
	@RequestMapping(value="/editMember.action", method={RequestMethod.POST})  
	public String editMember(HttpServletRequest req) {
	
		HttpSession session = req.getSession();
		
		String userid = req.getParameter("userid");
		String password = req.getParameter("password1");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		int gender = 1;
		if(req.getParameter("gender").equals("female")) {
			gender = 2;
		}
		String birthday = req.getParameter("birthday");
		
		
		MemberVO membervo = new MemberVO();
		
		membervo.setUserid(userid);
		membervo.setPassword(password);
		membervo.setName(name);
		membervo.setEmail(email);
		membervo.setTel(tel);
		membervo.setGender(gender);
		membervo.setBirthday(birthday);
		
				
		int result = service.editMember(membervo);

		req.getSession();
		
		if(result == 1) {
			session.removeAttribute("loginuser");
			session.setAttribute("loginuser", membervo);
			return "edit/editSuccess.tiles";
		}
		else {
			
			return "edit/editFail.tiles";
		}
		
	}// end of  ==== 회원정보 수정 ====-------------------------------------
	

	
	// ==== 회원 탈퇴 찾기 ====
	@RequestMapping(value="/memberQuit.action", method={RequestMethod.GET, RequestMethod.POST})  
	public String memberQuit(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		String method = req.getMethod();
		// System.out.println("===> 확인용 memberQuit 의 method : " + method);
		
		req.setAttribute("method", method);
		
		if("post".equalsIgnoreCase(method)) {
		
			MemberVO membervo = (MemberVO)session.getAttribute("loginuser");
			String userid = membervo.getUserid();
			String password = req.getParameter("password");
			
			HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("userid", userid);
			map.put("password", password);
			
			int result = service.memberQuit(map);
			
			req.setAttribute("result", result);
			
			if(result == 1) {
				session.removeAttribute("loginuser");
				return "memberQuit.notiles";
			}
			else {
				result = 9999;
				req.setAttribute("result", result);
			}
						
		}
		return "memberQuit.notiles";
	}
	
	
	
	// ==== 좋아요 갯수 불러오기 ====
	@RequestMapping(value="/likeJSON.action", method={RequestMethod.GET})  
	public String likecnt(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String seq_schedule = request.getParameter("seq_schedule");
		MemberVO membervo = (MemberVO)session.getAttribute("loginuser");
		
		
		JSONObject json = new JSONObject();
		HashMap<String, String> map = new HashMap<String, String>(); 
				
		if(membervo == null) {
			json.put("likeNoLoginMSG", 1);
			
			String str_result = json.toString();
			
			System.out.println("str_result : " + str_result);
			
			request.setAttribute("str_result", str_result);
					
			return "likeNoLoginMSG.notiles";
		}
		else {
			String userid = membervo.getUserid();
			
			map.put("seq_schedule", seq_schedule);
			map.put("userid", userid);			
			
			int checklike = service.checklike(map);
			
			if(checklike == 1) {
				json.put("checklike", checklike);
			}
			else {
				json.put("checklike", checklike);
				int addlike = service.addlike(map);
				
				if(addlike == 1) {
					json.put("addlike", addlike);
				}
				else {
					json.put("addlike", addlike);
				}
			}
			
			
			int likecnt = service.likecnt(map);
			
			json.put("likecnt", likecnt);
								
			String str_result = json.toString();
			
			System.out.println("str_result : " + str_result);
			
			request.setAttribute("str_result", str_result);
					
			return "likecntJSON.notiles";
		}
		
	}
	
	
	@RequestMapping(value="/memberList.action", method={RequestMethod.GET})  
	public String requireAdmin_memberList(HttpServletRequest request, HttpServletResponse response) {
			
		String currentURL = MyUtil.getCurrentURL(request);
		HashMap<String, String> map = new HashMap<String, String>();
		
		request.setAttribute("currentURL", currentURL);
		
	    String str_sizePerPage = request.getParameter("sizePerPage");
		
	    if(str_sizePerPage == null)  // 초기화면
	    	str_sizePerPage = "10";
	    	    
	    int sizePerPage = 0;
	    
	    int startRno = 0;          
		int endRno = 0; 

	    try{
	    	sizePerPage = Integer.parseInt(str_sizePerPage);
	    	
	    	if(sizePerPage != 3 && sizePerPage != 5 && sizePerPage != 10) {
		    	sizePerPage = 10;
		    }
	    } catch(NumberFormatException e){
	    	sizePerPage = 10;
	    }
	    
	    request.setAttribute("sizePerPage", sizePerPage);
				
		int totalMemberCount = service.getMemberCnt();
		
		request.setAttribute("totalMemberCount", totalMemberCount - 1);
	    
		
		int totalPage = (int)Math.ceil((double)totalMemberCount / sizePerPage);   
		request.setAttribute("totalPage", totalPage);
        
	    
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
	    int currentShowPageNo = 0; // 사용자가 보고자 하는 페이지번호    
			    
	    if(str_currentShowPageNo == null || str_currentShowPageNo.trim().isEmpty() ) {
	    	currentShowPageNo = 1;
	    	// 초기화면은 현재페이지 번호로 1 페이지로 설정한다.
	    }
	    else {
	    	try{
	    		currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	        	// 사용자가 보고자하는 페이지번호를 클릭했을 때
	        	// 페이지번호를 현재페이지로 설정함.
	        	
	        	if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
	        		currentShowPageNo = 1;
	        	}
	        	
	    	}catch(NumberFormatException e) {
	    		currentShowPageNo = 1;
	    	}
	    	
	    }
	    
	    startRno = (currentShowPageNo - 1) * sizePerPage + 1;
		endRno = startRno + sizePerPage - 1;	    
	    
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
	    int blockSize = 10;
		String url = "memberList.action";
			
		String pageBar = MyUtil.getPageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize);
		  
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("currentShowPageNo", currentShowPageNo);
	    
		
		
		List<HashMap<String, String>> memberlist = service.getAllMembers(map);
		
		request.setAttribute("memberlist", memberlist);
		
		return "/memberList/memberList.tiles";
	}
	
	
	@RequestMapping(value="/memberDelete.action", method={RequestMethod.POST})  
	public String requireAdmin_memberDelete(HttpServletRequest request, HttpServletResponse response) {
	
		String userid = request.getParameter("userid");
		
		int n = service.deleteMember(userid);
		
		request.setAttribute("n", n);
		
		return "/memberList/memberResultComment.tiles";
	}
	
	
	@RequestMapping(value="/goMemberRecover.action", method={RequestMethod.POST})  
	public String requireAdmin_goMemberRecover(HttpServletRequest request, HttpServletResponse response) {
	
		String userid = request.getParameter("userid");
		
		int n = service.recoverMember(userid);
				
		request.setAttribute("n", n);
		
		return "/memberList/memberResultComment.tiles";
	}
	
	
	
	
	
}