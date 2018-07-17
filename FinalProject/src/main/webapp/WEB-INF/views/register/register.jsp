<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script type="text/javascript">
 
    $(document).ready(function(){
    
    	$("#btnCheckId").click(function(){
    		
			var userid = $("#userid").val().trim();
			
			if(userid == "" || userid.length < 6 || userid.length > 12) {
			//	alert("아이디는 6글자 이상 12글자 이하이여야 합니다.");
			
				$("#checkResult").html("");	
				$("#idErr").html("<span style='color: red; font-size: 10pt;'>아이디는 6글자 이상 12글자 이하이여야 합니다.</span>");
				$("#idErr").show();
				$("#userid").focus();
				return;				
			}
			
			var regexp_id = new RegExp(/^[a-zA-Z0-9]{4,12}$/); 

			var bool = regexp_id.test(userid);
			
			if(!bool){
			//	alert("아이디는 영문자로만 입력가능합니다.");
				$("#checkResult").html("");	
				$("#idErr").html("<span style='color: red; font-size: 10pt;'>아이디는 영문자와 숫자로만 입력 가능합니다.</span>");
				$("#idErr").show();
				$("#userid").focus();
				return;
			}
			
			var form_data = {"userid" : $("#userid").val()};
			
			$.ajax({
				
				url: "<%= request.getContextPath() %>/idCheckJSON.action",
				type: "GET",
				data: form_data,
				dataType: "JSON",
				success: function(json){
					
					var html = "";
					var result = json.result;
					
					if(result == 1){
						html = "<span style='color: red; font-size: 10pt;'>이미 사용중인 아이디 입니다 !!</span>";
					} else {
						html = "<span style='color: red; font-size: 10pt;'>사용 가능한 아이디입니다!!</span>";
					}
					$("#idErr").html("");
					$("#chkResult").val(result);
					$("#checkResult").html(html);	
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
				
			});// end of $.ajax()-------------------------------
			
		});// end of $("#idcheck").click()--------------------
				
		
    }); // end of $(document).ready()---------------------------	
    
    
    
    function goRegister() {
    	
    	var chkResult = $("#chkResult").val().trim();
    	
    	if(chkResult == "") {
    	//	alert("아이디 중복검사를 눌러주세요");
    		$("#idErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>아이디 중복검사를 눌러주세요</span>");
    		$("#idErr").show();
    		$("#userid").focus();
    		return;
    	}
    	else if($("#chkResult").val() == 1){
    	//	alert("이미 사용중인 아이디입니다");
    		$("#idErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>이미 사용중인 아이디입니다</span>");
    		$("#idErr").show();
    		$("#userid").focus();
    		return;
    	}else {
    		$("#idErr").hide();
    	}
    	
    	
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
		
		var name= $("#name").val().trim();
		var regexp_name = /^[가-힣]{2,4}$/;
		bool = regexp_name.test(name);
		
		
		if(name == ""){
			$("#nameErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>이름을 입력하세요.</span>");
			$("#nameErr").show();
			$("#name").focus();
			return;
		}else if(!bool) {
			$("#nameErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>2글자 ~ 4글자의 이름을 입력하세요.</span>");
			$("#nameErr").show();
			$("#name").focus();
			return;
		}else{
			$("#nameErr").hide();
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
	
		
		
		var birthday = $("#birthday").val();
		var regexp_birthday = /^[0-9]{8}/g;
		bool = regexp_birthday.test(birthday);
		
		if(!bool){
			$("#birthdayErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>'19920430' 형식으로 입력하세요.</span>");
			$("#birthdayErr").show();
			$("#birthday").focus();
			return;
		}else{
			var year = Number(birthday.substr(0,4)); 
		    var month = Number(birthday.substr(4,2));
		    var day = Number(birthday.substr(6,2));
		    var today = new Date(); // 날자 변수 선언
			
		    if (year < 1900){
		    	$("#birthdayErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>년도를 확인하세요. 1900 년생 이후 출생자만 등록 가능합니다.</span>");
		    	$("#birthdayErr").show();
				$("#birthday").focus();
		    	return;
		    }
		    if (month < 1 || month > 12) { 
		    	$("#birthdayErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>달은 1월부터 12월까지 입력 가능합니다.</span>");
		    	$("#birthdayErr").show();
				$("#birthday").focus();
		    	return;
		    }
		    if (day < 1 || day > 31) {
		        $("#birthdayErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>일은 1일부터 31일까지 입력가능합니다.</span>");
		        $("#birthdayErr").show();
				$("#birthday").focus();
		        return;
		    }
		    if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		        $("#birthdayErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>해당월은 31일이 존재하지 않습니다.</span>");
		        $("#birthdayErr").show();
				$("#birthday").focus();
		        return;
		    }
		    if (month == 2) {
		        var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		        if (day>29 || (day==29 && !isleap)) {
		            $("#birthdayErr").html("<span style='color: red; font-size: 10pt; font-family: 나눔고딕;'>해당 년 2월은 해당 일이 존재하지 않습니다.</span>");
		            $("#birthdayErr").show();
					$("#birthday").focus();
		            return;
		       }
		    }
		    $("#birthdayErr").hide();
		}
		
		var registerFrm = document.registerFrm;
		registerFrm.method = "post";
		registerFrm.action = "/finalproject/registerMember.action";
		registerFrm.submit();
		
    } // end of function goRegister()-----------------------------------------
    
    
</script>



<!-- Home -->

	<div class="home">
		
		<div class="home_slider_container">
			
			
			<!-- Image by https://unsplash.com/@anikindimitry -->
			<div class="home_slider_background" style="background-image:url(<%= request.getContextPath() %>/resources/images/register.jpg)"></div>
			<div class="register_slider_content text-center">
					<br/><br/><br/><br/><br/><br/>
				<div style="margin-top: 30px;" class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
					
					<form name="registerFrm">
					
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px; padding-right: 0%;">I  D</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; text-align: left;">
								<input style="float: left; width: 300px;" class="search_input" type="text" name="userid" id="userid" size="20" maxlength="12" placeholder="6 ~ 12 자 이내의  숫자 및 영문자" />
								<button type="button" style="margin-left: 5px; margin-top: 8px;" class="btn btn-primary btn-dark" id="btnCheckId">
				                   <span style="font-size: 10pt;">중복검사</span><br/>
				                </button><br/><br/>
				             	<span id="idErr"></span>
		          	   			<span id="checkResult"></span>							
							</div>
			          	</div>
			          	
			          	<input type="hidden" id="chkResult"/> 
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">Pass  Word</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="password" name="password1" id="password1" size="20" placeholder="숫자 + 영문자 + 특수문자 -> 최소 8글자 이상" />
								<span id="passwordErr1"></span>
							</div>
						</div> 
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">Pass  Word check</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="password" name="password2" id="password2" size="20" placeholder="비밀번호를 다시한번 확인합니다." />
								<span id="passwordErr2"></span>
							</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">n a m e</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="name" id="name" size="20" placeholder="홍길동" />
								<span id="nameErr"></span>
							</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">e - mail</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="email" id="email" size="20" placeholder="abc@naver.com" />
								<span id="emailErr"></span>
							</div>
						</div>
						
						<div style="width: 800px; height: 80px;">
							<div style="width: 300px; height: 75px; float: left; text-align: right;">
								<label style="margin-top: 16px;">cell - phone</label>
							</div>
							<div style="width: 449px; height: 75px; float: right; top: 18px; vertical-align: left;"> 
								<input style="float: left; width: 300px;" class="search_input" type="text" name="tel" id="tel" size="20" maxlength="11" placeholder="'-' 없이 입력해주세요." />
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
								<input style="float: left; width: 300px;" class="search_input" type="text" name="birthday" id="birthday" size="20" maxlength="8" placeholder="'19920430' 형식으로 입력하세요." />
								<span id="birthdayErr"></span>
							</div>
						</div>
					
					</form>
					
					<br/> 
						<button class="button search_button" onClick="goRegister();">회원가입<span></span><span></span><span></span></button>
						<button class="button search_button" onClick="javascript:history.back();">취소<span></span><span></span><span></span></button>
					<br/> 
				</div>
			</div> 
		
		</div>
		
	</div>
		


  