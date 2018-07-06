<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	function getCategory(country, countryname) {
		
		$("#div_title").empty();
		
		var html_title = "<h4 class='modal-title'>" + countryname + "에서 경험해보자!</h4>";
		
		$("#div_title").append(html_title);
		
		var data_form = {country : country};
		
		$.ajax({
			url:"<%= request.getContextPath() %>/getFoodlist.action",
			data: data_form,
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				$("#div_foodlist").empty();
				
				var html = "<h4>음식</h4><hr/>";
				
				$.each(json, function(entryIndex, entry){
					html += "<div align='center' style='display: inline-block; margin-right: 2%;'>";
					html += "<input type='checkbox' id='chk_food"+entryIndex+"' name='chk_food' value='"+entry.seq_food+"'>";
					html += "<label for='chk_food"+entryIndex+"'><img id='food"+entryIndex+"' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
					html += "<label for='chk_food"+entryIndex+"'>"+entry.name+"</label>";
					html += "</div>";
				});
				
				html += "<hr/><br/>";
				
				$("#div_foodlist").append(html);
			},
			error: function(request, status, error){
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
		$.ajax({
			url:"<%= request.getContextPath() %>/getPlacelist.action",
			data: data_form,
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				$("#div_placelist").empty();
				
				var html = "<h4>명소</h4><hr/>";
				
				$.each(json, function(entryIndex, entry){
					html += "<div align='center' style='display: inline-block; margin-right: 2%;'>";
					html += "<input type='checkbox' id='chk_tourlist"+entryIndex+"' name='chk_tourlist' value='"+entry.seq_tourlist+"'>";
					html += "<label for='chk_place"+entryIndex+"'><img id='place"+entryIndex+"' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
					html += "<label for='chk_place"+entryIndex+"'>"+entry.name+"</label>";
					html += "</div>";
				});
				
				html += "<hr/><br/>";
				
				$("#div_placelist").append(html);
			},
			error: function(request, status, error){
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
		$.ajax({
			url:"<%= request.getContextPath() %>/getShoppinglist.action",
			data: data_form,
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				$("#div_shoppinglist").empty();
				
				var html = "<h4>쇼핑</h4><hr/>";
				
				$.each(json, function(entryIndex, entry){
					html += "<div align='center' style='display: inline-block; margin-right: 2%;'>";
					html += "<input type='checkbox' id='chk_shop"+entryIndex+"' name='chk_shop' value='"+entry.seq_shop+"'>";
					html += "<label for='chk_shopping"+entryIndex+"'><img id='shopping"+entryIndex+"' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
					html += "<label for='chk_shopping"+entryIndex+"'>"+entry.name+"</label>";
					html += "</div>";
				});
				
				html += "<hr/><br/>";
				
				$("#div_shoppinglist").append(html);
			},
			error: function(request, status, error){
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
		$.ajax({
			url:"<%= request.getContextPath() %>/getTourlist.action",
			data: data_form,
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				$("#div_tourlist").empty();
				
				var html = "<h4>투어</h4><hr/>";
				
				$.each(json, function(entryIndex, entry){
					html += "<div align='center' style='display: inline-block; margin-right: 2%;'>";
					html += "<input type='checkbox' id='chk_tour"+entryIndex+"' name='chk_tour' value='"+entry.seq_tour+"'>";
					html += "<label for='chk_tour"+entryIndex+"'><img id='tour"+entryIndex+"' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
					html += "<label for='chk_tour"+entryIndex+"'>"+entry.name+"</label>";
					html += "</div>";
				});
				
				html += "<hr/><br/>";
				
				$("#div_tourlist").append(html);
			},
			error: function(request, status, error){
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
	}
	
	function goSubmit() {
		
		var food = "";
		var place = "";
		var shopping = "";
		var tour = "";
		
		$('input:checkbox[name=chk_food]').each(function() {
			if($(this).is(':checked'))
			food += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_place]').each(function() {
			if($(this).is(':checked'))
			place += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_shopping]').each(function() {
			if($(this).is(':checked'))
			shopping += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_tour]').each(function() {
			if($(this).is(':checked'))
			tour += "," + ($(this).val());
		});
		
		$("#foodtxt").val(food.substring(1));
		$("#placetxt").val(place.substring(1));
		$("#shoppingtxt").val(shopping.substring(1));
		$("#tourtxt").val(tour.substring(1));
		
		var frm = document.writeFrm;
		frm.action = "temp.action";
		frm.method = "post";
		frm.submit();
		
	}

</script>

<div style="margin-top: 200px;">

	<div class="schedulelist" style="width: 24%;">
		
		<c:forEach var="schedule" items="${schedulelist}" varStatus="status">
			
			DAYS&nbsp;:&nbsp;<input type="number" value="${schedule.days}" />일&nbsp;&nbsp;
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#categorylistModal" onclick="getCategory(${schedule.fk_category}, '${schedule.countryname}');">${schedule.countryname}</button>
			
			<!-- Modal -->
			<div class="modal fade" id="categorylistModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<div id="div_title"></div>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div id="div_placelist"></div>
							<div id="div_foodlist"></div>
							<div id="div_shoppinglist"></div>
							<div id="div_tourlist"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn-info" onClick="goSubmit();">확인</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn-danger close" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>

			<hr/>
			
		</c:forEach>
		
		<form name="selectedFrm">
			<input type="text" id="foodtxt" />
			<input type="text" id="placetxt" />
			<input type="text" id="shoppingtxt" />
			<input type="text" id="tourtxt" />
		</form>
		
	</div>
	
	<div class="rightmap" style="width: 74%; float: right;">
	
		여기에 지도가 들어감
	
	</div>
	
</div>

