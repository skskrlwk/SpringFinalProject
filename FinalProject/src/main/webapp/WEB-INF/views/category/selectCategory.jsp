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
	
	function getCategory(country, countryname, index) {
		
		$("#div_title" + index).empty();
		
		var html_title = "<h4 class='modal-title'>" + countryname + "에서 경험해보자!</h4>";
		$("#div_title" + index).append(html_title);
		
		var data_form = {country : country};
		
		$.ajax({
			url:"<%= request.getContextPath() %>/getFoodlist.action",
			data: data_form,
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				
				if($("#foodtxt" + index).val() == "") {
					
					var html = "<h4>음식</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_food"+index+entryIndex+"' name='chk_food"+index+"' value='"+entry.seq_food+"' onClick='chkOnOff_food("+index+", "+entryIndex+");'>";
						html += "<label for='chk_food"+index+entryIndex+"'><img id='foodimg"+index+entryIndex+"' class='foodimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_food"+index+entryIndex+"'>"+entry.name+"</label>";
						html += "</div>";
						
						html2 += "<img id='overlay"+index+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_foodlist" + index).html(html);
					$("#div_foodoverlay" + index).html(html2);

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
				
				if($("#foodtxt" + index).val() == "") {
					
					var html = "<h4>명소</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_place"+index+entryIndex+"' name='chk_place"+index+"' value='"+entry.seq_tourlist+"' onClick='chkOnOff_place("+index+", "+entryIndex+");'>";
						html += "<label for='chk_place"+index+entryIndex+"'><img id='placeimg"+index+entryIndex+"' class='placeimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_place"+index+entryIndex+"'>"+index+entry.name+"</label>";
						html += "</div>";
	
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_placelist").html(html);
					$("#div_placeoverlay").html(html2);
					
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
				
				if($("#foodtxt" + index).val() == "") {
					
					var html = "<h4>쇼핑</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_shopping"+index+entryIndex+"' name='chk_shopping"+index+"' value='"+entry.seq_shop+"' onClick='chkOnOff_shopping("+index+", "+entryIndex+");'>";
						html += "<label for='chk_shopping"+index+entryIndex+"'><img id='shoppingimg"+index+entryIndex+"' class='shoppingimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_shopping"+index+entryIndex+"'>"+index+entry.name+"</label>";
						html += "</div>";
	
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_shoppinglist").html(html);
					$("#div_shoppingoverlay").html(html2);
					
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
				
				if($("#foodtxt" + index).val() == "") {
					
					var html = "<h4>투어</h4><hr/>";
					var html2 = "";
					
					$.each(json, function(entryIndex, entry){
						html += "<div align='center' style='width: 165px; display: inline-block; margin-right: 2%;'>";
						html += "<input type='checkbox' id='chk_tour"+index+entryIndex+"' name='chk_tour' value='"+entry.seq_tour+"' onClick='chkOnOff_tour("+index+", "+entryIndex+");'>";
						html += "<label for='chk_tour"+index+entryIndex+"'><img id='tourimg"+entryIndex+"' class='tourimg' src='/finalproject/resources/img/"+entry.image+"' width='150' height='200'></label><br/>";
						html += "<label for='chk_tour"+index+entryIndex+"'>"+index+entry.name+"</label>";
						html += "</div>";
	
						html2 += "<img id='overlay"+entryIndex+"' class='overlay' src='/finalproject/resources/img/img_checkbox.png' width='100' height='100' />";
					});
					
					$("#div_tourlist").html(html);
					$("#div_tour").html(html2);
					
				}
				
			},
			error: function(request, status, error){
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
	}
	
	function goSubmit(index) {
		
		var food = "";
		var place = "";
		var shopping = "";
		var tour = "";
		
		$('input:checkbox[name=chk_food'+index+']').each(function() {
			if($(this).is(':checked'))
			food += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_place'+index+']').each(function() {
			if($(this).is(':checked'))
			place += "," + ($(this).val());
		
		$('input:checkbox[name=chk_shopping'+index+']').each(function() {
			if($(this).is(':checked'))
			shopping += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_tour'+index+']').each(function() {
			if($(this).is(':checked'))
			tour += "," + ($(this).val());
		});
		
		$("#foodtxt" + index).val(food.substring(1));
		$("#placetxt" + index).val(place.substring(1));
		$("#shoppingtxt" + index).val(shopping.substring(1));
		$("#tourtxt" + index).val(tour.substring(1));
		
	}
	
	function chkOnOff_food(index, chkbox) {
		
		if($("#chk_food" + index + chkbox).prop("checked")) {
			$("#foodimg" + index + chkbox).before($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).show();
		}
		
		else {
			$("#foodimg" + index + chkbox).after($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_place(index, chkbox) {
		
		if($("#chk_place" + index + chkbox).prop("checked")) {
			$("#placeimg" + index + chkbox).before($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).show();
		}
		
		else {
			$("#placeimg" + index + chkbox).after($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_shopping(index, chkbox) {
		
		if($("#chk_shopping" + index + chkbox).prop("checked")) {
			$("#shoppingimg" + index + chkbox).before($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).show();
		}
		
		else {
			$("#shoppingimg" + index + chkbox).after($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_tour(index, chkbox) {
		
		if($("#chk_tour" + index + chkbox).prop("checked")) {
			$("#tourimg" + index + chkbox).before($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).show();
		}
		
		else {
			$("#tourimg" + index + chkbox).after($("#overlay" + index + chkbox));
			$("#overlay" + index + chkbox).hide();
		}
		
	}

</script>

<div style="margin-top: 200px;">

	<div class="schedulelist" style="width: 24%;">
		
		<c:forEach var="schedule" items="${schedulelist}" varStatus="status">
			
			DAYS&nbsp;:&nbsp;<input type="number" value="${schedule.days}" />일&nbsp;&nbsp;
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#categorylistModal${status.index}" onclick="getCategory(${schedule.fk_category}, '${schedule.countryname}', ${status.index});">${schedule.countryname}</button>
			
			<!-- Modal -->
			<div class="modal fade" id="categorylistModal${status.index}" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content" style="overflow-x: auto; overflow-y: hidden;">
						<div class="modal-header">
							<div id="div_title${status.index}"></div>
							<button type="button" class="close" data-dismiss="modal" onClick="goSubmit(${status.index});">&times;</button>
						</div>
						<div class="modal-body">
							<div id="div_placelist${status.index}" style="overflow-x: auto; white-space: nowrap;"></div><hr/><br/>
							<div id="div_foodlist${status.index}" style="overflow-x: auto; white-space: nowrap;"></div><hr/><br/>
							<div id="div_shoppinglist${status.index}" style="overflow-x: auto; white-space: nowrap;"></div><hr/><br/>
							<div id="div_tourlist${status.index}" style="overflow-x: auto; white-space: nowrap;"></div>
						</div>
						
						<div id="div_foodoverlay${status.index}" /></div>
						<div id="div_placeoverlay${status.index}" /></div>
						<div id="div_shoppingoverlay${status.index}" /></div>
						<div id="div_touroverlay${status.index}" /></div>
					</div>
				</div>
			</div>
			
			<div id="selectedData">
				<input type="text" id="foodtxt${status.index}" />
				<input type="text" id="placetxt${status.index}" />
				<input type="text" id="shoppingtxt${status.index}" />
				<input type="text" id="tourtxt${status.index}" />
			</div>

			<hr/>
			
		</c:forEach>
		
	</div>
	
	<div class="rightmap" style="width: 74%; float: right;">
	
		여기에 지도가 들어감
	
	</div>
	
</div>