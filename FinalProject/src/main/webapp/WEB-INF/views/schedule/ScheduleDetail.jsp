<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">


	body {font-family: Arial;}
	
	tbody{ text-align: center;}
	#msgShow{ margin-top: 10px; margin-bottom: 10px; margin-left: 20px;}
		
	/* Style the tab */
	.tab {
	    overflow: hidden;
	    border: 1px solid #ccc;	    
	    background-color: white;
	    border-radius: 10px;	    
	}
	
	/* Style the buttons inside the tab */
	.tab button {
	    background-color: inherit;
	    float: left;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    padding: 14px 16px;
	    transition: 0.3s;
	    font-size: 16px;	    
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	    background-color: #ddd;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	    background-color: #ccc;
	}
	
	/* Style the tab content */
	.tabcontent {
	    display: none;
	    padding: 6px 12px;
	    border: 1px solid #ccc;
	    border-top: none;
	    border-radius: 10px;
	}	
		
		
	.fc-content {
		color: white;
	}	
</style>


<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-1.12.4.min.js"></script> 
<%--jquery 1.x 또는 jquery 2.x 를 사용해야만 한다. 구글맵은 jquery 3.x 을 사용할 수 없다. --%>


<link href='<%= request.getContextPath() %>/resources/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/resources/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='<%= request.getContextPath() %>/resources/fullcalendar/moment.min.js'></script>
<script src='<%= request.getContextPath() %>/resources/fullcalendar/fullcalendar.min.js'></script>

<%-- 구글맵 api 사용하기  --%>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAN1u0QKuXwWnK1gudrHyVyteYGG5Hx5hg"></script>

<script type="text/javascript">
	
	$(document).ready(function () {
		document.getElementById("defaultOpen").click(); 		
		google.maps.event.addDomListener(window, 'load', initialize);
		calendar();	
		
$("#likecnt").html("${likecnt}");
		
		$("#btnLike").click(function(){
			
			var seq_scheduler = ${show_schedulerList2.a_fk_schedule};
			
			form_data = {seq_schedule : seq_scheduler};
			
			$.ajax({
				
				url: "<%= request.getContextPath() %>/likeJSON.action",
				type: "GET",
				data: form_data,
				dataType: "JSON",
				success: function(json){
					
					var likeNoLoginMSG = json.likeNoLoginMSG;
					
					if(likeNoLoginMSG == 1) {
						alert("로그인 후 이용해 주세요!!");
					}
					else {
						var checklike = json.checklike;
						var addlike = json.addlike;
						var likecnt = json.likecnt;
						
						
						if(checklike == 1){
							alert("이미 좋아요를 하셨습니다!!");
						}
						if(addlike == 1){
							alert("좋아요 클릭 완료!! 다른 일정도 부탁드려요~");
						}
						$("#likecnt").html(likecnt);
						
					}
								
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
				
			});// end of $.ajax()-------------------------------
			
		});
	});



	
	
	function openCity(evt, cityName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}	
	
	
	function tour_info(seq_tourlist, Tourtitle) {
	 // alert(seq_tourlist);			
		form_data = {seq_tourlist : seq_tourlist};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/detail_tourlist.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
				
				$("#modal-title").empty();
				$("#modal-title").html("<h3>"+Tourtitle+"</h3>");
				
				$("#modal_info").empty();
			  								
				var html = "<h2>"+data[0].a_name+"</h2><br/>";					
					html+= "<img src='/finalproject/resources/images/place/"+data[0].a_image+"' width='600' height='345 style='margin-bottom: 20px;' >";
			 		html+= "<hr>";
			 		html+= "<div style='text-align: left; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;'>";
			 		html+= "	<span style='font-size: 12pt; font-weight: bold; text-align: left;'>"+data[0].a_name+"</span><br/>";
					html+= "	<span style='text-align: left; width: 200px;'>"+data[0].a_comments+"</span>";				
					html+= "</div>";
					html+= "<hr>";
			 		html+= "<div style='font-size: 12pt; font-weight: bold; text-align: left; margin-left: 30px; margin-bottom: 20px;  '>";	 
			 		html+= "	<span>관련 투어</span><br/>";				
					html+= "</div>"; 
					html+= "<div align='left' style='margin-left: 30px;'>"; 
				
					html+= "<div style='overflow-x: auto; white-space: nowrap; '>";
					
				$.each(data, function(entryIndex, entry){
		//			html+= "	<div style='display: inline-block;'	> "; 
					html+= "	<div align='left' style='width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;  text-align: center;'>"; 
					html+= "		<img src='/finalproject/resources/images/tour/"+entry.b_image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px;' onclick='tourSite(\""+entry.b_addr+"\");'><br/>";
		//			html+= "		<div style='text-align:center'>";
					html+= "			<span>"+entry.b_name+"</span>";							
		//			html+= "		</div>";
					html+= "	</div>";
				});
		 	
					html+= "</div>";
										
					$("#modal_info").html(html);
				
				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		});		
		
	}// end of tour_info(category)-----------------
	
	
	function food_info(seq_food, Foodtitle) {
		// alert(seq_food);
		
		form_data = {seq_food : seq_food};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/detail_food.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
				
				$("#modal-title").empty();
				$("#modal-title").html("<h3>"+Foodtitle+"</h3>");
				
				$("#modal_info").empty();
		
				var html = "<h2>"+data[0].a_name+"</h2><br/>";					
					html+= "<img src='/finalproject/resources/images/food/"+data[0].a_image+"' width='600' height='345 style='margin-bottom: 20px;' >";
			 		html+= "<hr>";
			 		html+= "<div style='text-align: left; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;'>";
			 		html+= "	<span style='font-size: 12pt; font-weight: bold;'>"+data[0].a_name+"</span><br/>";
					html+= "	<span>"+data[0].a_comments+"</span>";	
			 		html+= "</div>";
			 		html+= "<hr>";			 						
			 		html+= "<div style='font-size: 12pt; font-weight: bold; text-align: left; margin-bottom: 20px;  margin-left: 30px;'>";	 
			 		html+= "	<span>음식점</span><br/>";				
					html+= "</div>";				
				
					html+= "<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>";
				$.each(data, function(entryIndex, entry){					
					
		//			html+= "	<div style='display: inline-block; text-align: left; width: 160px; vertical-align:top; margin-right: 60px;' >"
					html+= "	<div align='left' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>"; 
					html+= "		<img src='/finalproject/resources/images/restaurant/"+entry.b_image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px; '><br/>";
					html+= "		<span style='font-size: 12pt; font-weight: bold;'>"+entry.b_name+"</span><br/>";	
					html+= "		<span style='font-weight: bold;'>운영시간</span> <br/><span>"+entry.b_worktime+"</span><br/>";						
					html+= "		<span style='font-weight: bold;'>주소 :&nbsp;</span><span style='white-space: pre-line;'>"+entry.b_addr+"</span>";	
					html+= "	</div>";	
					
										
				});
									
					html+= "</div>";
				//	html+= "</div>";
				
				$("#modal_info").html(html);

			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		});			
	}// end of food_info(seq_food)-----------------
	
	
	
	function shopping_info(seq_shop, Shoptitle, fk_category) {		
	//	alert(seq_shop);	
		
		form_data = {seq_shop : seq_shop};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/detail_shop.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
				
				$("#modal-title").empty();
				$("#modal-title").html("<h3>"+Shoptitle+"</h3>");
				
				$("#modal_info").empty();
												
				var html = "<h2>"+data[0].name+"</h2><br/>";					
					html+= "<img src='/finalproject/resources/images/shop/"+data[0].image+"' width='600' height='345 style='margin-bottom: 20px;' >";
			 		html+= "<hr>";			
			 		html+= "<div style='text-align: left; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;'>";
			 		html+= "	<span style='font-size: 12pt; font-weight: bold; text-align: left;'>"+data[0].name+"</span><br/>";
					html+= "	<span style='text-align: left; width: 200px;'>"+data[0].comments+"</span>";				
					html+= "</div>";		
					html+= "	<hr>";
					html+= "<div style='font-size: 12pt; font-weight: bold; text-align: left; margin-bottom: 20px;  margin-left: 30px;'>";	 
			 		html+= "	<span>매장</span><br/>";	
			 		
			 		form_data2 = {fk_category : fk_category};
			 		$.ajax({
			 			
			 			url:"<%=request.getContextPath()%>/detail_shop2.action",
						type : "GET",
						data : form_data2,
						dataType : "JSON", 
						success: function(data){
														
							html+= "<div align='left' style='margin-left: 20px;'>";
							html+= "<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>";
							$.each(data, function(entryIndex, entry){
														
								html+= "	<div align='left' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>"; 
								html+= "		<img src='/finalproject/resources/images/shop/"+entry.image+"' align='left' class='img-rounded' width='150' height='200' ><br/>";
								html+= "		<span style='font-size: 12pt; font-weight: bold;'>"+entry.name+"</span><br/>";					
								html+= "		<span style='font-weight: bold;'>운영시간</span><br/><span>"+entry.worktime+"</span><br/>";	
								html+= "		<span style='font-weight: bold;'>주소 :&nbsp;</span><span style='white-space: pre-line;'>"+entry.addr+"</span>";					
								html+= "	</div>";
							});
							html+= "</div>";
							
							$("#modal_info").html(html);
						},
						error: function(request, status, error){
					        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					    }
							
			 		});
			 		
					html+= "</div>";

			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		});			
		
	}// end of shopping_info(seq_shop)-----------------
	
	
	function tourSite(addr) {		
		
		window.open(addr);
		
	}
	
	
	function update_scheduler() {
					
		var seq_scheduler = ${show_schedulerList2.a_seq_scheduler};
		var transferEdit = $("#transferEdit").val();
		var scheduleEdit = $("#scheduleEdit").val();
							 	
		form_data = {seq_scheduler : seq_scheduler,
					 transferEdit : transferEdit,
					 scheduleEdit : scheduleEdit}; 
		
		$.ajax({
			url:"<%=request.getContextPath()%>/update_scheduler.action",
			type : "POST",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
								
				var html = "<button type='button' class='btn' style='width: 50px; height: 30px;'  onClick='editScheduler2()' >수정</button>"; 
				
				$("#transferMemo").html(data.transfer);
				$("#scheduleMemo").html(data.schedule);
				$("#editBtn").html(html); 
				
				$("#transferEdit").val(transferEdit);
				$("#scheduleEdit").val(scheduleEdit);				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    } 
			
		});		
		 	
	}
	
	function cancel() {
		
		$("#transferMemo").empty();
		$("#scheduleMemo").empty();
		$("#editBtn").empty();
		
		var v_transfer =  $("#transfer").val();
		var v_schedule =  $("#schedule").val();
										
		var html3 = "<button type='button' class='btn' style='width: 50px; height: 30px;'  onClick='editScheduler2()' >수정</button>";
		 											
		$("#transferMemo").html(v_transfer);
		$("#scheduleMemo").html(v_schedule);
		$("#editBtn").html(html3);
		
		$("#transfer").empty();
		$("#schedule").empty();
			
	}
	
	// 일정표2 수정
	function editScheduler2() {	

		$("#transfer").val('${show_schedulerList2.a_transfer}');
		$("#schedule").val('${show_schedulerList2.a_schedule}');
																
		$("#transferMemo").empty();
		$("#scheduleMemo").empty();
		$("#editBtn").empty();
		
		var transfer = '${show_schedulerList2.a_transfer}';
	    var schedule = '${show_schedulerList2.a_schedule}';
	
	    var transfer = transfer.replace(/<br>/gi, "&#10;"); 		
		var schedule = schedule.replace(/<br>/gi, "&#10;"); 		
	
		
		var html1 = "<textarea id='transferEdit' name='transfer' style='resize:none; width: 95%; height: "+${length*50}+"px;'>"+transfer+"</textarea>";
		
		var	html2 = "<textarea id='scheduleEdit' name='schedule' style='resize:none; width: 95%; height: "+${length*50}+"px;'>"+schedule+"</textarea>";
		
		var html3 = "<button type='button' class='btn' style='width: 50px; height: 30px;'  onClick='update_scheduler();' >확인</button>&nbsp;&nbsp;";
		 	html3 +="<button type='button' class='btn' style='width: 50px; height: 30px;'  onClick='cancel();' >취소</button>";
								
		$("#transferMemo").html(html1);
		$("#scheduleMemo").html(html2);
		$("#editBtn").html(html3);
		
	}// end of editScheduler2() ---------------
		

	function initialize() {
		// 구글 맵 옵션 설정
		var mapOptions = { 
	        zoom : 4 , // 기본 확대율
	        center : new google.maps.LatLng(47.008928, 5.885228), // 지도 중앙 위치
	        disableDefaultUI : false,  // 기본 UI 비활성화 여부
	        // scrollwheel : true,        // 마우스 휠로 확대, 축소 사용 여부
	        zoomControl : true,        // 지도의 확대/축소 수준을 변경하는 데 사용되는 "+"와 "-" 버튼을 표시
	        mapTypeControl : true,     // 지도 유형 컨트롤은 드롭다운이나 가로 버튼 막대 스타일로 제공되며, 사용자가 지도 유형(ROADMAP, SATELLITE, HYBRID 또는 TERRAIN)을 선택할 수 있다. 이 컨트롤은 기본적으로 지도의 왼쪽 위 모서리에 나타난다.
	        // streetViewControl : true,  // 스트리트 뷰 컨트롤에는 지도로 드래그해서 스트리트 뷰를 활성화할 수 있는 펙맨 아이콘이 있다. 기본적으로 이 컨트롤은 지도의 오른쪽 아래 근처에 나타난다.
	        // scaleControl: true,        // 배율 컨트롤은 지도 배율 요소를 표시한다. 이 컨트롤은 기본적으로 비활성화되어 있다.
	        styles: [{"elementType": "geometry","stylers": [ {"color": "#ffffff"} ] }, {"elementType": "labels.icon","stylers": [ {"color": "#e5e5e5"},	{"visibility": "off"} ] }, { "elementType": "labels.text.fill", "stylers": [ {"color": "#c3c3c3"} ] }, {"featureType": "administrative", "elementType": "geometry", "stylers": [ { "visibility": "off" } ] },  { "featureType": "administrative.land_parcel", "stylers": [ {"visibility": "off"} ] }, {"featureType": "administrative.locality", "stylers": [ {"visibility": "simplified"} ] }, {"featureType": "administrative.neighborhood", "stylers": [ {"visibility": "off"} ] },	{"featureType": "poi", "stylers": [ {"visibility": "off" } ]	}, {"featureType": "road", "stylers": [ {"visibility": "off"} ] }, {"featureType": "transit", "stylers": [ {"visibility": "off"} ] }, {	"featureType": "water",	"elementType": "geometry", "stylers": [	{"color": "#c8f3f9"} ] },  { "featureType": "water", "elementType": "labels.text","stylers": [{"visibility": "off"} ]  } ]  
			// 구글맵 스타일 변경

	    };
	    // 구글맵 옵션내역 사이트 아래 참조 
	    // https://developers.google.com/maps/documentation/javascript/reference#MapOptions
	 
	    var targetmap = new google.maps.Map(document.getElementById('googleMap'), mapOptions);  
		// 구글 맵을 사용할 타겟
		// !!! 주의 !!!  document.getElementById('googleMap') 라고 해야지
		//              $("#googleMap") 이라고 하면 지도가 나타나지 않는다.
	 
				
	    google.maps.event.addDomListener(window, "resize", function() {
	        var center = targetmap.getCenter();
	        google.maps.event.trigger(targetmap, "resize");
	        map.setCenter(center); 
	        
	    });
		
	    
		var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
	    
		var flightPlanCoordinates = ${ScheduleMap.imagearr};
		var flightPath = new google.maps.Polyline({
	    	  path: flightPlanCoordinates,
			  icons: [{
			      icon: lineSymbol,
			      offset: '100%'
			  }],
			  strokeColor: '#696969',
			  strokeOpacity: 0.9,
			  strokeWeight: 2

	    });

	    flightPath.setMap(targetmap);

		
	} // end of function initialize()--------------------------------
	
	// 날짜데이터를 문자열(yyyy-mm-dd)로 변경하는 함수
	function to_charDate(date) {
		var year = date.getFullYear();
		
		var month = date.getMonth() + 1;
		if(month < 10){
			month = "0"+ month;
		}
		
		var day = date.getDate();
		if(day < 10){
			day = "0"+ day; 
		}
		return year+"-"+month+"-"+day;
	}
	
	// 날짜 더하기
	function addDay(date,days) {
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if(month < 10){
			month = "0"+ month;
		}
		var day = date.getDate() + days;
		if(day < 10){
			day = "0"+ day; 
		}
		return year+"-"+month+"-"+day;
				
	}
	// 날짜 더하고 뺴기
	function dateAddDel(sDate, nNum, type) {
	    var yy = parseInt(sDate.substr(0, 4), 10);
	    var mm = parseInt(sDate.substr(5, 2), 10);
	    var dd = parseInt(sDate.substr(8), 10);
	    
	    if (type == "d") {
	        d = new Date(yy, mm - 1, dd + nNum);
	    }
	    else if (type == "m") {
	        d = new Date(yy, mm - 1 + nNum, dd);
	    }
	    else if (type == "y") {
	        d = new Date(yy + nNum, mm - 1, dd);
	    }
	 
	    yy = d.getFullYear();
	    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
	    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
	 
	    return '' + yy + '-' +  mm  + '-' + dd;
	}
	
	
	function calendar() {
		
		var eventsArr = [];
		var contextPath = "<%= request.getContextPath() %>";		
		var Day = new Date("${ScheduleMap.startday}"); // 출발날짜
		var startDay = to_charDate(Day);
		var startDay2; // 다른 나라 이동 날짜
		
	 	<c:forEach items="${calList}" var="cal" varStatus="status">
	 		
 			if("${status.index}" == "0"){ // 처음 반복문이 실행될때
 				
 				if("${cal.days}" == "0"){	// 처음들어온 나라의 체류일이 0일일떄
 					var city = "${cal.name}";
 					
 					var days = ${cal.days};
 		 		//	var endday = addDay(Day,days);
 		 			var endday = dateAddDel(startDay, days, 'd');
 		 		//	startDay2 = to_Date(endday);
 		 			startDay2 = endday;
 		 			console.log("${status.index}.start Day:" + startDay2);
 		 			console.log("${status.index}.endday:" + endday);
 			 		var str = {
 					            title: '<img src="'+contextPath+'/resources/images/flag/${cal.flag}" style="width:15px;height:11px"> '+ city ,
 					            start: startDay,
 						        end: endday,
 					            color: '#51bec9'
 					          }
 					eventsArr.push(str);
 				}else {		// 처음들어온 나라의 체류일이 0일이 아닐때
 					var city = "${cal.name}";
 					var days = ${cal.days} + 1;
 		 		//	var endday = addDay(Day,days);
 		 			var endday = dateAddDel(startDay, days, 'd');
 		 		//	startDay2 = to_Date(endday);
 		 			startDay2 = endday;
 			 		var str = {
 					            title: '<img src="'+contextPath+'/resources/images/flag/${cal.flag}" style="width:15px;height:11px"> '+ city ,
 					            start: startDay,
 						        end: endday,
 					            color: '#51bec9'
 					          }
 					eventsArr.push(str);
 					
 				}
	 		}
	 		
	 		if("${status.index}" != "0"){ // 반복문이 첫번쨰가 아닐떄
	 			var ifvar = startDay2;
	 		
	 			if(ifvar == startDay){ // 이전의 나라의 체류일이 0일일때 
	 				var city = "${cal.name}";
		 		//	var endday = addDay(startDay2,${cal.days});
		 			var endday = dateAddDel(startDay, ${cal.days}, 'd');
		 		//	startDay2 = addDay(startDay2, 0);
		 			startDay2 = dateAddDel(ifvar, ${cal.days}, 'd');
		 			var str = {
				            title: '<img src="'+contextPath+'/resources/images/flag/${cal.flag}" style="width:15px;height:11px"> '+ city ,
				            start: startDay2,
						    end: endday,
				            color: '#51bec9'
				          }	
		 			
		 		//	startDay2 = to_Date(endday);
		 			startDay2 = endday;
					eventsArr.push(str);
	 				
	 			}else{ //  이전의 나라의 체류일이 0일 이상일때
	 				var city = "${cal.name}";
		 		//	var endday = addDay(startDay2,${cal.days});
		 			var endday = dateAddDel(startDay2, ${cal.days}, 'd');
		 		//	startDay2 = addDay(startDay2, -1);
		 			startDay2 = dateAddDel(startDay2, -1, 'd');
		 			var str = {
				            title: '<img src="'+contextPath+'/resources/images/flag/${cal.flag}" style="width:15px;height:11px"> '+ city ,
				            start: startDay2,
						    end: endday,
				            color: '#51bec9'
				          }	
		 			
		 		//	startDay2 = to_Date(endday);
		 			startDay2 = endday;
					eventsArr.push(str);
	 			}
	 			
	 		}
	 		
		</c:forEach> 
		console.log(eventsArr);
		jQuery('#calendar').fullCalendar({
		      
			  header: {
			  	  left: 'prev',
				  center: 'title',
				  right: 'next'
			  },
			  
			  buttonIcons: true,
			  defaultDate: startDay,
		      editable: false,
		      eventLimit: false, // allow "more" link when too many events
		      lang:'ko',
		      weekNumbers: false,
	
		      
		      events: eventsArr,
			  eventRender: function (event, element) {
				    element.find('.fc-content').html(event.title);
			  }

		    });
			
		$(".fc-button-prev").html("<");
		$(".fc-button-next").html(">");

	}
	
	
	function editTourlist() {
		var fk_category = "";
		
		<c:forEach var="cal" items="${calList}" varStatus='status'>
			<c:if test="${status.index == 0}">
				fk_category += ${cal.fk_category};
			</c:if>
			<c:if test="${status.index != 0}">
				fk_category += ","+${cal.fk_category};
			</c:if>
			
		</c:forEach>
		
		//alert(fk_category);
		var seq_tourlist = "";
		<c:forEach var="tourList" items="${show_tourList}" varStatus='status'>
			<c:if test="${status.index == 0}">
			seq_tourlist += ${tourList.seq_tourlist};
			</c:if>
			<c:if test="${status.index != 0}">
			seq_tourlist += ","+${tourList.seq_tourlist};
			</c:if>			
		</c:forEach>
		
		var seq_tourlistArr = seq_tourlist.split(",");		
	//	alert("배열크기 : " + seq_tourlistArr.length);
	//	alert(seq_tourlistArr[0]);
	//	alert(seq_tourlistArr[1]);
	//	alert(seq_tourlistArr[2]);
	//	alert(fk_category);
			
		form_data = {fk_category : fk_category};
					
		$.ajax({
			url:"<%=request.getContextPath()%>/editTourlist.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
								
				$("#modal_info").empty();
				
				var html = "<h3>명소 선택</h3>";
					html +="<span>인기있는 명소를 선택해보세요!</span><hr/>";
					
				
				$.each(data, function(entryIndex, entry){
				
					var flag = 0;
					 for(i=0; i<seq_tourlistArr.length; i++){
						if(seq_tourlistArr[i] == entry.seq_tourlist){
							flag = 1;
							
						}// end of if
						
					}// end of for
					
					if(flag == 0) { 
						html+= "<div align='left' style='width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;  text-align: center;'>"; 
						html+= "	<label for='tourlistChk"+entryIndex+"'>";
						html+= "		<input type='checkbox' name='tourlistChk' id='tourlistChk"+entryIndex+"' value='"+entry.seq_tourlist+"'/>";				
						html+= "		<input type='hidden' name='tourlist_seq' id='tourlist_seq"+entryIndex+"' value='"+entry.fk_category+"'/>";	
						html+= "		<img src='/finalproject/resources/images/place/"+entry.image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px; '><br/>";
						html+= "	</label>";
						html+= "	<span>"+entry.name+"</span>";				
						html+= "</div>";
					}
													
					
				});
		 		
			
				html +="<br/><button type='button' class='btn' style='margin-top:30px; width: 60px; height: 30px; font-size: 10pt;' onClick='addTourlist();'>추가</button>";
				html +="<button type='button' class='btn' data-dismiss='modal' style='width: 60px; height: 30px; margin-top:30px; margin-left:30px; font-size: 10pt;'>취소</button>";
				
				$("#modal_info").html(html);
				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
						
		});
		
	
 	
 }// end of editTourlist()---------

 	// 명소 추가하기
	function addTourlist() {
		
	var seq = "";
	var fk = "";
	 $('input:checkbox[name=tourlistChk]').each(function () {
		if($(this).is(':checked')){
			seq += ","+($(this).val());
			fk += "," + ($(this).next().val());
		}
		
	});
	
		 
	// $("#tourinput").val(seq.substring(1));
	// $("#fkinput").val(fk.substring(1));
 	
	var frm = document.editFrm;
	frm.imgseq.value = seq.substring(1);
	frm.fk_category.value = fk.substring(1);
	frm.category.value = "tbl_tourlist";
	frm.method = "post";
	frm.action = "<%= request.getContextPath() %>/editDetail2.action";
	frm.submit();
 	}// end of addTourlist() -----------------
 	
 	
 	
 	function editFood() {
		var fk_category = "";
		
		<c:forEach var="cal" items="${calList}" varStatus='status'>
			<c:if test="${status.index == 0}">
				fk_category += ${cal.fk_category};
			</c:if>
			<c:if test="${status.index != 0}">
				fk_category += ","+${cal.fk_category};
			</c:if>
			
		</c:forEach>
		
	//	alert(fk_category);
		var seq_food = "";
		<c:forEach var="foodList" items="${show_foodList}" varStatus='status'>
			<c:if test="${status.index == 0}">
			seq_food += ${foodList.seq_food};
			</c:if>
			<c:if test="${status.index != 0}">
			seq_food += ","+${foodList.seq_food};
			</c:if>			
		</c:forEach>
		
		var seq_foodArr = seq_food.split(",");		
	//	alert("배열크기 : " + seq_foodArr.length);
	
		form_data = {fk_category : fk_category};
					
		$.ajax({
			url:"<%=request.getContextPath()%>/editFood.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
								
				$("#modal_info").empty();
				
				var html = "<h3>음식 선택</h3>";
					html +="<span>인기있는 음식을 선택해보세요!</span><hr/>";
					
				
				$.each(data, function(entryIndex, entry){
				
					var flag = 0;
					for(i=0; i<seq_foodArr.length; i++){
						if(seq_foodArr[i] == entry.seq_food){
							flag = 1;
							
						}// end of if
						
					}// end of for
					
					if(flag == 0) { 
						html+= "<div align='left' style='width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;  text-align: center;'>"; 
						html+= "	<label for='foodChk"+entryIndex+"'>";
						html+= "		<input type='checkbox' name='foodChk' id='foodChk"+entryIndex+"' value='"+entry.seq_food+"'/>";				
						html+= "		<input type='hidden' name='food_seq' id='food_seq"+entryIndex+"' value='"+entry.fk_category+"'/>";	
						html+= "		<img src='/finalproject/resources/images/food/"+entry.image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px; '><br/>";
						html+= "	</label>";
						html+= "	<span>"+entry.name+"</span>";				
						html+= "</div>";
					}
													
					
				});
		 		
				
				html +="<br/><button type='button' class='btn' style='margin-top:30px; width: 60px; height: 30px; font-size: 10pt;' onClick='addFood();'>추가</button>";
				html +="<button type='button' class='btn' data-dismiss='modal' style='width: 60px; height: 30px; margin-top:30px; margin-left:30px; font-size: 10pt;'>취소</button>";
				
				$("#modal_info").html(html);
				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
						
		});
		 	
 	}// end of editFood()---------
 	
	// 음식 추가하기
	function addFood() {
		
	var seq = "";
	var fk = "";
	 $('input:checkbox[name=foodChk]').each(function () {
		if($(this).is(':checked')){
			seq += ","+($(this).val());
			fk += "," + ($(this).next().val());
		}
		
	});	
		 	
	var frm = document.editFrm;
	frm.imgseq.value = seq.substring(1);
	frm.fk_category.value = fk.substring(1);
	frm.category.value = "tbl_food";
	frm.method = "post";
	frm.action = "<%= request.getContextPath() %>/editDetail2.action";
	frm.submit();
	
	}// end of addFood() -----------------
 
 
	function editShop() {
		var fk_category = "";
		
		<c:forEach var="cal" items="${calList}" varStatus='status'>
			<c:if test="${status.index == 0}">
				fk_category += ${cal.fk_category};
			</c:if>
			<c:if test="${status.index != 0}">
				fk_category += ","+${cal.fk_category};
			</c:if>			
		</c:forEach>
		
		var seq_shop = "";
		<c:forEach var="shopList" items="${show_shopList}" varStatus='status'>
			<c:if test="${status.index == 0}">
			seq_shop += ${shopList.seq_shop};
			</c:if>
			<c:if test="${status.index != 0}">
			seq_shop += ","+${shopList.seq_shop};
			</c:if>			
		</c:forEach>
		
		var seq_shopArr = seq_shop.split(",");		
	//	alert("배열크기 : " + seq_foodArr.length);
	
		form_data = {fk_category : fk_category};
					
		$.ajax({
			url:"<%=request.getContextPath()%>/editShop.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
								
				$("#modal_info").empty();
				
				var html = "<h3>쇼핑 선택</h3>";
					html +="<span>인기있는 쇼핑몰을 선택해보세요!</span><hr/>";
					
				
				$.each(data, function(entryIndex, entry){
				
					var flag = 0;
					for(i=0; i<seq_shopArr.length; i++){
						if(seq_shopArr[i] == entry.seq_shop){
							flag = 1;
							
						}// end of if
						
					}// end of for
					
					if(flag == 0) { 
						html+= "<div align='left' style='width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;  text-align: center;'>"; 
						html+= "	<label for='shopChk"+entryIndex+"'>";
						html+= "		<input type='checkbox' name='shopChk' id='shopChk"+entryIndex+"' value='"+entry.seq_shop+"'/>";				
						html+= "		<input type='hidden' name='shop_seq' id='shop_seq"+entryIndex+"' value='"+entry.fk_category+"'/>";	
						html+= "		<img src='/finalproject/resources/images/shop/"+entry.image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px; '><br/>";
						html+= "	</label>";
						html+= "	<span>"+entry.name+"</span>";				
						html+= "</div>";
					}
													
					
				});
		 		
				
				html +="<br/><button type='button' class='btn' style='margin-top:30px; width: 60px; height: 30px; font-size: 10pt;' onClick='addShop();'>추가</button>";
				html +="<button type='button' class='btn' data-dismiss='modal' style='width: 60px; height: 30px; margin-top:30px; margin-left:30px; font-size: 10pt;'>취소</button>";
				
				$("#modal_info").html(html);
				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
						
		});
		 	
 	}// end of editShop()---------
	
	// 쇼핑 추가하기
	function addShop() {
		
	var seq = "";
	var fk = "";
	$('input:checkbox[name=shopChk]').each(function () {
		if($(this).is(':checked')){
			seq += ","+($(this).val());
			fk += "," + ($(this).next().val());
		}
		
	});	
		 	
	var frm = document.editFrm;
	frm.imgseq.value = seq.substring(1);
	frm.fk_category.value = fk.substring(1);
	frm.category.value = "tbl_shop";
	frm.method = "post";
	frm.action = "<%= request.getContextPath() %>/editDetail2.action";
	frm.submit();
	
	}// end of addShop() -----------------
 
	
	function editTour() {
		var fk_category = "";
		
		<c:forEach var="cal" items="${calList}" varStatus='status'>
			<c:if test="${status.index == 0}">
				fk_category += ${cal.fk_category};
			</c:if>
			<c:if test="${status.index != 0}">
				fk_category += ","+${cal.fk_category};
			</c:if>			
		</c:forEach>
		
		var seq_tour = "";
		<c:forEach var="tourList" items="${show_TourActivityList}" varStatus='status'>
			<c:if test="${status.index == 0}">
			seq_tour += ${tourList.seq_tour};
			</c:if>
			<c:if test="${status.index != 0}">
			seq_tour += ","+${tourList.seq_tour};
			</c:if>			
		</c:forEach>
		
		var seq_tourArr = seq_tour.split(",");		
	//	alert("배열크기 : " + seq_tourArr.length);
	
		form_data = {fk_category : fk_category};
					
		$.ajax({
			url:"<%=request.getContextPath()%>/editTour.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
								
				$("#modal_info").empty();
				
				var html = "<h3>투어/액티비티 선택</h3>";
					html +="<span>인기있는 투어/액티비티를 선택해보세요!</span><hr/>";
					
				
				$.each(data, function(entryIndex, entry){
				
					var flag = 0;
					for(i=0; i<seq_tourArr.length; i++){
						if(seq_tourArr[i] == entry.seq_tour){
							flag = 1;
							
						}// end of if
						
					}// end of for
					
					if(flag == 0) { 
						html+= "<div align='left' style='width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;  text-align: center;'>"; 
						html+= "	<label for='tourChk"+entryIndex+"'>";
						html+= "		<input type='checkbox' name='tourChk' id='tourChk"+entryIndex+"' value='"+entry.seq_tour+"'/>";				
						html+= "		<input type='hidden' name='tour_seq' id='tour_seq"+entryIndex+"' value='"+entry.fk_category+"'/>";	
						html+= "		<img src='/finalproject/resources/images/tour/"+entry.image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px; '><br/>";
						html+= "	</label>";
						html+= "	<span>"+entry.name+"</span>";				
						html+= "</div>";
					}
													
					
				});
		 		
				
				html +="<br/><button type='button' class='btn' style='margin-top:30px; width: 60px; height: 30px; font-size: 10pt;' onClick='addTour();'>추가</button>";
				html +="<button type='button' class='btn' data-dismiss='modal' style='width: 60px; height: 30px; margin-top:30px; margin-left:30px; font-size: 10pt;'>취소</button>";
				
				$("#modal_info").html(html);
				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
						
		});
		 	
 	}// end of editTour()---------
	
	// 투어/액티비티 추가하기
	function addTour() {
		
	var seq = "";
	var fk = "";
	$('input:checkbox[name=tourChk]').each(function () {
		if($(this).is(':checked')){
			seq += ","+($(this).val());
			fk += "," + ($(this).next().val());
		}
		
	});	
		 	
	var frm = document.editFrm;
	frm.imgseq.value = seq.substring(1);
	frm.fk_category.value = fk.substring(1);
	frm.category.value = "tbl_tour";
	frm.method = "post";
	frm.action = "<%= request.getContextPath() %>/editDetail2.action";
	frm.submit();
	
	}// end of addTour() -----------------
 
	
	function editBook() {
		var fk_category = "";
		
		<c:forEach var="cal" items="${calList}" varStatus='status'>
			<c:if test="${status.index == 0}">
				fk_category += ${cal.fk_category};
			</c:if>
			<c:if test="${status.index != 0}">
				fk_category += ","+${cal.fk_category};
			</c:if>
			
		</c:forEach>
		
	//	alert(fk_category);
		var seq_book = "";
		<c:forEach var="bookList" items="${show_bookList}" varStatus='status'>
			<c:if test="${status.index == 0}">
			seq_book += ${bookList.seq_book};
			</c:if>
			<c:if test="${status.index != 0}">
			seq_book += "," + ${bookList.seq_book};
			</c:if>			
		</c:forEach>
		
		var seq_bookArr = seq_book.split(",");		
	//	alert("배열크기 : " + seq_foodArr.length);
	
		form_data = {fk_category : fk_category};
					
		$.ajax({
			url:"<%=request.getContextPath()%>/editBook.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
								
				$("#modal_info").empty();
				
				var html = "<h3>셀프북 선택</h3>";
					html +="<span>인기있는 셀프북을 선택해보세요!</span><hr/>";
					
				
				$.each(data, function(entryIndex, entry){
				
					var flag = 0;
					for(i=0; i<seq_bookArr.length; i++){
						if(seq_bookArr[i] == entry.seq_book){
							flag = 1;
							
						}// end of if
						
					}// end of for
					
					if(flag == 0) { 
						html+= "<div align='left' style='width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;  text-align: center;'>"; 
						html+= "	<label for='bookChk"+entryIndex+"'>";
						html+= "		<input type='checkbox' name='bookChk' id='bookChk"+entryIndex+"' value='"+entry.seq_book+"'/>";				
						html+= "		<input type='hidden' name='book_seq' id='book_seq"+entryIndex+"' value='"+entry.fk_category+"'/>";	
						html+= "		<img src='/finalproject/resources/images/book/"+entry.image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px; '><br/>";
						html+= "	</label>";
						html+= "	<span>"+entry.name+"</span>";				
						html+= "</div>";
					}
													
					
				});
		 		
				
				html +="<br/><button type='button' class='btn' style='margin-top:30px; width: 60px; height: 30px; font-size: 10pt;' onClick='addBook();'>추가</button>";
				html +="<button type='button' class='btn' data-dismiss='modal' style='width: 60px; height: 30px; margin-top:30px; margin-left:30px; font-size: 10pt;'>취소</button>";
				
				$("#modal_info").html(html);
				
			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
						
		});
		 	
 	}// end of editBook()---------
	
	// 셀프북 추가하기
	function addBook() {
		
	var seq = "";
	var fk = "";
	$('input:checkbox[name=bookChk]').each(function () {
		if($(this).is(':checked')){
			seq += ","+($(this).val());
			fk += "," + ($(this).next().val());
		}
		
	});	
		 	
	var frm = document.editFrm;
	frm.imgseq.value = seq.substring(1);
	frm.fk_category.value = fk.substring(1);
	frm.category.value = "tbl_book";
	frm.method = "post";
	frm.action = "<%= request.getContextPath() %>/editDetail2.action";
	frm.submit();
	
	}// end of addBook() -----------------
 
 	
</script>

	
<!-- 전체 -->
<div align="center">
<div class="home_slider_background" style="background-image:url(<%= request.getContextPath() %>/resources/images/ScheduleDetail.jpg)"></div>
	<div style="display: inline-block;">

		<!-- 지도 -->
		<div id="googleMap" style="border-radius: 6px; border: 0px solid red; margin-bottom:20px; margin-top:200px;  width: 600px; height: 600px; float: left; ">
		
		
		
		</div>
		<!-- 캘린더 --> 
		<div style="border-radius: 6px; background-color: white; border: 0px solid red; margin-bottom:20px; margin-top:200px; margin-left:20px;  width: 600px; height: 600px; float: left; ">
			<div id='calendar' style='margin: 3em 0 1em 0; font-size: 13px;'></div>
			<button type="button" id="btnLike">
				<span>이 일정이 마음에 들면 좋아요!&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/resources/images/like.jpg" width="35px" height="35px"></span> 
			</button>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;누적 좋아요! : <span id="likecnt" style="font-size: 12pt; color: red;"></span></span>
		</div>
	</div>

	<div class="tab" style="width:70%;" >
	  <button class="tablinks" onclick="openCity(event, 'bucketList')" id="defaultOpen">여행경험</button>
	  <button class="tablinks" onclick="openCity(event, 'scheduler')">일정표</button>
	</div>

	
	<div id="bucketList" class="tabcontent"  align="left" style="background-color: white; width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
		<!-- 명소 -->		
		
		
		<c:if test="${sessionScope.loginuser.userid != ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">명소</span>	
			<br/>
		</c:if>
		
		
		<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">명소</span>&nbsp;
			<img src="<%=request.getContextPath()%>/resources/images/EditBTN.png" width="20" height="20" style="margin-bottom: 10px;" onclick="editTourlist();" data-toggle="modal" data-target="#myModal">
			<br/>	
		</c:if>
			
		<c:if test="${show_tourList != null}">
			<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>
				<c:forEach var="show_tourListMap" items="${show_tourList}" varStatus="status">				
					<div id="tour" style="display: inline-block; margin-left: 5px; text-align: center">									
						<input id="check_tour${status.index}" type="checkbox" style="visibility:hidden">	<!--  style="visibility:hidden" : 체크박스숨김 -->
						<label for="check_tour${status.index}"> 
						<img src="<%=request.getContextPath()%>/resources/images/place/${show_tourListMap.image}" style="margin-top: 10px; margin-bottom: 5px;" width="150" height="200" class="img-rounded" onclick="tour_info(${show_tourListMap.seq_tourlist},'명소');" data-toggle="modal" data-target="#myModal">
					 	</label>
						<br/>
						${show_tourListMap.name}<br/>												
					</div>
				</c:forEach>	
			</div>
		</c:if>	
				
				
		<c:if test="${show_tourList == null}">
			<span id="msgShow">선택된 명소 리스트가 없습니다.</span>
		</c:if>	
		
		<hr/>
		<br/>
		
		<!-- 음식 -->				
		<c:if test="${sessionScope.loginuser.userid != ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">음식</span><br/>
		</c:if>
		
		<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">음식</span>&nbsp;
			<img src="<%=request.getContextPath()%>/resources/images/EditBTN.png" width="20" height="20" style="margin-bottom: 10px;" onclick="editFood();" data-toggle="modal" data-target="#myModal">
			<br/>	
		</c:if>
		
		 
			
		<c:if test="${show_foodList != null}">
			<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>
				<c:forEach var="show_foodListMap" items="${show_foodList}">							
					<div id="food" style="display: inline-block; margin-left: 5px; text-align: center">		
						<img src="<%=request.getContextPath()%>/resources/images/food/${show_foodListMap.image}" style="margin:10px;" class="img-circle" width="150" height="150" onclick="food_info(${show_foodListMap.seq_food},'음식');" data-toggle="modal" data-target="#myModal"><br/> 
						${show_foodListMap.name}				
					</div>				
				</c:forEach>
			</div>
		</c:if>
		
		<c:if test="${show_foodList == null}">
			<span id="msgShow">선택된 음식 리스트가 없습니다.</span>
		</c:if>		
		
		<hr/>
		
		<!-- 쇼핑 -->		
		<c:if test="${sessionScope.loginuser.userid != ScheduleMap.fk_userid}">	
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">쇼핑</span><br/>
		</c:if>
		
		<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">쇼핑</span>&nbsp;
			<img src="<%=request.getContextPath()%>/resources/images/EditBTN.png" width="20" height="20" style="margin-bottom: 10px;" onclick="editShop();" data-toggle="modal" data-target="#myModal">
			<br/>	
		</c:if>
		
		<c:if test="${show_shopList != null}">	
			<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>
				<c:forEach var="show_shopListMap" items="${show_shopList}">
					<div id="shopping" style="display: inline-block; margin-left: 5px; text-align: center">	
						<img src="<%=request.getContextPath()%>/resources/images/shop/${show_shopListMap.image}" style="margin:10px;" class="img-circle" width="150" height="150" onclick="shopping_info(${show_shopListMap.seq_shop},'쇼핑',${show_shopListMap.fk_category});" data-toggle="modal" data-target="#myModal" ><br/> 
						 ${show_shopListMap.name}<br/>																						
					</div>	
				</c:forEach>
			</div>
		</c:if>	
		
		<c:if test="${show_shopList == null}">	
			<span id="msgShow">선택된 쇼핑 리스트가 없습니다.</span>
		</c:if>	
		
		<hr/>
		
		<!-- 투어/액티비티 -->	 
		<c:if test="${sessionScope.loginuser.userid != ScheduleMap.fk_userid}">	
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">투어/액티비티</span><br/>
		</c:if>
		
		<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">투어/액티비티</span>&nbsp;
			<img src="<%=request.getContextPath()%>/resources/images/EditBTN.png" width="20" height="20" style="margin-bottom: 10px;" onclick="editTour();" data-toggle="modal" data-target="#myModal">
			<br/>	
		</c:if>
		
		<c:if test="${show_TourActivityList != null}">		
			<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>
				<c:forEach var="show_TourActivityListMap" items="${show_TourActivityList}">
					<div id="worldtour" style="width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%; text-align: center;">	
						<img src="<%=request.getContextPath()%>/resources/images/tour/${show_TourActivityListMap.image}" style="margin:10px;" class="img-rounded" width="150" height="200" onclick="tourSite('${show_TourActivityListMap.addr}');"><br/> 
						${show_TourActivityListMap.name}<br/>
					</div>	
				</c:forEach>
			</div>
		</c:if>	
				
		<c:if test="${show_TourActivityList == null}">		
			<span id="msgShow">선택된 투어/액티비티 리스트가 없습니다.</span>
		</c:if>	
		
		<hr/>
		<!--  셀프북  -->
		<c:if test="${sessionScope.loginuser.userid != ScheduleMap.fk_userid}">	
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">셀프북</span><br/>
		</c:if>
		
		<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}">		
			<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">셀프북</span>&nbsp;
			<img src="<%=request.getContextPath()%>/resources/images/EditBTN.png" width="20" height="20" style="margin-bottom: 10px;" onclick="editBook();" data-toggle="modal" data-target="#myModal">
			<br/>	
		</c:if>
		
		<c:if test="${show_bookList != null}">
			<div style='overflow-x: auto; white-space: nowrap; margin-left: 20px;'>
				<c:forEach var="show_bookListMap" items="${show_bookList}">
					<div id="book" style="width: 160px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%; text-align: center;">
						<img src="<%=request.getContextPath()%>/resources/images/book/${show_bookListMap.image}" style="margin:10px;" class="img-rounded" width="150" height="200" onclick="tourSite('${show_bookListMap.addr}')"><br/> 
						${show_bookListMap.name}<br/>
					</div>	
				</c:forEach> 
			</div>
		</c:if>	
		
		<c:if test="${show_bookList == null}">		
			<span id="msgShow">등록된 셀프북 리스트가 없습니다.</span>
		</c:if>	
				
	</div>

	<form name="editFrm">
		<input type="hidden" name="seq" value="${ScheduleMap.seq_schedule}">
		<input type="hidden" name="imgseq">
		<input type="hidden" name="fk_category">
		<input type="hidden" name="category">
	</form>
 
	
	<!-- 일정표 	-->
	<div id="scheduler" class="tabcontent" align="left" style="background-color: white; width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
		<!-- 일정표 1 -->				
		<div id="scheduler1" style="width: 90%; display: inline-block; margin-left: 50px; margin-right: 25px;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="text-align: center; width: 10%;">도시</th>
						<th style="text-align: center; width: 10%;">체류일</th>	
						<th style="text-align: center; width: 30%;">교통</th>
						<th style="text-align: center; width: 30%;">일정</th>
						<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}"> 
							<th style="text-align: center; width: 15%;">수정여부</th>
						</c:if>									
					</tr>
				</thead>
				
				<tbody>							
					<c:forEach var="show_schedulerList1map" items="${show_schedulerList1}" varStatus="status">
						<tr>								
							<td>														
								<span>${show_schedulerList1map.a_name}<br/>
								<img src="<%=request.getContextPath()%>/resources/images/flag/${show_schedulerList1map.a_flag}" width="25" height="15" style="border: 2px solid;"></span>							
							</td>
								
							<td style="vertical-align: middle;">${show_schedulerList1map.b_days} 일</td>
							
							<c:if test="${show_schedulerList2.a_transfer != null}">
								<c:if test="${status.index == 0 }" >
									<td rowspan="${length}" style="vertical-align: middle;" id="transferMemo">
										${show_schedulerList2.a_transfer}
									</td>
								</c:if>
							</c:if>
							<c:if test="${show_schedulerList2.a_transfer == null}">
								<c:if test="${status.index == 0 }" >
									<td rowspan="${length}" style="vertical-align: middle;" id="transferMemo">
										등록된 교통편이 없습니다.
									</td>
								</c:if>
							</c:if>
							<c:if test="${show_schedulerList2.a_schedule != null}">
								<c:if test="${status.index == 0 }">
									<td rowspan="${length}" style="vertical-align: middle;" id="scheduleMemo">
										${show_schedulerList2.a_schedule}
									</td>
								</c:if>
							</c:if>
							<c:if test="${show_schedulerList2.a_schedule  == null}">
								<c:if test="${status.index == 0 }">
									<td rowspan="${length}" style="vertical-align: middle;" id="scheduleMemo" >
										등록된 일정이 없습니다.
									</td>
								</c:if>
							</c:if>
							
							<c:if test="${sessionScope.loginuser.userid == ScheduleMap.fk_userid}">
								<c:if test="${status.index == 0 }">
									<td rowspan="${length}" style="vertical-align: middle;" id="editBtn">		
										<button type="button"  class="btn" style="width: 50px; height: 30px;"  onClick="editScheduler2()" >수정</button>
									</td>
								</c:if>
							</c:if>
																											
						</tr>
					</c:forEach>						
				</tbody>				
			</table>
		</div>
	
		<input type="hidden" id="transfer" />	
		<input type="hidden" id="schedule" />
		
		
	</div>	
	
	
 <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">	
	      	<div id="modal-title" style="font-weight: bold;"></div>
	        <button type="button" class="close" data-dismiss="modal" style="font-size: 20pt;">&times;</button>
	      </div>
	      <div class="modal-body" id="modal_info" style="width: 90%;">	       
	       
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 60px; height: 40px; font-size: 12pt;">Close</button>
	      </div>
	    </div>
	  </div>
	</div>


 
 	