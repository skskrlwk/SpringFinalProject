<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Travelix</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/styles/bootstrap4/bootstrap.min.css">
<link href="<%= request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/styles/login_styles.css">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.2.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/styles/bootstrap4/popper.js"></script>
<script src="<%= request.getContextPath() %>/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%= request.getContextPath() %>/resources/plugins/easing/easing.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/custom.js"></script>
</head>

<body>

<div class="super_container">

	<!-- Header -->

	<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="social">
							<ul class="social_list">
								<li class="social_list_item"><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="user_box ml-auto">
							<c:if test="${sessionScope.loginuser == null}">
								<div class="user_box_login user_box_link"><a href="<%=request.getContextPath()%>/login.action">Login</a></div>
								<div class="user_box_register user_box_link"><a href="<%=request.getContextPath()%>/register.action">register</a></div>
							</c:if>
							
							<c:if test="${sessionScope.loginuser != null}">
								<div>
									<div class="user_box_myplan user_box_link"><%-- <a href="<%=request.getContextPath()%>/myInfoEdit.action"> --%>${sessionScope.loginuser.name} 님 환영합니다.&nbsp;</a></div>
									<%-- <div class="user_box_myplan user_box_link"><a href="<%=request.getContextPath()%>/mypage/mySchedules.action?userid=${sessionScope.loginuser.userid}">MyPlan&nbsp;</a></div> --%>
									<div class="user_box_edit user_box_link"><a href="<%=request.getContextPath()%>/myInfoEdit.action">Edit&nbsp;</a></div>
									<div class="user_box_logout user_box_link"><a href="<%=request.getContextPath()%>/logout.action">LogOut</a></div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>		
		</div>

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="<%= request.getContextPath() %>/index.action"><img src="<%= request.getContextPath() %>/resources/images/logo.png" alt="">STUBBY Planner</a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<c:if test="${sessionScope.loginuser != null}">
									<li class="main_nav_item"><a href="<%=request.getContextPath()%>/mypage/mySchedules.action">나의 플래너 보기</a></li>
								</c:if>
								<li class="main_nav_item"><a href="<%= request.getContextPath() %>/scheduleAdd.action">플래너 만들기</a></li>
								<!-- <li class="main_nav_item"><a href="#">추천플래너</a></li> -->
								<li class="main_nav_item"><a href="<%= request.getContextPath() %>/boardlist.action">게시판</a></li>
								<c:if test="${sessionScope.loginuser.userid eq 'admin'}">
									<li class="main_nav_item"><a href="<%= request.getContextPath() %>/memberList.action">회원관리</a></li>
									<li class="main_nav_item"><a href="<%= request.getContextPath() %>/adminRegister.action">여행정보관리</a></li>
								</c:if>
							</ul>
						</div>
					


						<form id="search_form" class="search_form bez_1">
							<input type="search" class="search_content_input bez_1">
						</form>

						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>
	
	<div class="menu trans_500">
		<div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
			<div class="menu_close_container"><div class="menu_close"></div></div>
			<div class="logo menu_logo"><a href="#"><img src="<%= request.getContextPath()%>/resources/images/logo.png" alt=""></a></div>
			<ul>
				<li class="menu_item"><a href="#">home</a></li>
				<li class="menu_item"><a href="about.html">플래너</a></li>
				<li class="menu_item"><a href="offers.html">추천플래너</a></li>
				<li class="menu_item"><a href="blog.html">게시판</a></li>
			</ul>
		</div>
	</div>
