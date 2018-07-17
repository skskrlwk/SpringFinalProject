<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.2.1.min.js"></script>


<html>
<head>
<style>
	#div_pwd {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_pwd2 {
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
	
	#div_btnUpdate {
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
			
		$("#btnUpdate").click(function(event){
				
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			
			var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			/* 암호는 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이하만 허락해주는 정규표현식 객체 생성 */
			
			var bool = regexp_passwd.test(pwd);
			/* 암호 정규표현식 검사를 하는 것 
			      정규표현식에 만족하면 리턴값은 true,
			      정규표현식에 틀리면 리턴값은 false */
			      
			if(!bool) {
				alert("암호는 8글자 이상 15글자 이하에 영문자, 숫자, 특수기호가 혼합되어야 합니다."); 
				$("#pwd").val("");
				$("#pwd2").val("");
				event.preventDefault();
				return;
			}   
			else if(pwd != pwd2) {
				alert("암호가 일치하지 않습니다.");
				$("#pwd").val("");
				$("#pwd2").val("");
				event.preventDefault();
				return;
			}
			else {
				var frm = document.pwdConfirmFrm;
				frm.method = "post";
				frm.action = "/finalproject/pwdConfirm.action";
				frm.submit();	
			}
		});
			    
	});
	
</script>

<body>

<form name="pwdConfirmFrm">
   <div id="div_pwd" align="center">
      <span style="color: blue; font-size: 12pt; margin-left: 15%;">새 암호</span><br/> 
      <input style="width: 90%; margin-left: 15%; margin-top: 2%;" type="password" name="pwd" id="pwd" size="15" placeholder="PASSWORD" required />
   </div>
   
   <div id="div_pwd2" align="center">
   	  <span style="color: blue; font-size: 12pt; margin-left: 15%;">새 암호확인</span><br/>
      <input style="width: 90%; margin-left: 15%; margin-top: 2%;" type="password" name="pwd2" id="pwd2" size="15" placeholder="PASSWORD" required />
   </div>
   
   <input type="hidden" name="userid" id="userid" value="${userid}" />
   
   <c:if test="${method.equals('POST') && n==1 }">
   		<div id="div_confirmResult" align="center" style="margin-left: 15%;">
   			ID : ${userid}님의 암호가 새롭게 변경되었습니다.<br/>
   		</div>
   </c:if>
   
   <c:if test="${method.equals('GET')}">
	   <div id="div_btnUpdate" align="center" style="margin-left: 15%;">
	   		<button type="button" class="btn btn-success" id="btnUpdate">암호변경하기</button>
	   </div>		
   </c:if>
   
</form>


</body>
</html>
    