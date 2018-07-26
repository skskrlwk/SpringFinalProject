<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

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
	
	table#tblProdInput {border: solid gray 1px; 
	                    border-collapse: collapse; }
	                    
    table#tblProdInput td {border: solid gray 1px; 
	                       padding-left: 10px;
	                       height: 75px; }
	
	
    .prodInputName {background-color: #e6fff2; 
                    font-weight: bold; }	                       	                    
	
	.error {color: red; font-weight: bold; font-size: 9pt;}
</style>



<script type="text/javascript">
	$(document).ready(function(){
		
		document.getElementById("defaultOpen").click(); 
		
		$(".error").hide();
		
		$("#btnRegister").bind("click", function(event){
			var bool = false;
			$(".infoData").each(function(){
				var val = $(this).val().trim();
				if(val == ""){
					$(this).next().show();
					bool = true;
				}else{
					$(this).next().hide();
				}
			}); // end of each()----------------
			
			if(bool) {
				event.preventDefault();
			}
			else {	
				var prodInputFrm = document.shopInputFrm;
				prodInputFrm.submit();
			}
			
		}); // end of $("#btnRegister").bind();------------------------------
		
	
		$("#btnRegister2").bind("click", function(event){
			var bool = false;
			$(".infoData2").each(function(){
				var val = $(this).val().trim();
				if(val == ""){
					$(this).next().show();
					bool = true;
				}else{
					$(this).next().hide();
				}
			}); // end of each()----------------
			
			if(bool) {
				event.preventDefault();
			}
			else {	
				var price = $("#price").val();
				if(price.length > 8){
					alert("8자리 이하의 숫자만 입력가능");
					return;
				}
				
				var regexp_tel = /^[0-9]/g;
				regbool = regexp_tel.test(price);

				if(regbool){
					var prodInputFrm = document.tourInputFrm;
					prodInputFrm.submit();
				}else{
					alert("숫자만 입력가능합니다.");
					$("#price").val("");
					$("#price").focus();
					return;
				}
				
				
			}
			
		}); // end of $("#btnRegister").bind();------------------------------
		
		
		
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
	
	
</script>
<div class="home_slider_background" style="background-image:url(<%= request.getContextPath() %>/resources/images/office-work.jpg)"></div>

<div align="center"  style="margin-bottom: 20px; padding-top: 200px; " >
<div style="background: white; width: 95%; margin: auto; ">
<div style="border: solid green 2px; width: 200px; margin-top: 20px; padding-top: 10px; padding-bottom: 10px; border-left: hidden; border-right: hidden;">       
	<span style="margin-top : 15px; font-size: 15pt; font-weight: bold;">정보 관리 등록[ADMIN]</span>	
</div>

<div class="tab" style="width:70%;" >
   <button class="tablinks" onclick="openCity(event, 'shop')" id="defaultOpen">쇼핑몰관리</button>
   <button class="tablinks" onclick="openCity(event, 'tour')">투어정보관리</button>
   <button class="tablinks" onclick="openCity(event, 'book')">가이드책관리</button>
</div>

<br/>
<div id="shop" class="tabcontent"  align="left" style="background-color: white; width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
	<form name="shopInputFrm" 
	      action="<%= request.getContextPath() %>/adminRegisterEnd.action"
	      method="post"
	      enctype="multipart/form-data">
	    <%--  파일 업로드를 사용하기 위해서 form은 항상 post방식이어야 하며,
	          enctype을  enctype="multipart/form-data" 으로 지정해 주어야 한다. --%>
	<table id="tblProdInput" style="width: 100%;">	
	<tbody>
		<tr>
			<td width="20%" class="prodInputName" style="padding-top: 10px;">카테고리<input type="hidden" name="tbl" value="shop"/></td>
			<td width="80%" align="left" style="padding-top: 10px;" >
				<select name="category" class="infoData">
					<option value="">:::나라를 선택하세요:::</option>
					<option value="101">프랑스</option>
					<option value="201">영국</option>
					<option value="301">포루투갈</option>
					<option value="401">스페인</option>
					<option value="501">이탈리아</option>
					<option value="601">독일</option>
					<option value="901">벨기에</option>
					<option value="1001">헝가리</option> 
					
				</select>
				<span class="error">필수입력</span>
			</td>	
		</tr>
		<tr>
			<td width="20%" class="prodInputName">이름 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="name" class="box infoData" />
				<span class="error">필수입력</span>
			</td>
		</tr>
		<tr>
			<td width="20%" class="prodInputName">이미지</td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;">
				<input type="file" name="image" class="infoData" /><span class="error">필수입력</span>
			</td>
		</tr>		
		<tr>
			<td width="20%" class="prodInputName">코멘트</td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;">
				<textarea name="comments" rows="5" cols="60"></textarea>
				<span class="error">필수입력</span>
			</td>
		</tr>
		<tr>
			<td width="20%" class="prodInputName">주소 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="addr" class="box infoData" />
				<span class="error">필수입력</span>
			</td>
		</tr>	
		<tr>
			<td width="20%" class="prodInputName">영업시간 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="worktime" class="box infoData" />
				<span class="error">필수입력</span>
			</td>
		</tr>	
		
		<tr style="height: 70px;">
			<td colspan="2" align="center" style="border-left: hidden; border-bottom: hidden; border-right: hidden;">
			    <input type="button" value="제품등록" id="btnRegister" /> 
			    &nbsp;
			    <input type="reset" value="취소" />	
			</td>
		</tr>
	</tbody>
	</table>
	</form>
</div>




<div id="tour" class="tabcontent"  align="left" style="background-color: white; width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
	<form name="tourInputFrm" 
	      action="<%= request.getContextPath() %>/adminRegisterEnd.action"
	      method="post"
	      enctype="multipart/form-data">
	    <%--  파일 업로드를 사용하기 위해서 form은 항상 post방식이어야 하며,
	          enctype을  enctype="multipart/form-data" 으로 지정해 주어야 한다. --%>
	<table id="tblProdInput" style="width: 100%;">	
	<tbody>
		<tr>
			<td width="20%" class="prodInputName" style="padding-top: 10px;">카테고리<input type="hidden" name="tbl" value="tour"/></td>
			<td width="80%" align="left" style="padding-top: 10px;" >
				<select name="category" class="infoData2">
					<option value="">:::나라를 선택하세요:::</option>
					<option value="101">프랑스</option>
					<option value="201">영국</option>
					<option value="301">포루투갈</option>
					<option value="401">스페인</option>
					<option value="501">이탈리아</option>
					<option value="601">독일</option>
					<option value="901">벨기에</option>
					<option value="1001">헝가리</option> 
					
				</select>
				<span class="error">필수입력</span>
			</td>	
		</tr>
		<tr>
			<td width="20%" class="prodInputName">이름 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="name" class="box infoData2" />
				<span class="error">필수입력</span>
			</td>
		</tr>
		<tr>
			<td width="20%" class="prodInputName">이미지</td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;">
				<input type="file" name="image" class="infoData2" /><span class="error">필수입력</span>
			</td>
		</tr>		
		<tr>
			<td width="20%" class="prodInputName">가격(원) </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="input" id="price" name="price" class="box infoData2"/>
				<span class="error">필수입력</span>
			</td>
		</tr>	
		<tr>
			<td width="20%" class="prodInputName">홈페이지 주소 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="addr" class="box infoData2" />
				<span class="error">필수입력</span>
			</td>
		</tr>	
		
		<tr style="height: 70px;">
			<td colspan="2" align="center" style="border-left: hidden; border-bottom: hidden; border-right: hidden;">
			    <input type="button" value="제품등록" id="btnRegister2" /> 
			    &nbsp;
			    <input type="reset" value="취소" />	
			</td>
		</tr>
	</tbody>
	</table>
	</form>
</div>



<div id="book" class="tabcontent"  align="left" style="background-color: white; width:70%; border: 1px solid #e5e5e5; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px;">
	<form name="bookInputFrm" 
	      action="<%= request.getContextPath() %>/adminRegisterEnd.action"
	      method="post"
	      enctype="multipart/form-data">
	    <%--  파일 업로드를 사용하기 위해서 form은 항상 post방식이어야 하며,
	          enctype을  enctype="multipart/form-data" 으로 지정해 주어야 한다. --%>
	<table id="tblProdInput" style="width: 100%;">	
	<tbody>
		<tr>
			<td width="20%" class="prodInputName" style="padding-top: 10px;">카테고리<input type="hidden" name="tbl" value="book"/></td>
			<td width="80%" align="left" style="padding-top: 10px;" >
				<select name="category" class="infoData2">
					<option value="">:::나라를 선택하세요:::</option>
					<option value="101">프랑스</option>
					<option value="201">영국</option>
					<option value="301">포루투갈</option>
					<option value="401">스페인</option>
					<option value="501">이탈리아</option>
					<option value="601">독일</option>
					<option value="901">벨기에</option>
					<option value="1001">헝가리</option> 
					
				</select>
				<span class="error">필수입력</span>
			</td>	
		</tr>
		<tr>
			<td width="20%" class="prodInputName">이름 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="name" class="box infoData2" />
				<span class="error">필수입력</span>
			</td>
		</tr>
		<tr>
			<td width="20%" class="prodInputName">이미지</td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;">
				<input type="file" name="image" class="infoData2" /><span class="error">필수입력</span>
			</td>
		</tr>		
		<tr>
			<td width="20%" class="prodInputName">가격(원) </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="input" id="price" name="price" class="box infoData2"/>
				<span class="error">필수입력</span>
			</td>
		</tr>	
		<tr>
			<td width="20%" class="prodInputName">홈페이지 주소 </td>
			<td width="80%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				<input type="text" style="width: 300px;" name="addr" class="box infoData2" />
				<span class="error">필수입력</span>
			</td>
		</tr>	
		
		<tr style="height: 70px;">
			<td colspan="2" align="center" style="border-left: hidden; border-bottom: hidden; border-right: hidden;">
			    <input type="button" value="제품등록" id="btnRegister2" /> 
			    &nbsp;
			    <input type="reset" value="취소" />	
			</td>
		</tr>
	</tbody>
	</table>
	</form>
</div>


</div>

</div>