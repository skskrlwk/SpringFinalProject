<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script type="text/javascript">

    
    function goEdit() {
    	    	
    	var password = $("#password1").val().trim();

    	var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
		// 암호는 영문자,숫자,특수문자가 포함된 형태의 8~15글자 이하만 허락해주는 정규표현식 객체 생성.
		
		var bool = regexp_passwd.test(password);
		// 암호 정규표현식 검사를 하는 것. 리턴값은 boolean타입이며 정규표현식에 만족하면 true, 아니면 false
		
		if(!bool) {
			// 정규식에 만족하지 못한경우
		//	alert("패스워드 형식에 맞게 입력하세요");
			$("#passwordErr1").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>암호는 영문자,숫자,특수문자가 포함된 8~15글자 이하만 가능합니다</span>");
			$("#passwordErr1").show();
			$("#password1").focus();
			return;
		}else {
			$("#idErr").hide();
			$("#passwordErr1").hide();
		}
		
		
		var passwdChk = $("#password2").val().trim();
		
		if(password != passwdChk){
		//	alert("비밀번호가 일치하지 않습니다.");
			$("#passwordErr2").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>비밀번호가 일치하지     않습니다.</span>");
			$("#passwordErr2").show();
			$("#password2").focus();
			return;
		}else {
			$("#passwordErr2").hide();
		}
				
		
		var email = $("#email").val();
		var regexp_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		bool = regexp_email.test(email);
		
		if(!bool){
		//	alert("이메일 형식이 아닙니다.");
			$("#emailErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>이메일 형식이 아닙니다.</span>");
			$("#emailErr").show();
			$("#email").focus();
			return;
		}else{
			$("#emailErr").hide();
		}
		
		
		var tel = $("#tel").val();
		var regexp_tel = /^[0-9]{11}/g;
		bool = regexp_tel.test(tel);
		
		var firstNum = String(tel.substr(0,3));
		
		if(firstNum != "010") {
			$("#telErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>010으로 시작하는 번호로 다시입력하세요.</span>");
			$("#telErr").show();
			$("#tel").focus();
			return;
		}
		
		if(!bool){
		//	alert("이메일 형식이 아닙니다.");
			$("#telErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>'-' 없이 숫자 11자리만 입력해주세요.</span>");
			$("#telErr").show();
			$("#tel").focus();
			return;
		}else{
			$("#telErr").hide();
		}
			
		var editFrm = document.editFrm;
		editFrm.method = "post";
		editFrm.action = "/finalproject/editMember.action";
		editFrm.submit();
		
    } // end of function goEdit()-----------------------------------------
    
    
</script>



<!-- Home -->

	<div class="home">
		
		<div class="home_slider_container">
			
			
			<!-- Image by https://unsplash.com/@anikindimitry -->
			<div class="home_slider_background" style="background-image:url(<%= request.getContextPath() %>/resources/images/register.jpg)"></div>
			<div class="register_slider_content text-center">
					<br/><br/><br/><br/><br/><br/>
				<div style="margin-top: 30px;" class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
					
					<form name="editFrm">
					
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px; padding-right: 0%;">I  D</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; text-align: left;">
								<input style="float: left; width: 300px;" class="search_input" type="text" name="userid" id="userid" size="20" value="${sessionScope.loginuser.userid}" readonly="readonly" />			
							</div>
			          	</div>
			          							
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">Pass  Word</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="password" name="password1" id="password1" size="20" value="${sessionScope.loginuser.password}" placeholder="숫자 + 영문자 + 특수문자 -> 최소 8글자 이상" />
								<span id="passwordErr1"></span>
							</div>
						</div> 
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">Pass  Word check</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="password" name="password2" id="password2" size="20" value="${sessionScope.loginuser.password}" placeholder="비밀번호를 다시한번 확인합니다." />
								<span id="passwordErr2"></span>
							</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">n a m e</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="name" id="name" size="20" value="${sessionScope.loginuser.name}" readonly="readonly" />
							</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">e - mail</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="email" id="email" size="20" value="${sessionScope.loginuser.email}" placeholder="abc@naver.com" />
								<span id="emailErr"></span>
							</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">cell - phone</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="tel" id="tel" size="20" value="${sessionScope.loginuser.tel}" maxlength="11" placeholder="'-' 없이 입력해주세요." />
								<span id="telErr"></span>
							</div>
						</div> 
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">gender</label>
							</div> 
							<div class="gender" style="width: 449px; height: 75px; float: left; top: 18px; vertical-align: left;">
							    <input type="radio" name="gender" id="male" value="male" checked />
							    <label for="male">male</label>
							    <input type="radio" name="gender" id="female" value="female" style="margin-left: 50px;" />
							    <label for="female">female</label>
						  	</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">birth day</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="birthday" id="birthday" size="20" value="${sessionScope.loginuser.birthday}" readonly="readonly" />
							</div>
						</div>
					
					</form>
					
					<br/> 
						<button class="button search_button" onClick="goEdit();">회원정보 수정<span></span><span></span><span></span></button>
						<button class="button search_button" onClick="javascript:history.back();">취소<span></span><span></span><span></span></button>
						<button class="button search_button" style="cursor: pointer; color: white;" data-toggle="modal" data-target="#memberQuit" data-dismiss="modal">회원탈퇴<span></span><span></span><span></span></button>
					<br/>
				</div>
			</div> 
		
		</div>
		
		
		<div class="modal fade" id="memberQuit" role="dialog">
    <div class="modal-dialog"> 
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" align="center">
          <button type="button" class="close myclose" data-dismiss="modal"></button>
          <h4 style="padding-right: 40%; color: black;" class="modal-title">회원 탈퇴</h4>
        </div>
        <div class="modal-body" style="height: 300px; width: 100%;">
          <div id="quit">
          	<iframe style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath() %>/memberQuit.action">
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
		


  