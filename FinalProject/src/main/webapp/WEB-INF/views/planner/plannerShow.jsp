<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">


	body {font-family: Arial;}
	
	tbody{ text-align: center;}
	
		
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
		
</style>

<script type="text/javascript">
	
	$(document).ready(function () {
		document.getElementById("defaultOpen").click(); 		
					
		
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
	
	
	function tour_info(fk_category, Tourtitle) {
	//	alert(fk_category);			
		form_data = {fk_category : fk_category};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/bucketList.action",
			type : "GET",
			data : form_data,
			dataType : "JSON", 
			success: function(data){
				
				$("#modal-title").empty();
				$("#modal-title").html("<h3>"+Tourtitle+"</h3>");
				
				$("#modal_info").empty();
			  								
				var html = "<h2>"+data[0].w_name+"</h2><br/>";					
					html+= "<img src='/finalproject/resources/img/"+data[0].w_image+"' width='600' height='345 style='margin-bottom: 20px;' >";
			 		html+= "<hr>";
			 		html+= "<div style='text-align: left; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;'>";
			 		html+= "	<span style='font-size: 12pt; font-weight: bold; text-align: left;'>"+data[0].w_name+"</span><br/>";
					html+= "	<span style='text-align: left; width: 200px;'>"+data[0].w_comments+"</span>";				
					html+= "</div>";
					html+= "<hr>";
			 		html+= "<div style='font-size: 12pt; font-weight: bold; text-align: left; margin-left: 30px; margin-bottom: 20px;  '>";	 
			 		html+= "	<span>투어</span><br/>";				
					html+= "</div>"; 
					html+= "<div align='left' style='margin-left: 30px;'>"; 
				
					
				$.each(data, function(entryIndex, entry){
					html+= "	<div style='display: inline-block;'	> "; 
					html+= "		<img src='/finalproject/resources/img/"+entry.t_image+"' class='img-rounded' width='150' height='200' style='margin-right: 20px;'><br/>";
					html+= "		<div style='text-align:center'>";
					html+= "			<span>"+entry.t_name+"</span>";							
					html+= "		</div>";
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
	//	alert(seq_food);
		
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
					html+= "<img src='/finalproject/resources/img/"+data[0].a_image+"' width='600' height='345 style='margin-bottom: 20px;' >";
			 		html+= "<hr>";
			 		html+= "<div style='text-align: left; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;'>";
			 		html+= "	<span style='font-size: 12pt; font-weight: bold;'>"+data[0].a_name+"</span><br/>";
					html+= "	<span>"+data[0].a_comments+"</span>";	
			 		html+= "</div>";
			 		html+= "<hr>";			 						
			 		html+= "<div style='font-size: 12pt; font-weight: bold; text-align: left; margin-bottom: 20px;  margin-left: 30px;'>";	 
			 		html+= "	<span>음식점</span><br/>";				
					html+= "</div>";				
				
				$.each(data, function(entryIndex, entry){					
					html+= "	<div style='display: inline-block; text-align: left; width: 160px; height:300px; border:1px solid red;' >"
					html+= "		<img src='/finalproject/resources/img/"+entry.b_image+"' class='img-rounded' width='150' height='200' style='margin-right: 15px;'><br/>";
					html+= "		<span style='font-size: 12pt; font-weight: bold;'>"+entry.b_name+"</span><br/>";	
					html+= "		운영시간 : <span>"+entry.b_worktime+"</span><br/>";	
					html+= "		주소 : <span>"+entry.b_addr+"</span>";	
					html+= "	</div>";	
						
										
				});
									
					
				//	html+= "</div>";
				
				$("#modal_info").html(html);

			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		});			
	}// end of food_info(seq_food)-----------------
	
	
	
	function shopping_info(seq_shop, Shoptitle) {		
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
					html+= "<img src='/finalproject/resources/img/"+data[0].image+"' width='600' height='345 style='margin-bottom: 20px;' >";
			 		html+= "<hr>";			
			 		html+= "<div style='text-align: left; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;'>";
			 		html+= "	<span style='font-size: 12pt; font-weight: bold; text-align: left;'>"+data[0].name+"</span><br/>";
					html+= "	<span style='text-align: left; width: 200px;'>"+data[0].comments+"</span>";				
					html+= "</div>";		
					html+= "	<hr>";
					html+= "<div style='font-size: 12pt; font-weight: bold; text-align: left; margin-bottom: 20px;  margin-left: 30px;'>";	 
			 		html+= "	<span>매장</span><br/>";				
					html+= "</div>";
					
				$.each(data, function(entryIndex, entry){
					
					html+= "<div align='left' style='display: inline-block; '>";
					html+= "	<img src='/finalproject/resources/img/"+entry.image+"' class='img-rounded' width='150' height='200' style='margin-right: 10px;'><br/>";
					html+= "	<span style='font-size: 12pt; font-weight: bold;'>"+entry.name+"</span><br/>";	
					html+= "	<div style='text-align: left;'>";
					html+= "		운영시간 : <span>"+entry.worktime+"</span><br/>";	
					html+= "		주소 : <span>"+entry.addr+"</span>";	
					html+= "	</div>";						
				});
				
					
					html+= "</div>";
				
				$("#modal_info").html(html);

			},
			error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		});			
		
	}// end of shopping_info(seq_shop)-----------------
	
	
	function tourSite(c_addr) {
		
		window.open("http://"+c_addr);
		
	}
	

		
	
</script>

	
<!-- 전체 -->
<div align="center">

	<!-- 지도 -->
	<div class="MAP" style="border: 1px solid red; margin-bottom:20px; margin-top:200px;  width: 650px; height: 650px; display: inline-block;">
	
	
	
	
	
	
	</div>
	<!-- 캘린더 -->
	<div class="CAL" style="border: 1px solid red; margin-bottom:20px; margin-left:20px;  width: 650px; height: 650px; display: inline-block; ">
	
	
	
	
	
	
	</div>

	<div class="tab" style="width:70%;" >
	  <button class="tablinks" onclick="openCity(event, 'bucketList')" id="defaultOpen">여행경험</button>
	  <button class="tablinks" onclick="openCity(event, 'scheduler')">일정표</button>
	</div>



	<div id="bucketList" class="tabcontent"  align="left" style="width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
		<!-- 명소 -->				
		<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">명소</span><br/>	
		<c:forEach var="show_tourListMap" items="${show_tourList}" varStatus="status">				
			<div id="tour" style="display: inline-block; margin-left: 5px; text-align: center">									
			<input id="check_tour${status.index}" type="checkbox" style="visibility:hidden">	<!--  style="visibility:hidden" : 체크박스숨김 -->
				<label for="check_tour${status.index}"> 
				<img src="<%=request.getContextPath()%>/resources/img/${show_tourListMap.c_image}" style="margin-top: 10px; margin-bottom: 5px;" width="150" height="200" class="img-rounded" onclick="tour_info(${show_tourListMap.c_fk_category},'명소');" data-toggle="modal" data-target="#myModal">
			 	</label> 
				<br/>
				${show_tourListMap.c_name}<br/>												
			</div>
		</c:forEach>			
		<hr/>
		<br/>		
		<!-- 음식 -->				
		<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">음식</span><br/>
		<c:forEach var="show_foodListMap" items="${show_foodList}">							
			<div id="food" style="display: inline-block; margin-left: 5px; text-align: center">		
				<img src="<%=request.getContextPath()%>/resources/img/${show_foodListMap.c_image}" style="margin:10px;" class="img-circle" width="150" height="150" onclick="food_info(${show_foodListMap.c_seq_food},'음식');" data-toggle="modal" data-target="#myModal"><br/> 
				${show_foodListMap.c_name}				
			</div>				
		</c:forEach>
		<hr/>
		
		<!-- 쇼핑 -->		
		<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">쇼핑</span><br/>
			<c:forEach var="show_shopListMap" items="${show_shopList}">
				<div id="shopping" style="display: inline-block; margin-left: 5px; text-align: center">	
					<img src="<%=request.getContextPath()%>/resources/img/${show_shopListMap.a_image}" style="margin:10px;" class="img-circle" width="150" height="150" onclick="shopping_info(${show_shopListMap.a_seq_shop},'쇼핑');" data-toggle="modal" data-target="#myModal" ><br/> 
					 ${show_shopListMap.a_name}<br/>																						
				</div>	
			</c:forEach>
		<hr/>
		
		<!-- 투어/액티비티 -->	
		<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">투어/액티비티</span><br/>
			<c:forEach var="show_TourActivityListMap" items="${show_TourActivityList}">
				<div id="worldtour" style="display: inline-block; margin-left: 5px; text-align: center">	
					<img src="<%=request.getContextPath()%>/resources/img/${show_TourActivityListMap.c_image}" style="margin:10px;" class="img-rounded" width="150" height="200" onclick="tourSite('${show_TourActivityListMap.c_addr}');"><br/> 
					${show_TourActivityListMap.c_name}<br/>
				</div>	
			</c:forEach>
		<hr/>
		<!--  셀프북  -->
		<span style="font-size: 14pt; font-weight: bold; color: black; text-align: left; margin-left: 20px;">셀프북</span><br/>
		<c:forEach var="bookvo" items="${bookList}">
			<div id="book" style="display: inline-block; margin-left: 5px; text-align: center;">	
				<img src="<%=request.getContextPath()%>/resources/img/${bookvo.image}" style="margin:10px;" class="img-rounded" width="150" height="200"><br/> 
				${bookvo.name}<br/>
			</div>	
		</c:forEach> 		
	</div>

	
 
	
	<!-- 일정표 	-->
	<div id="scheduler" class="tabcontent" align="left" style="width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
		<!-- 일정표 1 -->				
		<div id="scheduler1" style="width: 90%; display: inline-block; margin-left: 50px; margin-right: 25px;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="text-align: center;">도시</th>
						<th style="text-align: center;">체류일</th>	
						<th style="text-align: center;">일정</th>
						<th style="text-align: center;">교통</th>									
						<th style="text-align: center;">수정여부</th>									
					</tr>
				</thead>
				
				<tbody>				
					<c:forEach var="show_schedulerList1map" items="${show_schedulerList1}" varStatus="status">
						<tr>								
							<td>														
								<span>${show_schedulerList1map.a_name}<br/>
								<img src="<%=request.getContextPath()%>/resources/img/${show_schedulerList1map.a_flag}" width="25" height="15" style="border: 2px solid;"></span>							
							</td>
								
							<td style="vertical-align: middle;">${show_schedulerList1map.b_days} 일</td>
							<c:if test="${status.index == 0 }">
								<td rowspan="${length}" style="vertical-align: middle;" >
									${show_schedulerList2.a_schedule}
								</td>
							</c:if>
							<c:if test="${status.index == 0 }" >
								<td rowspan="3" style="vertical-align: middle;">
									${show_schedulerList2.a_transfer}
								</td>
							</c:if>
							
							<c:if test="${status.index == 0 }">
								<td rowspan="${length}" style="vertical-align: middle;" >
									<button type="button" class="btn" style="width: 50px; height: 30px;"  onClick="javascript:location.href='<%= request.getContextPath() %>/edit.action?seq=${show_schedulerList2.a_seq_scheduler}'">수정</button>
								</td>
							</c:if>
							
																													
						</tr>
					</c:forEach>				
									
				</tbody>				
			</table>
		</div>
	
		
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
	
		
 </div>
 
 	
 

 
 