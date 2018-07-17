<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<head>
<title></title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style type="text/css">
.call {
	font-size: 25px;
	font-weight: bold;
	color: red;
	
}


 div.pagebar {
	font-size: 25px;
	list-style:none;  
	color: green;
    
    
	
	
	
} 
</style>


<script type="text/javascript">
	$(document).ready(function(){
		
	
	});

	
function goView(seq_schedule){
		
		var frm = document.goViewFrm;
		frm.seq_schedule.value = seq_schedule;
		frm.action="otherview.action";
		// frm.action="view.action"; view앞에 /없으므로 상대경로이다.
		frm.method="get";
		frm.submit();
		
	}// end of functino goView(seq)--------------------
	
	
</script>


<div align="center" class="call" style="margin-top: 300px;">
		<h2 class="intro_title text-center"> 회원들의 일정</h2>
		
</div>

<div style="width:100%; height:500px; border: 0px solid red;" align="center">
<c:forEach items="${schedulevoList}" var="schedulevo">

<div class="col-lg-3 intro_col" style="float: left; width: 30%; height: 40%; margin-top: 40px;">

	<div class="intro_item">
		
		<div class="intro_item_overlay"></div>
		<!-- Image by https://unsplash.com/@dnevozhai -->
		
		<div class="intro_item_background" style="background-image:url(/finalproject/resources/images/city/${schedulevo.image})"></div>
			

		
		
		<div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
			
			<div class="intro_date"></div>
			<div class="button intro_button" id="btnWrite">
				<div class="button_bcg"></div>
				<a href="<%= request.getContextPath() %>/ScheduleDetail.action?seq=${schedulevo.seq_schedule}">상세일정 보기</a>
			</div>
			<div class="intro_center text-center">
				<div class="intro_price">${schedulevo.fk_userid} </div>
				</br>
				<div class="intro_price">${schedulevo.alldays} 일 간 </div>
				<h2><span style="color:white;font-weight: bold">${schedulevo.title}</span></h2>
				
				
				
				
			</div>
			
			<div class="intro_price">작성일 : ${schedulevo.registerday} </div>
			
			<div class="intro_date">출발일 : ${schedulevo.startday}</div>
			<div class="item active">
			
			</div>
		</div>
		
		
	</div>


</div>
</c:forEach>

</div>


<div style="width:100%; height:100px; border: solid 0px green;" align="center">
<!--  페이지바 보여주기  -->
<div class="pagebar" align="center" style="margin-top: 25px;">
	<span>
		<a>${pageBar}</a>
	</span>
</div>
</div>
</div>




