<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.intro_item {
	margin: 150px;
	width: 110%;
	padding: 20px;
	margin-top: -100px;
	margin-bottom: 10px;
}

.intro_date {
	margin: auto;
	width: 100%;
	padding: 0px;
}

.section_title {
	margin: center;
	text-align: center;
}

.stu_list_wrap {
	width: -100%;
	height: 5px;
}

offer_name {
	size: 10pt;
}

div.pagebar {
	font-size: 20px;
}
</style>

<!-- Home -->

<div class="home">

	<!-- Home Slider -->

	<div class="home_slider_container">

		<div class="owl-carousel owl-theme home_slider">

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<!-- Image by https://unsplash.com/@anikindimitry -->
				<div class="home_slider_background"
					style="background-image:url(<%=request.getContextPath()%>/resources/images/home_slider.jpg)"></div>

				<div class="home_slider_content text-center">
					<div class="home_slider_content_inner" data-animation-in="flipInX"
						data-animation-out="animate-out fadeOut">
						<h1>discover</h1>
						<h1>the world</h1>
						<div class="button home_slider_button">
							<div class="button_bcg"></div>
							<a href="#">explore now<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image:url(<%=request.getContextPath()%>/resources/images/home_slider.jpg)"></div>

				<div class="home_slider_content text-center">
					<div class="home_slider_content_inner" data-animation-in="flipInX"
						data-animation-out="animate-out fadeOut">
						<h1>discover</h1>
						<h1>the world</h1>
						<div class="button home_slider_button">
							<div class="button_bcg"></div>
							<a href="#">explore now<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image:url(<%=request.getContextPath()%>/resources/images/home_slider.jpg)"></div>

				<div class="home_slider_content text-center">
					<div class="home_slider_content_inner" data-animation-in="flipInX"
						data-animation-out="animate-out fadeOut">
						<h1>discover</h1>
						<h1>the world</h1>
						<div class="button home_slider_button">
							<div class="button_bcg"></div>
							<a href="#">explore now<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Home Slider Nav - Prev -->
		<div class="home_slider_nav home_slider_prev">
			<svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="28px" height="33px" viewBox="0 0 28 33"
				enable-background="new 0 0 28 33" xml:space="preserve">
					<defs>
						<linearGradient id='home_grad_prev'>
							<stop offset='0%' stop-color='#fa9e1b' />
							<stop offset='100%' stop-color='#8d4fff' />
						</linearGradient>
					</defs>
					<path class="nav_path" fill="#F3F6F9"
					d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
					M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
					C22.545,2,26,5.541,26,9.909V23.091z" />
					<polygon class="nav_arrow" fill="#F3F6F9"
					points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
					11.042,18.219 " />
				</svg>
		</div>

		<!-- Home Slider Nav - Next -->
		<div class="home_slider_nav home_slider_next">
			<svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="28px" height="33px" viewBox="0 0 28 33"
				enable-background="new 0 0 28 33" xml:space="preserve">
					<defs>
						<linearGradient id='home_grad_next'>
							<stop offset='0%' stop-color='#fa9e1b' />
							<stop offset='100%' stop-color='#8d4fff' />
						</linearGradient>
					</defs>
				<path class="nav_path" fill="#F3F6F9"
					d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
				M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
				C22.545,2,26,5.541,26,9.909V23.091z" />
				<polygon class="nav_arrow" fill="#F3F6F9"
					points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
				17.046,15.554 " />
				</svg>
		</div>

		<!-- Home Slider Dots -->

		<div class="home_slider_dots">
			<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
				<li class="home_slider_custom_dot active"><div></div>01.</li>
				<li class="home_slider_custom_dot"><div></div>02.</li>
				<li class="home_slider_custom_dot"><div></div>03.</li>
			</ul>
		</div>

	</div>

</div>

<!-- Search -->

<div class="search">


	<!-- Search Contents -->

	<div class="container fill_height">
		<div class="row fill_height">
			<div class="col fill_height">

				<!-- Search Tabs -->

				<div class="search_tabs_container">
					<div
						class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div
							class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img
								src="<%=request.getContextPath()%>/resources/images/suitcase.png"
								alt=""><span>hotels</span>
						</div>
						<div
							class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img
								src="<%=request.getContextPath()%>/resources/images/bus.png"
								alt="">car rentals
						</div>
						<div
							class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img
								src="<%=request.getContextPath()%>/resources/images/departure.png"
								alt="">flights
						</div>
						<div
							class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img
								src="<%=request.getContextPath()%>/resources/images/island.png"
								alt="">trips
						</div>
						<div
							class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img
								src="<%=request.getContextPath()%>/resources/images/cruise.png"
								alt="">cruises
						</div>
						<div
							class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img
								src="<%=request.getContextPath()%>/resources/images/diving.png"
								alt="">activities
						</div>
					</div>
				</div>

				<!-- Search Panel -->

				<div class="search_panel active">
					<form action="#" id="search_form_1"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item">
							<div>destination</div>
							<input type="text" class="destination search_input"
								required="required">
						</div>
						<div class="search_item">
							<div>check in</div>
							<input type="text" class="check_in search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>check out</div>
							<input type="text" class="check_out search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>adults</div>
							<select name="adults" id="adults_1"
								class="dropdown_item_select search_input">
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<div class="search_item">
							<div>children</div>
							<select name="children" id="children_1"
								class="dropdown_item_select search_input">
								<option>0</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<button class="button search_button">
							search<span></span><span></span><span></span>
						</button>
					</form>
				</div>

				<!-- Search Panel -->

				<div class="search_panel">
					<form action="#" id="search_form_2"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item">
							<div>destination</div>
							<input type="text" class="destination search_input"
								required="required">
						</div>
						<div class="search_item">
							<div>check in</div>
							<input type="text" class="check_in search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>check out</div>
							<input type="text" class="check_out search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>adults</div>
							<select name="adults" id="adults_2"
								class="dropdown_item_select search_input">
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<div class="search_item">
							<div>children</div>
							<select name="children" id="children_2"
								class="dropdown_item_select search_input">
								<option>0</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<button class="button search_button">
							search<span></span><span></span><span></span>
						</button>
					</form>
				</div>

				<!-- Search Panel -->

				<div class="search_panel">
					<form action="#" id="search_form_3"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item">
							<div>destination</div>
							<input type="text" class="destination search_input"
								required="required">
						</div>
						<div class="search_item">
							<div>check in</div>
							<input type="text" class="check_in search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>check out</div>
							<input type="text" class="check_out search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>adults</div>
							<select name="adults" id="adults_3"
								class="dropdown_item_select search_input">
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<div class="search_item">
							<div>children</div>
							<select name="children" id="children_3"
								class="dropdown_item_select search_input">
								<option>0</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<button class="button search_button">
							search<span></span><span></span><span></span>
						</button>
					</form>
				</div>

				<!-- Search Panel -->

				<div class="search_panel">
					<form action="#" id="search_form_4"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item">
							<div>destination</div>
							<input type="text" class="destination search_input"
								required="required">
						</div>
						<div class="search_item">
							<div>check in</div>
							<input type="text" class="check_in search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>check out</div>
							<input type="text" class="check_out search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>adults</div>
							<select name="adults" id="adults_4"
								class="dropdown_item_select search_input">
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<div class="search_item">
							<div>children</div>
							<select name="children" id="children_4"
								class="dropdown_item_select search_input">
								<option>0</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<button class="button search_button">
							search<span></span><span></span><span></span>
						</button>
					</form>
				</div>

				<!-- Search Panel -->

				<div class="search_panel">
					<form action="#" id="search_form_5"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item">
							<div>destination</div>
							<input type="text" class="destination search_input"
								required="required">
						</div>
						<div class="search_item">
							<div>check in</div>
							<input type="text" class="check_in search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>check out</div>
							<input type="text" class="check_out search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>adults</div>
							<select name="adults" id="adults_5"
								class="dropdown_item_select search_input">
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<div class="search_item">
							<div>children</div>
							<select name="children" id="children_5"
								class="dropdown_item_select search_input">
								<option>0</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<button class="button search_button">
							search<span></span><span></span><span></span>
						</button>
					</form>
				</div>

				<!-- Search Panel -->

				<div class="search_panel">
					<form action="#" id="search_form_6"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item">
							<div>destination</div>
							<input type="text" class="destination search_input"
								required="required">
						</div>
						<div class="search_item">
							<div>check in</div>
							<input type="text" class="check_in search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>check out</div>
							<input type="text" class="check_out search_input"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="search_item">
							<div>adults</div>
							<select name="adults" id="adults_6"
								class="dropdown_item_select search_input">
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<div class="search_item">
							<div>children</div>
							<select name="children" id="children_6"
								class="dropdown_item_select search_input">
								<option>0</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<button class="button search_button">
							search<span></span><span></span><span></span>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Intro -->

<div class="intro">
	<div class="container">
		<div class="row">
			<div class="col">


				<h2 class="intro_title text-center">최근 추가된 회원들의 일정</h2>
				<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />


				<div class="button intro_button" id="btnWrite">
					<div class="button_bcg"></div>
					<a
						href="<%=request.getContextPath()%>/otherview.action">
						여행자들의 일정 더보기</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10 offset-lg-1"
				style="float: center; width: 30%; height: 20%; margin-top: 0px;">
				<div class="intro_text text-center"></div>
			</div>
		</div>
		
		<div style="width: 100%; height: 500px; border: 0px solid red;">
		<div class="row intro_items" style="border: 0px solid green;" align="center">
			<c:forEach var="trapvo" items="${traplist}" varStatus="status">

				<c:if test="${trapvo.seq_schedule == 0}">
					<li data-target=".row intro_items"
						data-slide-to="${trapvo.seq_schedule}" class="active"></li>
					<h3>등록된 회원일정이 없습니다.</h3>
				</c:if>
				<div class="col-lg-3 intro_col" style="float: left; width: 30%; height: 40%; margin-top: 40px; border: 0px solid black;"> 

					<div class="intro_item" style="border: 0px solid blue; margin-right: 100px; "  >

						<div class="intro_item_overlay"></div>
						<!-- Image by https://unsplash.com/@dnevozhai -->

						<div class="intro_item_background"
							style="background-image:url(/finalproject/resources/images/city/${trapvo.cityImg})"></div>
						
						<div class="intro_item_content d-flex flex-column align-items-center justify-content-center">

							<div class="intro_date"></div>
							<div class="button intro_button" id="btnWrite">
								<div class="button_bcg"></div>
								<a href="<%=request.getContextPath()%>/ScheduleDetail.action?seq=${trapvo.SEQ_SCHEDULE}">상세일정
									보기 </a>
							</div>
							<div class="intro_center text-center">
								<div class="intro_price">${trapvo.FK_USERID}</div>
								<div class="intro_price">${trapvo.ALLDAYS}일 간</div>
								<h2>
									<span style="color: white; font-weight: bold">${trapvo.TITLE}</span>
								</h2>

							</div>

							<div class="intro_price">작성일 : ${trapvo.REGISTERDAY}</div>

							<div class="intro_date" style="text-align: center;">출발일 :
								${trapvo.STARTDAY}</div>
							<div class="item active"></div>
						</div>

					</div>


				</div>

			</c:forEach>
		</div>
		</div>
	</div>





</div>


<!-- Offers -->

<div class="offers">
	<div class="container">
		<div class="row">
			<div class="col text-center">
			
			
				<h2 class="section_title">미리 예약해야 이득, 유럽 필수투어들!</h2>

			</div>
		</div>


		<div class="row offers_items">
		
		<c:forEach var="trapvo2" items="${traplist2}">

			<!-- Offers Item -->
			<div class="col-lg-6 offers_col">
				<div class="offers_item">
					<div class="row">
						<div class="col-lg-6">
						
						
							<div class="offers_image_container">
								<!-- Image by Egzon Bytyqi -->
								
							<!-- style="background-image:url(/finalproject/resources/images/${trapvo.IMAGE}) -->	
								<div class="offers_image_background" style="background-image:url(/finalproject/resources/images/city/${trapvo2.IMAGE1})"></div>
								<div class="offer_name">
									<a
										href= "${trapvo2.ADDR}"> <!-- "http://www.stubbyplanner.com/market/index_thema_n.asp?themaserial=13&l=home" -->${trapvo2.NAME1}</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="offers_content">
								<div class="offers_price">
									${trapvo2.PRICE}<span>원</span>
								</div>
								<div class="rating_r rating_r_4 offers_rating">
									
								</div>
								<p class="offers_text"><span style="font-style: italic;">${trapvo2.NAME}</span></p>
								
								
								<div class="offers_icons">
								<%-- 	<ul class="offers_icons_list">
										<li class="offers_icons_item"><img
											src="<%=request.getContextPath()%>/resources/images/post.png"
											alt=""></li>
										<li class="offers_icons_item"><img
											src="<%=request.getContextPath()%>/resources/images/compass.png"
											alt=""></li>
										<li class="offers_icons_item"><img
											src="<%=request.getContextPath()%>/resources/images/bicycle.png"
											alt=""></li>
										<li class="offers_icons_item"><img
											src="<%=request.getContextPath()%>/resources/images/sailboat.png"
											alt=""></li>
									</ul> --%>
								</div>
								<div class="offers_link">
									<a
										href="${trapvo2.ADDR}">상세보기</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>


		</c:forEach>



		</div>


		<!-- Offers Item -->


	</div>

	<!--  페이지바 보여주기  -->
	<%-- 	<div class="pagebar" align="center"
			style="width: 110%; margin-top: 50px; margin-left: -150px; margin-right: auto; margin-top: 300px; text-size: 100%;">
			<span>${pageBar}</span>
			</div> --%>
</div>



<!-- Testimonials -->

<div class="testimonials">
	<div class="test_border"></div>
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="section_title">Best Plan Top 5 !!</h2>
			</div>
		</div>
		<div class="row">
			<div class="col">

				<!-- Testimonials Slider -->

				<div class="test_slider_container">
					<div class="owl-carousel owl-theme test_slider">

						<c:forEach var="likerankvo" items="${likeranklist}" varStatus="status">

							<c:if test="${likerankvo.SEQ_SCHEDULE == 0}">
								<li data-target=".row intro_items"
									data-slide-to="${likerankvo.SEQ_SCHEDULE}" class="active"></li>
								<h3>등록된 회원일정이 없습니다.</h3>
							</c:if>
							
							<div class="owl-item">
							<div class="test_item">
								<div class="test_image">
									<img
										src="<%=request.getContextPath()%>/resources/images/city/${likerankvo.cityImg}"
										style="height: 500px;">
								</div>
								<div class="test_icon">
									<img
										src="<%=request.getContextPath()%>/resources/images/bestlike${status.count}.png"
										style="height: 70px; width: 70px;">
								</div>		
								<div class="test_content_container">
									<div class="test_content">
										<div class="test_item_info">
											<div class="test_name">${likerankvo.FK_USERID}</div>
											<div class="test_date">${likerankvo.REGISTERDAY}</div>
										</div>
										<div class="button intro_button" id="btnWrite">
											<div class="button_bcg"></div>
											<a href="<%=request.getContextPath()%>/ScheduleDetail.action?seq=${likerankvo.SEQ_SCHEDULE}">상세일정
												보기 </a>
										</div>
										<div class="intro_center text-center">
											<div class="intro_price">${likerankvo.FK_USERID}</div>
											<div class="intro_price" style="margin-top: 5px;">${likerankvo.ALLDAYS}일 간</div>
											<h2>
												<span style="color: white; font-weight: bold; font-size: 30px;">${likerankvo.TITLE}</span>
											</h2> 
			
										</div>
			
										<div class="intro_date" style="text-align: center;">출발일 :
											${likerankvo.STARTDAY}</div>
										<div class="item active"></div>
									</div>
								</div>
							</div>
						</div>		
							
			
						</c:forEach>

					</div>

					<!-- Testimonials Slider Nav - Prev -->
					<div class="test_slider_nav test_slider_prev">
						<svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="28px" height="33px" viewBox="0 0 28 33"
							enable-background="new 0 0 28 33" xml:space="preserve">
								<defs>
									<linearGradient id='test_grad_prev'>
										<stop offset='0%' stop-color='#fa9e1b' />
										<stop offset='100%' stop-color='#8d4fff' />
									</linearGradient>
								</defs>
								<path class="nav_path" fill="#F3F6F9"
								d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
								M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
								C22.545,2,26,5.541,26,9.909V23.091z" />
								<polygon class="nav_arrow" fill="#F3F6F9"
								points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
								11.042,18.219 " />
							</svg>
					</div>

					<!-- Testimonials Slider Nav - Next -->
					<div class="test_slider_nav test_slider_next">
						<svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="28px" height="33px" viewBox="0 0 28 33"
							enable-background="new 0 0 28 33" xml:space="preserve">
								<defs>
									<linearGradient id='test_grad_next'>
										<stop offset='0%' stop-color='#fa9e1b' />
										<stop offset='100%' stop-color='#8d4fff' />
									</linearGradient>
								</defs>
							<path class="nav_path" fill="#F3F6F9"
								d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
							M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
							C22.545,2,26,5.541,26,9.909V23.091z" />
							<polygon class="nav_arrow" fill="#F3F6F9"
								points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
							17.046,15.554 " />
							</svg>
					</div>

				</div>

			</div>
		</div>

	</div>
</div>

<div class="trending">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="section_title">인기 있는 호텔</h2>
			</div>
		</div>
		<div class="row trending_container">

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_1.png"
							alt="https://unsplash.com/@fransaraco">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">grand hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_2.png"
							alt="https://unsplash.com/@grovemade">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">mars hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_3.png"
							alt="https://unsplash.com/@jbriscoe">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">queen hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_4.png"
							alt="https://unsplash.com/@oowgnuj">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">mars hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_5.png"
							alt="https://unsplash.com/@mindaugas">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">grand hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_6.png"
							alt="https://unsplash.com/@itsnwa">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">mars hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_7.png"
							alt="https://unsplash.com/@rktkn">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">queen hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

			<!-- Trending Item -->
			<div class="col-lg-3 col-sm-6">
				<div class="trending_item clearfix">
					<div class="trending_image">
						<img
							src="<%=request.getContextPath()%>/resources/images/trend_8.png"
							alt="https://unsplash.com/@thoughtcatalog">
					</div>
					<div class="trending_content">
						<div class="trending_title">
							<a href="#">mars hotel</a>
						</div>
						<div class="trending_price">From $182</div>
						<div class="trending_location">madrid, spain</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="contact">
	<div class="contact_background"
		style="background-image:url(<%=request.getContextPath()%>/resources/images/contact.png)"></div>

	<div class="container">
		<div class="row">
			<div class="col-lg-5">
				<div class="contact_image"></div>
			</div>
			<div class="col-lg-7">
				<div class="contact_form_container">
					<div class="contact_title">get in touch</div>
					<form action="#" id="contact_form" class="contact_form">
						<input type="text" id="contact_form_name"
							class="contact_form_name input_field" placeholder="Name"
							required="required" data-error="Name is required."> <input
							type="text" id="contact_form_email"
							class="contact_form_email input_field" placeholder="E-mail"
							required="required" data-error="Email is required."> <input
							type="text" id="contact_form_subject"
							class="contact_form_subject input_field" placeholder="Subject"
							required="required" data-error="Subject is required.">
						<textarea id="contact_form_message"
							class="text_field contact_form_message" name="message" rows="4"
							placeholder="Message" required="required"
							data-error="Please, write us a message."></textarea>
						<button type="submit" id="form_submit_button"
							class="form_submit_button button">
							send message<span></span><span></span><span></span>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
