<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.overlay {
		padding-left:5px;
		position: absolute;
		margin-left: 30px;
		margin-top: 40px;
	}
	
	input[type='checkbox'] {
        display: none;
	}
</style>

<script>

	$(document).ready(function() {
		
		$("#div_foodoverlay").hide();
		$("#div_placeoverlay").hide();
		$("#div_shoppingoverlay").hide();
		$("#div_touroverlay").hide();
		
	});
	
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
				
				if($("#div_foodlist").is(':empty')) {
					var html = "<h4>음식</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_food"+entryIndex+"' name='chk_food' value='"+entry.seq_food+"' onClick='chkOnOff_food("+entryIndex+");'>";
						html += "<label for='chk_food"+entryIndex+"'><img id='foodimg"+entryIndex+"' class='foodimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_food"+entryIndex+"'>"+entry.name+"</label>";
						html += "</div>";
						
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_foodlist").append(html);
					$("#div_foodoverlay").append(html2);
				}
				
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
				
				if($("#div_placelist").is(':empty')) {
					var html = "<h4>명소</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_place"+entryIndex+"' name='chk_place' value='"+entry.seq_tourlist+"' onClick='chkOnOff_place("+entryIndex+");'>";
						html += "<label for='chk_place"+entryIndex+"'><img id='placeimg"+entryIndex+"' class='placeimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_place"+entryIndex+"'>"+entry.name+"</label>";
						html += "</div>";
	
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_placelist").append(html);
					$("#div_placeoverlay").append(html2);
				}
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
				
				if($("#div_shoppinglist").is(':empty')) {
					var html = "<h4>쇼핑</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_shopping"+entryIndex+"' name='chk_shopping' value='"+entry.seq_shop+"' onClick='chkOnOff_shopping("+entryIndex+");'>";
						html += "<label for='chk_shopping"+entryIndex+"'><img id='shoppingimg"+entryIndex+"' class='shoppingimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_shopping"+entryIndex+"'>"+entry.name+"</label>";
						html += "</div>";
	
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_shoppinglist").append(html);
					$("#div_shoppingoverlay").append(html2);
				}
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
				
				if($("#div_tourlist").is(':empty')) {
					var html = "<h4>투어</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_tour"+entryIndex+"' name='chk_tour' value='"+entry.seq_tour+"' onClick='chkOnOff_tour("+entryIndex+");'>";
						html += "<label for='chk_tour"+entryIndex+"'><img id='tourimg"+entryIndex+"' class='tourimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_tour"+entryIndex+"'>"+entry.name+"</label>";
						html += "</div>";
	
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_tourlist").append(html);
					$("#div_touroverlay").append(html2);
				}
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
		
		$("#close").click();
		
	}
	
	function chkOnOff_food(chkbox) {
		
		if($("#chk_food" + chkbox).prop("checked")) {
			$("#foodimg" + chkbox).before($("#overlay" + chkbox));
			$(".overlay" + chkbox).show();
		}
		
		else {
			$("#foodimg" + chkbox).after($("#overlay" + chkbox));
			$(".overlay" + chkbox).hide();
		}
		
	}
	
	function chkOnOff_place(chkbox) {
		
		if($("#chk_place" + chkbox).prop("checked")) {
			$("#placeimg" + chkbox).before($("#overlay" + chkbox));
			$(".overlay" + chkbox).show();
		}
		
		else {
			$("#placeimg" + chkbox).after($("#overlay" + chkbox));
			$(".overlay" + chkbox).hide();
		}
		
	}
	
	function chkOnOff_shopping(chkbox) {
		
		if($("#chk_shopping" + chkbox).prop("checked")) {
			$("#shoppingimg" + chkbox).before($("#overlay" + chkbox));
			$(".overlay" + chkbox).show();
		}
		
		else {
			$("#shoppingimg" + chkbox).after($("#overlay" + chkbox));
			$(".overlay" + chkbox).hide();
		}
		
	}
	
	function chkOnOff_tour(chkbox) {
		
		if($("#chk_tour" + chkbox).prop("checked")) {
			$("#tourimg" + chkbox).before($("#overlay" + chkbox));
			$(".overlay" + chkbox).show();
		}
		
		else {
			$("#tourimg" + chkbox).after($("#overlay" + chkbox));
			$(".overlay" + chkbox).hide();
		}
		
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
					<div class="modal-content" style="overflow-x: auto; overflow-y: hidden;">
						<div class="modal-header">
							<div id="div_title"></div>
							<button type="button" class="close" data-dismiss="modal" onClick="goSubmit();">&times;</button>
						</div>
						<div class="modal-body">
							<div id="div_placelist" style="overflow-x: auto; white-space: nowrap;"></div><hr/><br/>
							<div id="div_foodlist" style="overflow-x: auto; white-space: nowrap;"></div><hr/><br/>
							<div id="div_shoppinglist" style="overflow-x: auto; white-space: nowrap;"></div><hr/><br/>
							<div id="div_tourlist" style="overflow-x: auto; white-space: nowrap;"></div>
						</div>
						<div class="modal-footer">
							<div id="div_foodoverlay" /></div>
							<div id="div_placeoverlay" /></div>
							<div id="div_shoppingoverlay" /></div>
							<div id="div_touroverlay" /></div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="selectedData">
				<input type="text" id="foodtxt" />
				<input type="text" id="placetxt" />
				<input type="text" id="shoppingtxt" />
				<input type="text" id="tourtxt" />
			</div>

			<hr/>
			
		</c:forEach>
		
	</div>
	
	<div class="rightmap" style="width: 74%; float: right;">
	
		여기에 지도가 들어감
	
	</div>
	
</div>

