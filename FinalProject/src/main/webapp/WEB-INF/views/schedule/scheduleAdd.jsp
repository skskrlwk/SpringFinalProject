<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 
<!DOCTYPE html>
<html>
<head>
 -->

<style>
.hero-image {
  background-image: url("<%= request.getContextPath()%>/resources/images/contact_background.jpg");
  height: 50%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}

.hero-text button:hover {
  background-color: #555;
  color: white;
}

.cityinfo {
 border-top: 1px solid #efefef;
 border-bottom: 1px solid #efefef;
}

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



<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-1.12.4.min.js"></script> 
<%-- jquery 1.x 또는 jquery 2.x 를 사용해야만 한다. 구글맵은 jquery 3.x 을 사용할 수 없다.   --%>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<%-- 구글맵 api 사용하기  --%>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAN1u0QKuXwWnK1gudrHyVyteYGG5Hx5hg"></script>


<script type="text/javascript">
	
	var flightPlanCoordinates = [];
	var cnt = 0; // 모달 생성 cnt
	var contextPath = "<%= request.getContextPath()%>";
	
	$(document).ready(function(){
		google.maps.event.addDomListener(window, 'load', initialize);
		document.getElementById("startDay").valueAsDate = new Date();
	}); // end of $(document).ready()-------------------------
	
	
	function initialize() {
		// 구글 맵 옵션 설정
		var mapOptions = { 
	        zoom : 5 , // 기본 확대율
	        center : new google.maps.LatLng(47.008928, 5.885228), // 지도 중앙 위치
	        disableDefaultUI : false,  // 기본 UI 비활성화 여부
	        scrollwheel : true,        // 마우스 휠로 확대, 축소 사용 여부
	        zoomControl : true,        // 지도의 확대/축소 수준을 변경하는 데 사용되는 "+"와 "-" 버튼을 표시
	        mapTypeControl : true,     // 지도 유형 컨트롤은 드롭다운이나 가로 버튼 막대 스타일로 제공되며, 사용자가 지도 유형(ROADMAP, SATELLITE, HYBRID 또는 TERRAIN)을 선택할 수 있다. 이 컨트롤은 기본적으로 지도의 왼쪽 위 모서리에 나타난다.
	        streetViewControl : true,  // 스트리트 뷰 컨트롤에는 지도로 드래그해서 스트리트 뷰를 활성화할 수 있는 펙맨 아이콘이 있다. 기본적으로 이 컨트롤은 지도의 오른쪽 아래 근처에 나타난다.
	        scaleControl: true,        // 배율 컨트롤은 지도 배율 요소를 표시한다. 이 컨트롤은 기본적으로 비활성화되어 있다.
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
		
		
		var storeArr = [
			<c:set var="cnt" value="1" />
		    <c:forEach var="map" items="${mapList}" varStatus="status">					
		    [
		   	"${map.name}",
		   	"${map.latitude}",
		   	"${map.longitude}",
		   	"${map.zindex}",
		   	"${map.flag}",
		   	"${map.image}",
		   	"${map.comments}",
		   	"${map.fk_category}"
			 ]
		    <c:if test="${cnt < mapList.size()}">
		     ,
		    </c:if>
		    
	        <c:set var="cnt" value="${cnt + 1}" />   // 변수 cnt 를 1씩 증가
	        </c:forEach>
		 ];
		
		setMarkers(targetmap, storeArr);
		
	} // end of function initialize()--------------------------------
		 
		
	var markerArr;  // 전역변수로 사용됨.
		
	function setMarkers(targetmap, storeArr){
		    
		markerArr = new Array(storeArr.length);
			
		for(var i=0; i < storeArr.length; i++){
			var store = storeArr[i];
			//  console.log(store[0]);  // 점포명  ${storevo.storeName} 출력하기
			// console.log(store[0]);	
			var myLatLng = new google.maps.LatLng(Number(store[1]), Number(store[2]));  
			// Number() 함수를 꼭 사용해야 함을 잊지 말자.               위도, 경도 
				
			var image = "<%= request.getContextPath() %>/resources/images/Redicon.png";  	
			
				
		    // *** 마커 설정하기 *** // 
			markerArr[i] = new google.maps.Marker({  
				position: myLatLng,        // 마커 위치
				icon : image,              // 마커 이미지
				map: targetmap,
				title : store[0],           // 위에서 정의한 "${map.name}" 임
				latitude : store[1],		// 위도
				longitude : store[2],		// 경도
				zIndex : Number(store[3]),  // 위에서 정의한 "${map.zindex}" 임.  Number() 함수를 꼭 사용해야 함을 잊지 말자.
				flag : store[4],
				image : store[5],           // 도시 이미지
				comments : store[6],		// 도시 설명
				fk_category : store[7]		// 도시 카테고리
				
			});
			
			
			// **** 마커를 클릭했을때 어떤 동작이 발생하도록 하는 함수 호출하기 ****//   
			markerListener(targetmap, markerArr[i]);
				
		} // end of for------------------------------	
			
	}// end of setMarkers(map, locations)--------------------------
	 
		
///////////////////////////////////////////////////////////////////////////////////////

    var infowindowArr = new Array();  // 풍선창(풍선윈도우) 여러개를 배열로 저장하기 위한 용도 
        
 // **** 마커를 클릭했을때 어떤 동작이 발생하도록 하는 함수 생성하기 ****// 
	function markerListener(targetmap, marker){      
	
		// 확인용
		// console.log("marker.title : "+marker.title);
				
		// === 풍선창(풍선윈도우)만들기 ===
		var infowindow = new google.maps.InfoWindow(  
				{   	
				    content: viewContent(marker.title, marker.latitude, marker.longitude, marker.fk_category, marker.flag, marker.image, marker.comments),
				    size: new google.maps.Size(381,132) 
				});
		
		infowindowArr.push(infowindow); 
		// 생성한 풍선창(풍선윈도우) infowindow를 배열 infowindowArr 속에 집어넣기		
		
		// **** === marker에 click 이벤트 처리하기 === ***// 
		/*  마커를 클릭했을때 어떤 동작이 발생하게 하려면  
            addListener() 이벤트 핸들러를 사용하여 이벤트 알림을 등록하면 된다. 
                       이 함수는 소스객체, 수신할 이벤트, 지정된 이벤트가 발생할 때 호출할 함수를 인자로 받는다. */
		google.maps.event.addListener(marker, 'click', 
		    function(){ 
			      // marker에(i번째 마커) click(클릭)했을 때 실행할 내용들...
            
	              // 확인용
	              // console.log(marker.zIndex);  // 1  2  3
		     			
				  for(var i=0; i<markerArr.length; i++) { // 생성된 마커의 갯수만큼 반복하여
					  if(i != (marker.zIndex - 1) ) {     // 마커에 클릭하여 발생된 풍선창(풍선윈도우) infowindow 를 제외한 나머지 다른 마커에 달린 풍선창(풍선윈도우) infowindow 는
						 infowindowArr[i].close();	      // 닫는다.
					  }
					  else if(i == (marker.zIndex - 1)) {           // 마커에 클릭하여 발생된 풍선창(풍선윈도우) infowindow 는
						 infowindowArr[i].open(targetmap, marker);  // targetmap 상에 표시되어 있는 marker 위에 띄운다.
					  }
				  }// end of for-----------------------	 		
			 	
		  });  // end of google.maps.event.addListener()-------------------
		
	}// end of function markerListener(map, marker)-----------
	
	
	
	function viewContent(title, latitude, longitude, fk_category, flag, image, comments) {
				
		var html =  "<div> ";
			html += "  <table style='width: 330px; height: 106px;'> ";
			html += "    <tr>" ;
			html += "      <td width='75px;' height='102px;''><img src='<%= request.getContextPath()%>/resources/images/city/"+image+"' width='75px' height='75px' ></td> ";
			html += "      <td width='9px;' height='102px;''></td> ";
			html += "      <td width='215px;' height='102px'> ";
			html += "        <table> ";
			html += "          <tr> ";
			html += "             <td><img src='<%= request.getContextPath()%>/resources/images/flag/"+flag+"' width='15px' height='11px' >&nbsp;<span style='font-weight: bold; font-size: 14px; color: black;'>"+title+"</span></td>";
			html += "          </tr>";
			html += "          <tr>";
			html += "            <td><span style='font-size: 14px;'>"+comments+"</span></td>";
			html += "            <td><input type='hidden' value='"+fk_category+"'> </td>";
			html += "            <td><input type='hidden' value='"+latitude+"'> </td>";
			html += "            <td><input type='hidden' value='"+longitude+"'> </td>";
			html += "          </tr>";
			html += "        </table>";
			html += "      </td>";
			html += "      <td width='30px;' height='102px'><span style='cursor: pointer;' onclick='goAddCity("+fk_category+","+latitude+","+longitude+",\""+title+"\");'><img src='<%= request.getContextPath()%>/resources/images/plus.png' width='40px' height='40px' ></span>";
			html += "      </td> ";
			html += "    </tr>";
			html += "</table>"
			html += "</div>";
		
		 
		return html;	
	}
	
	
	function goDetail(storeno) {
		var url = "storedetailView.do?storeno="+storeno;
		window.open(url, "storedetailViewInfo",
				    "width=700px, height=600px, top=50px, left=800px");
	}
	
	
	function goAddCity(fk_category, latitude, longitude, title) {
	
		
		//	console.log("fk_category : " + fk_category);
		//	console.log("latitude : " + latitude);
		//	console.log("longitude : " + longitude);
	
		var str = {lat: latitude, lng: longitude};  // {lat: 37.772, lng: -122.214}
		flightPlanCoordinates.push(str); // 전역변수 flightPlanCoordinates에 push
		addLine(latitude,longitude);
		
		// div 이름 travelList
		var html = "<div class='cityinfo' style='height: 69px; margin-top: 1px;'>";
			html += "<div style='width:40px;border-right:3px solid #3ad195;height:14px;'></div>";
		    html += "<div style='float: left;'>";
		    html += "<div style='float:left; width: 80px; height: 53px;'>";
		    html += "<div style='float:left; width:70px; height:53px; padding-left:7px;background:#fff;padding-top:13px;border-radius:100px;border:3px solid #3ad195;cursor:pointer'>";
		    html += "<div>";
		    html += "<select name='days' style='width: 50px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;'>";
		    html += "<option value='0' selected='selected'>0박</option>";
		    html += "<option value='1' selected='selected'>1박</option>";
		    html += "<option value='2'>2박</option>";
		    html += "<option value='3'>3박</option>";
		    html += "<option value='4'>4박</option>";
		    html += "<option value='5'>5박</option>";
		    html += "<option value='6'>6박</option>";
		    html += "<option value='7'>7박</option>";
		    html += "<option value='8'>8박</option>";
		    html += "<option value='9'>9박</option>";
		    html += "</select>";
		    html += "</div>";
		    html += "</div>";
		    html += "</div>";
		    html += "<div style=' float:left; width: 170px; height: 53px;  margin-left: 10px;'>";
		    html += "<div style='height: 20px; margin-top: 5px;'>";
		    html += "<span style='font-size: 16px; font-weight: bold; color: black;'>"+title+"</span>";
		    html += "</div>";
		    html += "<div style='font-size: 14px; height: 20px; margin-top: 7px;'>";
		    html += "공백";
		    html += "</div>";
		    html += "</div>";
		    html += "<div style=' float:left; width: 60px; height: 53px; margin-left: 15px;'>";
		    html += "<div style='height:50px;text-align:center;padding-top:3px;padding-bottom:3px;border:1px solid #efefef;background:#fff;border-radius:8px;'>";
		    html += "<font style='font-size:19pt;color:#3ad195'>";
		    html += "<button style='border:none; background-color: white;' type='button' data-toggle='modal' data-target='#categorylistModal"+cnt+"'>";
		    html += "<i class='fa fa-calendar-check-o'></i>";
		    html += "</button>";
		    html += "</font>";
		    html += "</div>";
		    html += "</div>";
		    html += "<input type='hidden' name='coordinate' value='{lat:"+ latitude + ", lng:" + longitude + "}' />";
		    html += "<input type='hidden' name='worldArr' value='"+fk_category+"'/>";
		    html += "<input type='hidden' id='foodtxt"+cnt+"' name='foodArr' />";
		    html += "<input type='hidden' id='placetxt"+cnt+"' name='placeArr' />";
		    html += "<input type='hidden' id='shoppingtxt"+cnt+"' name='shopArr' />";
		    html += "<input type='hidden' id='tourtxt"+cnt+"' name='tourArr' />";
		    html += "<input type='hidden' id='booktxt"+cnt+"' name='bookArr' />";
		    html += "</div>";
		    html += "</div>";
		$("#travelList").append(html);
		
		var data_form = {"country" : fk_category};
		
		var html2 = "<div class='modal fade' id='categorylistModal"+cnt+"' role='dialog'>";
			html2 += "<div class='modal-dialog modal-lg'>";
			html2 += "<div class='modal-content' style='overflow-x: auto; overflow-y: hidden;'>";
			html2 += "<div class='modal-header' >";
			html2 += "<div id='div_title"+cnt+"' style='width: 90%;'>";
			html2 += "<h4 class='modal-title'>" + title + "에서 경험해보자!</h4>"
			html2 += "</div>";
			html2 += "<div style='style='width: 9%;'>";
			html2 += "<button type='button' class='btn btn_info' data-dismiss='modal' onClick='goSubmit("+cnt+")' >확인</button>";
			html2 += "</div>";
			html2 += "</div>";
			html2 += "<div class='modal-body'>";
			html2 += "<div id='div_placelist"+cnt+"' style='overflow-x: auto; overflow-y: hidden; white-space: nowrap;'>";
			html2 += "</div><hr/><br/>";
			html2 += " <div id='div_foodlist"+cnt+"' style='overflow-x: auto; overflow-y: hidden; white-space: nowrap;'> ";
			html2 += " </div><hr/><br/> ";
			html2 += "<div id='div_shoppinglist"+cnt+"' style='overflow-x: auto; overflow-y: hidden; white-space: nowrap;'>";
			html2 += "</div><hr/><br/>";
			html2 += "<div id='div_tourlist"+cnt+"' style='overflow-x: auto; overflow-y: hidden; white-space: nowrap;'>";
			html2 += "</div><hr/><br/>";
			html2 += "<div id='div_booklist"+cnt+"' style='overflow-x: auto; overflow-y: hidden; white-space: nowrap;'>";
			html2 += "</div><hr/><br/>";
			html2 += "</div>";
			html2 += "<div id='div_foodoverlay"+cnt+"' class='div_foodoverlay' />";
			html2 += "</div>";
			html2 += "<div id='div_placeoverlay"+cnt+"' class='div_placeoverlay' />";
			html2 += "</div>";
			html2 += "<div id='div_shoppingoverlay"+cnt+"' class='div_shoppingoverlay' />";
			html2 += "</div>";
			html2 += "<div id='div_touroverlay"+cnt+"' class='div_touroverlay' />";
			html2 += "</div>";
			html2 += "<div id='div_bookoverlay"+cnt+"' class='div_bookoverlay' />";
			html2 += "</div>";
			html2 += "</div>";
			html2 += "</div>";
			html2 += "</div>";
			
		$("#modals").append(html2);


		// 음식 리스트 ajax
		$.ajax({
			url:"<%= request.getContextPath() %>/getFoodlist.action",
			data: data_form,
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				if($("#foodtxt" + cnt).val() == "") {
					
					var temp_str1 = "";
					var temp_str2 = "";
					temp_str1 += "<h4>음식</h4><hr/>";
					
					$.each(json, function(entryIndex, entry){
						temp_str1 += "<div align='center' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>";
						temp_str1 += "<input type='checkbox' id='chk_food"+cnt+entryIndex+"' name='chk_food"+cnt+"' value='"+entry.seq_food+"' onClick='chkOnOff_food("+cnt+", "+entryIndex+");'>";
						temp_str1 += "<label for='chk_food"+cnt+entryIndex+"'><img id='foodimg"+cnt+entryIndex+"' class='foodimg' src='"+contextPath+"/resources/images/food/"+entry.image+"' width='150' height='200'></label><br/>";
						temp_str1 += "<label for='chk_food"+cnt+entryIndex+"'>"+entry.name+"</label>";
						temp_str1 += "</div>";
						
						temp_str2 += "<img id='foodoverlay"+cnt+entryIndex+"' class='overlay' src='"+contextPath+"/resources/images/img_checkbox.png' width='100' height='100' />";
					});
					$("#div_foodlist" + cnt).html(temp_str1);
					$("#div_foodoverlay" + cnt).html(temp_str2); 
					
					$(".div_foodoverlay").hide(); 
				}

				// 관광명소 ajax
				$.ajax({
					url:"<%= request.getContextPath() %>/getPlacelist.action",
					data: data_form,
					type: "GET",
					dataType: "JSON",
					success: function(json) {
						
						if($("#placetxt" + cnt).val() == "") {
							
							var temp_str3 = "<h4>명소</h4><hr/>";
							var temp_str4 = "";
												
							$.each(json, function(entryIndex, entry){
								temp_str3 += "<div align='center' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>";
								temp_str3 += "<input type='checkbox' id='chk_place"+cnt+entryIndex+"' name='chk_place"+cnt+"' value='"+entry.seq_tourlist+"' onClick='chkOnOff_place("+cnt+", "+entryIndex+");'>";
								temp_str3 += "<label for='chk_place"+cnt+entryIndex+"'><img id='placeimg"+cnt+entryIndex+"' class='placeimg' src='"+contextPath+"/resources/images/place/"+entry.image+"' width='150' height='200'></label><br/>";
								temp_str3 += "<label for='chk_place"+cnt+entryIndex+"'>"+entry.name+"</label>";
								temp_str3 += "</div>";
			
								temp_str4 += "<img id='placeoverlay"+cnt+entryIndex+"' class='overlay' src='"+contextPath+"/resources/images/img_checkbox.png' width='100' height='100' />";
							});
							
							$("#div_placelist"+cnt).html(temp_str3);
							$("#div_placeoverlay"+cnt).html(temp_str4);
							
							$(".div_placeoverlay").hide();
							
						}
						
						// 쇼핑몰 ajax
						$.ajax({
							url:"<%= request.getContextPath() %>/getShoppinglist.action",
							data: data_form,
							type: "GET",
							dataType: "JSON",
							success: function(json) {
								
								if($("#shoppingtxt" + cnt).val() == "") {
									
									var temp_str5 = "<h4>쇼핑</h4><hr/>";
									var temp_str6 = "";

									$.each(json, function(entryIndex, entry){
										temp_str5 += "<div align='center' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>";
										temp_str5 += "<input type='checkbox' id='chk_shopping"+cnt+entryIndex+"' name='chk_shopping"+cnt+"' value='"+entry.seq_shop+"' onClick='chkOnOff_shopping("+cnt+", "+entryIndex+");'>";
										temp_str5 += "<label for='chk_shopping"+cnt+entryIndex+"'><img id='shoppingimg"+cnt+entryIndex+"' class='shoppingimg' src='"+contextPath+"/resources/images/shop/"+entry.image+"' width='150' height='200'></label><br/>";
										temp_str5 += "<label for='chk_shopping"+cnt+entryIndex+"'>"+entry.name+"</label>";
										temp_str5 += "</div>";
					
										temp_str6 += "<img id='shoppingoverlay"+cnt+entryIndex+"' class='overlay' src='"+contextPath+"/resources/images/img_checkbox.png' width='100' height='100' />";
									});
									
									$("#div_shoppinglist"+cnt).html(temp_str5);
									$("#div_shoppingoverlay"+cnt).html(temp_str6);
									
									$(".div_shoppingoverlay").hide();
									
								}
								
								// 투어list ajax
								$.ajax({
									url:"<%= request.getContextPath() %>/getTourlist.action",
									data: data_form,
									type: "GET",
									dataType: "JSON",
									success: function(json) {
										
										if($("#tourtxt" + cnt).val() == "") {
											
											var temp_str7 = "<h4>투어</h4><hr/>";
											var temp_str8 = "";
											
											$.each(json, function(entryIndex, entry){
												temp_str7 += "<div align='center' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>";
												temp_str7 += "<input type='checkbox' id='chk_tour"+cnt+entryIndex+"' name='chk_tour"+cnt+"' value='"+entry.seq_tour+"' onClick='chkOnOff_tour("+cnt+", "+entryIndex+");'>";
												temp_str7 += "<label for='chk_tour"+cnt+entryIndex+"'><img id='tourimg"+cnt+entryIndex+"' class='tourimg' src='"+contextPath+"/resources/images/tour/"+entry.image+"' width='150' height='200'></label><br/>";
												temp_str7 += "<label for='chk_tour"+cnt+entryIndex+"'>"+entry.name+"</label>";
												temp_str7 += "</div>";
							
												temp_str8 += "<img id='touroverlay"+cnt+entryIndex+"' class='overlay' src='"+contextPath+"/resources/images/img_checkbox.png' width='100' height='100' />";
											});
											
											$("#div_tourlist"+cnt).html(temp_str7);
											$("#div_touroverlay"+cnt).html(temp_str8);
											
											$(".div_touroverlay").hide();
											
										}
										
										// 도서list ajax
										$.ajax({
											url:"<%= request.getContextPath() %>/getBooklist.action",
											data: data_form,
											type: "GET",
											dataType: "JSON",
											success: function(json) {
												
												if($("#booktxt" + cnt).val() == "") {
													
													var temp_str9 = "<h4>도서</h4><hr/>";
													var temp_str10 = "";
													
													$.each(json, function(entryIndex, entry){
														temp_str9 += "<div align='center' style='width: 165px; display: inline-block; white-space: normal; vertical-align: top; margin-right: 2%;'>";
														temp_str9 += "<input type='checkbox' id='chk_book"+cnt+entryIndex+"' name='chk_book"+cnt+"' value='"+entry.seq_book+"' onClick='chkOnOff_book("+cnt+", "+entryIndex+");'>";
														temp_str9 += "<label for='chk_book"+cnt+entryIndex+"'><img id='bookimg"+cnt+entryIndex+"' class='bookimg' src='"+contextPath+"/resources/images/book/"+entry.image+"' width='150' height='200'></label><br/>";
														temp_str9 += "<label for='chk_book"+cnt+entryIndex+"'>"+entry.name+"</label>";
														temp_str9 += "</div>";
									
														temp_str10 += "<img id='bookoverlay"+cnt+entryIndex+"' class='overlay' src='"+contextPath+"/resources/images/img_checkbox.png' width='100' height='100' />";
													});
													
													$("#div_booklist"+cnt).html(temp_str9);
													$("#div_bookoverlay"+cnt).html(temp_str10);
													
													$(".div_bookoverlay").hide();
													
												}
												
												cnt = cnt + 1;	
											},
											error: function(request, status, error){
												alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
											}
										});
										
									},
									error: function(request, status, error){
										alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
									}
								});
								
							},
							error: function(request, status, error){
								alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
							}
						});
						
					},
					error: function(request, status, error){
						alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
					}
				});
				
			},
			error: function(request, status, error){
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
	}
	
	// 선그리기 함수
	function addLine(latitude, longitude) {
		
		var mapOptions = { 
		        zoom : 5 , // 기본 확대율
		       /*  center : new google.maps.LatLng(47.008928, 5.885228), // 지도 중앙 위치 */
		        center : new google.maps.LatLng(latitude, longitude),
		        disableDefaultUI : false,  // 기본 UI 비활성화 여부
		        scrollwheel : true,        // 마우스 휠로 확대, 축소 사용 여부
		        zoomControl : true,        // 지도의 확대/축소 수준을 변경하는 데 사용되는 "+"와 "-" 버튼을 표시
		        mapTypeControl : true,     // 지도 유형 컨트롤은 드롭다운이나 가로 버튼 막대 스타일로 제공되며, 사용자가 지도 유형(ROADMAP, SATELLITE, HYBRID 또는 TERRAIN)을 선택할 수 있다. 이 컨트롤은 기본적으로 지도의 왼쪽 위 모서리에 나타난다.
		        streetViewControl : true,  // 스트리트 뷰 컨트롤에는 지도로 드래그해서 스트리트 뷰를 활성화할 수 있는 펙맨 아이콘이 있다. 기본적으로 이 컨트롤은 지도의 오른쪽 아래 근처에 나타난다.
		        scaleControl: true,        // 배율 컨트롤은 지도 배율 요소를 표시한다. 이 컨트롤은 기본적으로 비활성화되어 있다.
		        styles: [{"elementType": "geometry","stylers": [ {"color": "#ffffff"} ] }, {"elementType": "labels.icon","stylers": [ {"color": "#e5e5e5"},	{"visibility": "off"} ] }, { "elementType": "labels.text.fill", "stylers": [ {"color": "#c3c3c3"} ] }, {"featureType": "administrative", "elementType": "geometry", "stylers": [ { "visibility": "off" } ] },  { "featureType": "administrative.land_parcel", "stylers": [ {"visibility": "off"} ] }, {"featureType": "administrative.locality", "stylers": [ {"visibility": "simplified"} ] }, {"featureType": "administrative.neighborhood", "stylers": [ {"visibility": "off"} ] },	{"featureType": "poi", "stylers": [ {"visibility": "off" } ]	}, {"featureType": "road", "stylers": [ {"visibility": "off"} ] }, {"featureType": "transit", "stylers": [ {"visibility": "off"} ] }, {	"featureType": "water",	"elementType": "geometry", "stylers": [	{"color": "#c8f3f9"} ] },  { "featureType": "water", "elementType": "labels.text","stylers": [{"visibility": "off"} ]  } ]  
				// 구글맵 스타일 변경
		        
		    };
		    // 구글맵 옵션내역 사이트 아래 참조 
		    // https://developers.google.com/maps/documentation/javascript/reference#MapOptions
		 
		var targetmap = new google.maps.Map(document.getElementById('googleMap'), mapOptions);  
		
		google.maps.event.addDomListener(window, "resize", function() {
	        var center = targetmap.getCenter();
	        google.maps.event.trigger(targetmap, "resize");
	        map.setCenter(center); 
	        
	    });
		
		var storeArr = [
			<c:set var="cnt" value="1" />
		    <c:forEach var="map" items="${mapList}" varStatus="status">					
		    [
		   	"${map.name}",
		   	"${map.latitude}",
		   	"${map.longitude}",
		   	"${map.zindex}",
		   	"${map.flag}",
		   	"${map.image}",
		   	"${map.comments}",
		   	"${map.fk_category}"
			 ]
		    <c:if test="${cnt < mapList.size()}">
		     ,
		    </c:if>
		    
	        <c:set var="cnt" value="${cnt + 1}" />   // 변수 cnt 를 1씩 증가
	        </c:forEach>
		 ];
		
		setMarkers(targetmap, storeArr);
		
		 // 선그리기
		/*  
		var flightPlanCoordinates = [
			
			 {lat: 37.772, lng: -122.214},
	         {lat: 21.291, lng: -157.821},
	         {lat: -18.142, lng: 178.431},
	         {lat: -27.467, lng: 153.027}, 
	    ]; 
		 */
		// console.log(flightPlanCoordinates);
		 
		var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
		 
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
		
	}
	
	
	function goInsert() {
		
		var titlename = $("#title").val();
		if(titlename.trim() == ""){
			alert("제목을 입력해주세요");
			$("#title").focus();
			return;
		}
		
		if(cnt == 0){
			alert("여행지 1개이상을  선택해주세요!");
			return;
		}
		
		// 널값처리
		for(var i=0; i<cnt; i++) {
		
			if($("#foodtxt" + i).val() == "") {
				$("#foodtxt" + i).val("999");
			}
			
			if($("#placetxt" + i).val() == "") {
				$("#placetxt" + i).val("999");
			}
			
			if($("#shoppingtxt" + i).val() == "") {
				$("#shoppingtxt" + i).val("999");
			}
			
			if($("#tourtxt" + i).val() == "") {
				$("#tourtxt" + i).val("999");
			}
			
			if($("#booktxt" + i).val() == "") {
				$("#booktxt" + i).val("999");
			}
			
		}
		// 과거 날짜면 return 처리해주기
		var startday =  document.getElementById("startDay").value;
		
		var date1 = new Date(); 
		var date2 = new Date(startday);
		
		date1 = formatDay(date1);
		date2 = formatDay(date2);
		
		if(date1 > date2){
			alert("선택한 날짜가 과거입니다.");
			return;
		}
		
		
		
		var frm = document.planFrm;		
		frm.method = "post";
		frm.action = contextPath+"/scheduleAddEnd.action";
		// console.log(contextPath);
		frm.submit(); 
		
	}
	
	function formatDay(date) {
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if(month < 10){
			month = "0"+ month;
		}
		var day = date.getDate();
		if(day < 10){
			day = "0"+ day; 
		}
		return new Date(year+"-"+month+"-"+day);
				
	}

	
	function chkOnOff_food(index, chkbox) {
		
		if($("#chk_food" + index + chkbox).prop("checked")) {
			$("#foodimg" + index + chkbox).before($("#foodoverlay" + index + chkbox));
			$("#foodoverlay" + index + chkbox).show();
		}
		
		else {
			$("#foodimg" + index + chkbox).after($("#foodoverlay" + index + chkbox));
			$("#foodoverlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_place(index, chkbox) {
		
		if($("#chk_place" + index + chkbox).prop("checked")) {
			$("#placeimg" + index + chkbox).before($("#placeoverlay" + index + chkbox));
			$("#placeoverlay" + index + chkbox).show();
		}
		
		else {
			$("#placeimg" + index + chkbox).after($("#placeoverlay" + index + chkbox));
			$("#placeoverlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_shopping(index, chkbox) {
		
		if($("#chk_shopping" + index + chkbox).prop("checked")) {
			$("#shoppingimg" + index + chkbox).before($("#shoppingoverlay" + index + chkbox));
			$("#shoppingoverlay" + index + chkbox).show();
		}
		
		else {
			$("#shoppingimg" + index + chkbox).after($("#shoppingoverlay" + index + chkbox));
			$("#shoppingoverlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_tour(index, chkbox) {

		if($("#chk_tour" + index + chkbox).prop("checked")) {
			$("#tourimg" + index + chkbox).before($("#touroverlay" + index + chkbox));
			$("#touroverlay" + index + chkbox).show();
		}
		
		else {
			$("#tourimg" + index + chkbox).after($("#touroverlay" + index + chkbox));
			$("#touroverlay" + index + chkbox).hide();
		}
		
	}
	
	function chkOnOff_book(index, chkbox) {

		if($("#chk_book" + index + chkbox).prop("checked")) {
			$("#bookimg" + index + chkbox).before($("#bookoverlay" + index + chkbox));
			$("#bookoverlay" + index + chkbox).show();
		}
		
		else {
			$("#bookimg" + index + chkbox).after($("#bookoverlay" + index + chkbox));
			$("#bookoverlay" + index + chkbox).hide();
		}
		
	}
	
	function goSubmit(index) {
		
		var food = "";
		var place = "";
		var shopping = "";
		var tour = "";
		var book = "";
		
		$('input:checkbox[name=chk_food'+index+']').each(function() {
			if($(this).is(':checked'))
			food += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_place'+index+']').each(function() {
			if($(this).is(':checked'))
			place += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_shopping'+index+']').each(function() {
			if($(this).is(':checked'))
			shopping += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_tour'+index+']').each(function() {
			if($(this).is(':checked'))
			tour += "," + ($(this).val());
		});
		
		$('input:checkbox[name=chk_book'+index+']').each(function() {
			if($(this).is(':checked'))
			book += "," + ($(this).val());
		});
		
		$("#foodtxt" + index).val(food.substring(1));
		$("#placetxt" + index).val(place.substring(1));
		$("#shoppingtxt" + index).val(shopping.substring(1));
		$("#tourtxt" + index).val(tour.substring(1));
		$("#booktxt" + index).val(book.substring(1));
		
	}
	
	function goback() {
		var bool = confirm("저장하지 않고 이 페이지를 나가려 합니다"); 
		if(bool){
			javascript:history.back();
		}    


		
	}
	

</script>
<!-- 
</head>
<body>
	 -->
	<div>
		<div class="hero-image " style="width: 100%; height: 350px; border: solid green 0px;">
		  <div class="hero-text">
		    <br/><br/><br/><br/><br/><br/><br/><br/>
		    <h1 style="font-size:50px">Make a Plan</h1>		    
		  </div>
		</div>
	</div>	
	
	<div style=" width: 80%; height: 800px; border: solid green 0px; margin:0 auto;" >
		<form name="planFrm">
		<div style=" margin-top: 10px;; width: 26%; height: 800px; float: left; border: solid red 0px; overflow:auto; ">
			<div style="height: 50px; border: solid red 0px; background-color: #3ad195;" class="navbar" >
				  <span style="font-weight: bolder; color: white;">제목  : </span><input type ="text" id="title" name="title"/>
			</div>
			<div style="height: 100px; border: solid red 0px; background-color: #3ad195;" class="navbar" >
				  <span style="font-weight: bolder; color: white;">출발  :</span><input type="date" id="startDay" name="startDay"> <br/>
				  <button type="button" class="btn btn-default" onclick="goInsert();">저장하기</button> <button type="button" class="btn btn-default" onclick="goback();">돌아가기</button>	  
			</div>
			<div id="travelList">
			
			<%--  스케줄 추가 내용  --%><!-- 
				<div class="cityinfo" style="height: 69px;">
					<div style="width:40px;border-right:3px solid #3ad195;height:14px;"></div>
					<div style="float: left;">
						<div style="float:left; width: 80px; height: 53px;">
						<div style="float:left; width:70px; height:53px; padding-left:7px;background:#fff;padding-top:13px;border-radius:100px;border:3px solid #3ad195;cursor:pointer">
							<div>
							  <select style="width: 50px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
							    <option value="1" selected="selected">1일</option>
							    <option value="2">2일</option>
							    <option value="3">3일</option>
							    <option value="4">4일</option>
							    <option value="5">5일</option>
							    <option value="6">6일</option>
							    <option value="7">7일</option>
							    <option value="8">8일</option>
							    <option value="9">9일</option>
							  </select>
							</div>
						</div>
						</div>
						<div style=" float:left; width: 170px; height: 53px;  margin-left: 10px;">
							<div style="height: 20px; margin-top: 5px;">
								<span style="font-size: 16px; font-weight: bold; color: black;">파리</span>
							</div>
							<div style="font-size: 14px; height: 20px; margin-top: 7px;">
								8월5일(화) ~ 14일(수)
							</div>
						</div>
						<div style=" float:left; width: 60px; height: 53px; margin-left: 15px;">
							<div style="height:50px;text-align:center;padding-top:3px;padding-bottom:3px;border:1px solid #efefef;background:#fff;border-radius:8px;">
								<font style="font-size:19pt;color:#3ad195">
								<i class="fa fa-calendar-check-o">

								</i>
								</font>
							</div>
						</div>
					</div>
				</div>	
				 -->
			</div>
			
			
		</div>
		</form>
		
		<!-- 구글지도  -->
		<div id="googleMap" style="width: 74%; height: 800px; float: left; border: solid blue 0px;">
			
		</div>
	</div>
	
	
	<!-- Modal -->
	<div id="modals">
	
	</div>
	
<!-- 	
</body>
</html>
    	 -->
	