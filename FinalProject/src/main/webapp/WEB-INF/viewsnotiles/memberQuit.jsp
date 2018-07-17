<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.2.1.min.js"></script>


<html>
<head>
<style>
	#div_name {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_tel {
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
	    	var frm = document.memberQuitFrm;
	    	frm.method = "POST";
	    	frm.action = "/finalproject/memberQuit.action";
	    	frm.submit();
	    });
	    	    	    
	    if("${result}" == 1) {
	    	alert("회원삭제가 성공적으로 이루어졌습니다. 이용해 주셔서 감사합니다.");
	    	window.parent.location.href="<%= request.getContextPath() %>/index.action";
	    }
	    if("${result}" == 9999) {
	    	memberQuitFail();
	    }
	    
	});
	
	function memberQuitFail(){
		
		alert("비밀번호를 올바르게 입력해주세요.");
		
	}
	
</script>

<body>
	<form name="memberQuitFrm">
	   
	   <div id="div_tel" align="center">
	   	  <span style="color: blue; font-size: 12pt; margin-left: 15%;">비밀번호</span><br/>
	   	  <input style="width: 90%; margin-left: 15%; margin-top: 2%;" class="search_input" type="password" name="password" id="password" size="30" required />
	   </div>
	   
	   <div id="div_btnFind" align="center">
	   		<button type="button" class="btn btn-success" id="btnFind" style="margin-left: 15%; margin-top: 8%;">삭제하기</button>
	   </div> 
	   
	</form>
</body>
</html>
    