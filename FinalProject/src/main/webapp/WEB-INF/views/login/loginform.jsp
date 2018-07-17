<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
    $(document).ready(function(){
    	 
    	$("#password").keydown(function(event){
    		if(event.keyCode == 13) { // 엔터를 했을 경우
    			func_Login();
    		}
    	});// end of $("#password").keydown()--------------------
    	
    	 
    }); // end of $(document).ready()---------------------------	 


    
    function func_Login() {
    	
    	if(${sessionScope.loginuser != null}) {
    		alert("이미 로그인 하신 상태입니다!!");
    		$("#userid").val("");
    		$("#password").val("");
    		$("#userid").focus();
    		event.preventDefault();
    		return;
    	}
    	
    	var userid = $("#userid").val();
    	var password = $("#password").val();
    	
    	if(userid.trim() == "") {
    		alert("아이디를 입력하세요!!");
    		$("#userid").val("");
    		$("#userid").focus();
    		event.preventDefault();
    		return;
    	}
    	
    	if(password.trim() == "") {
    		alert("암호를 입력하세요!!");
    		$("#password").val("");
    		$("#password").focus();
    		event.preventDefault();
    		return;
    	}
    	
    	var frm = document.loginFrm;
    	frm.action = "/finalproject/loginEnd.action";
    	frm.method = "post";
    	frm.submit();
    	
    }  // end of function func_Login(event)----------------------
    
   
</script>

<!-- Home -->

	<div class="home">
		
		<div class="home_slider_container">
			
			<form name="loginFrm">
				<!-- Image by https://unsplash.com/@anikindimitry -->
				<div class="home_slider_background" style="background-image:url(<%= request.getContextPath() %>/resources/images/login.jpg)"></div>
				<div class="login_slider_content text-center">
					<div style="margin-top: 30px;" class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
						<h2>I d</h2>
						<input style="width: 90%;" class="search_input" type="text" name="userid" id="userid" size="20" placeholder="abcd1234" /><br/>
						<div class="button_forget" id="btnForgetId"><div class="button_bcg_Forget"></div><a style="cursor: pointer; color: white;" data-toggle="modal" data-target="#userIdfind" data-dismiss="modal">Forget Id?<span></span><span></span><span></span></a></div>
						<br/>
						<br/>
						<h2 style="margin-top: 15px;">Pass  Word</h2>
						<input style="width: 90%;" class="search_input" type="password" name="password" id="password" size="20" placeholder="********" /><br/>
						<div class="button_forget" id="btnForgetPassword"><div class="button_bcg_Forget"></div><a style="cursor: pointer; color: white;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal">Forget Password?<span></span><span></span><span></span></a></div>
						<br/>
						<div class="button login_register_button" id="btnLOGIN"><div class="button_bcg"></div><a href="#" onclick="func_Login(); return false;">Login<span></span><span></span><span></span></a></div>
						<div class="button login_register_button" id="btnREGISTER"><div class="button_bcg"></div><a href="<%=request.getContextPath()%>/register.action">Sign Up<span></span><span></span><span></span></a></div>
						<br/>
					</div>
				</div>
			</form>
			
		</div>
		
		
	<div class="modal fade" id="userIdfind" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" align="center">
          <button type="button" class="close myclose" data-dismiss="modal"></button>
          <h4 style="padding-right: 40%; color: black;" class="modal-title">아이디 찾기</h4>
        </div>
        <div class="modal-body" style="height: 300px; width: 100%;">
          <div id="idFind">
          	<iframe style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath() %>/idFind.action">
          	</iframe>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   


  <%-- ****** 비밀번호 찾기 Modal ****** --%>
  <div class="modal fade" id="passwdFind" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close myclose" data-dismiss="modal"></button>
          <h4 style="padding-right: 40%; color: black;" class="modal-title">비밀번호 찾기</h4>
        </div>
        <div class="modal-body">
          <div id="pwFind">
          	<iframe style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath() %>/pwdFind.action">  
          	</iframe>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		
				
	</div>
		


  