<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.2.1.min.js"></script>


<html>
<head>
<style>
	#div_userid {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_email {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_findResult {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;		
		position: relative;
	}
	
	#div_btnFind {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	

#mycontainer	{ border: 0px solid red;
				  background-color: #F0F0F0;  
				  position: absolute;
				  top: 20px;
				  left: 40px;
                  width: 95%; 
                  min-height: 800px;
                  margin: 0 auto; 
                  padding: 10px; }

#headerImg		{ background-color: #908886; 
                  height: 70px; 
                  padding: 10px;}
                  
#headerLink		{ margin-top: 20px; 
                  margin-left: 55%; 
                  font-size: 13pt; }

#goldline		{ position: relative; 
                  top: 15px; 
                  height: 3px;
                  background-color: gold; }

#sideinfo		{ position: relative; 
                  top: 25px; 
                  background-color: #E6E6E6;  
                  width: 20%; 
                  min-height: 600px; 
                  float: left; }
                  
#content		{ position: relative; 
                  top: 25px; 
                  background-color: #F5F5F5; 
                  width: 80%; 
                  min-height: 600px; 
                  float: left; }  

#footer			{ position: relative; 
                  top: 35px;
                  background-color: #999999; 
                  height: 70px; 
                  margin-top: 10px; 
                  margin-bottom: 35px;
                  clear:both; }


/*표준 글꼴 서식 스타일*/
 body, td, th, input, select, textarea, p {
	font-size: 12pt;
	font-family: 'NanumGothic', 'MalgunGothic' ; 
	color: navy;
	padding: 4px; /* 안쪽 여백 */
}

/* 표준 링크 스타일 */
a {text-decoration: none;}

/* 
   a:link { text-decoration:none; }

   a:visited { text-decoration:none; } 
*/

/* unvisited link */
a:link {
	color: #005c99;	
}

/* visited link */
a:visited{
	color: #005c99;
}

/* mouse over link */
a:hover { color:maroon; 
          font-weight: bold; }
          
/* selected link */
a:active {
	color: navy;
}          
          
		  
#headerLink a:hover { text-decoration: none;
	                  color: maroon;
		  			  font-weight: bold;
		  			  font-size:12pt;
		  			  cursor: pointer;  }	   

.box { border:1px solid navy; }

.box2 { border:1px dotted red; }

table.outline { width: 95%;
	            border-top: 4px double navy;
	            border-bottom: 4px double navy; }
	             
table.outline th {background-color: #e6e6e6;}	             

.error { color: red; padding-left: 10px; margin-bottom: 5px;}

img { border: 0px; }

.bgcol {background-color: LightGray;}
	
	
</style>
</head>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#btnFind").click(function(){
			var frm = document.pwdFindFrm;
			frm.method = "post";
			frm.action = "/finalproject/pwdFind.action";
			frm.submit();
		});
		
		var method = "${method}";
		var userid = "${userid}";
		var email = "${email}";
		var n = "${n}";
		
		if(method=="POST" && userid != "" && email != "") {
			$("#userid").val(userid);
			$("#email").val(email);
		}
		
		if(method=="POST" && n==1) {
			$("#div_btnFind").hide();
		}
		else if(method=="POST" && (n == -1 || n == 0)) {
			$("#div_btnFind").show();
		}		
		
		$("#btnConfirmCode").click(function(){
			if( $("#input_confirmCode").val() == "${certificationCode}" ) {
				alert("인증성공 되었습니다.");
				
				var frm = document.pwdFindFrm;
				frm.method = "get"; // 새암호와 새암호확인을 입력받기 위한 폼만을 띄워주기 때문에 get 방식으로 한다.
				frm.action = "/finalproject/pwdConfirm.action";
				frm.submit();
			}
			else {
				alert("인증코드를 다시 입력하세요!!");
				$("#input_confirmCode").val("");
				$("#input_confirmCode").focus();
			}
			
		});
		    
	});
	
</script>

<body>
<form name="pwdFindFrm">
   <div id="div_userid" align="center">
      <span style="color: blue; font-size: 12pt; margin-left: 15%;">아이디</span><br/> 
      <input style="width: 90%; margin-left: 15%; margin-top: 2%;" type="text" name="userid" id="userid" size="15" placeholder="ID" required />
   </div>
   
   <div id="div_email" align="center">
   	  <span style="color: blue; font-size: 12pt; margin-left: 15%;">이메일</span><br/>
      <input style="width: 90%; margin-left: 15%; margin-top: 2%;" type="text" name="email" id="email" size="15" placeholder="abd@def.com" required />
   </div>
   
   <div id="div_findResult" align="center">
   	   <c:if test="${n == 1}">
   	      <div id="pwdConfirmCodeDiv" style="margin-left: 15%;">
   	      	  인증코드가 ${email}로 발송되었습니다.<br/>
   	      	  인증코드를 입력해주세요<br/>
   	      	 <input type="text" name="input_confirmCode" id="input_confirmCode" required />
   	      	 <br/><br/>
   	      	 <button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>    
   	      </div>
   	   </c:if>
   	   
   	   <c:if test="${n == 0}">
   	   	  <span style="color: red;">사용자 정보가 없습니다.</span>
   	   </c:if>
   	   
   	   <c:if test="${n == -1}">
   	   	  <span style="color: red;">${sendFailmsg}</span>
   	   </c:if>
   	   
   </div>
   
   <div id="div_btnFind" align="center">
   		<button type="button" class="btn btn-success" id="btnFind" style="margin-left: 15%; margin-top: 8%;">찾기</button>
   </div>
   
</form>

</body>
</html>
    