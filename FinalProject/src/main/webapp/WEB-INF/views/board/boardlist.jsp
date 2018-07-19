<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">

<script type="text/javascript">
 $(document).ready(function () {
	 $(".title").hover(function(event){
			 var $target = $(event.target);
			 $target.addClass("titlestyle");
	       }, function(event){
	         var $target = $(event.target);
			 $target.removeClass("titlestyle");
	        }
		);
		searchKeep();
		ShowRank();
		
		$('#search').keyup(function() { 
			
			var search = $('#search').val();
			if(search == "") {
				$("#searchan").empty();
				return;	
			}
			var frm = document.searchFrm

			
			var data_form = {search : frm.search.value};
			
			$.ajax({
				url:"<%= request.getContextPath() %>/titleList.action",
				data: data_form,
				type: "GET",
				dataType: "JSON",
				success: function(json) {
					$("#searchan").empty();
					var html = "";
					
					$.each(json, function(entryIndex, entry){
						
						var title = entry.title;
						html += "<label style='cursor: pointer;' onclick='goSearch2(\""+ title+"\");'>"+ entry.title + "</label><br/>";

					});
					$("#searchan").html(html);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});

		});
		
		

	

});
 
 function gowrite() {
	 location.href="<%= request.getContextPath() %>/boardadd.action";
}

 function goView(seq_board) {
		
		var frm = document.goViewFrm;
		frm.seq_board.value = seq_board;
		
		frm.action = "boardview.action";
		frm.method = "get";
		frm.submit();
	}// end of function goView()---------------------
	
	
	function goSearch() {
		
		var frm = document.searchFrm;

		frm.action = "<%= request.getContextPath() %>/boardlist.action"; 
		frm.method = "GET";
		frm.submit();
	}
	
	function goSearch2(title) {
		
		
		var frm = document.searchFrm;
		frm.search2.value="2";
		
		frm.search.value = title;
		frm.action = "<%= request.getContextPath() %>/boardlist.action"; 
		frm.method = "GET";
		frm.submit();
	}
	
	
	function searchKeep() {
		<c:if test="${ (colname != 'null' && not empty colname) && (search != 'null' && not empty search) }">       
		   $("#colname").val("${colname}");
		   $("#search").val("${search}");
		</c:if>
	}
	
	function nowsearch() {
		$.ajax({
			url:"<%= request.getContextPath() %>/nowsearch.action",
			type: "GET",
			dataType: "JSON",
			success: function(json) {
				
				var html = "<label style='color:black;'>실시간 검색어 순위</label></br>";
				
				$.each(json, function(entryIndex, entry){
					
					var title = entry.title;
					html += "<label style='cursor: pointer;' onclick='goSearch2(\""+ title+"\");'>"+(entryIndex+1)+"."+ entry.title + "</label><br/>";

				});
				$("#nowsearch").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}	
	
	function ShowRank() {
		
		nowsearch();
		var timejugi = 10000;   // 시간을 10초 마다 자동 갱신하려고.
		
		setTimeout(function() {
						ShowRank();	
					}, timejugi);
	}

</script>

<style type="text/css">
 .titlestyle {text-decoration: underline;
 			cursor: pointer;}
</style>
<div style="margin-bottom: 2%;">
	<img src="<%= request.getContextPath() %>/resources/images/board.jpg" style="width: 100%; height: 450px;">
</div>

<div style="height: 700px; border: solid 0px red;  width: 80%; margin: 0 auto;" >
<h2>자 유 게 시 판</h2>
	<hr style="border-color:black;"/>
	<div style="border: 0px solid green; width:80%; float: left ">
	<div style="margin-top:2%; margin-left: 60%; border: 0px solid red; width:38%; ">
		<form name="searchFrm">
			<select name="colname" id="colname" style="height: 26px;"> 
				<option value="title">글제목</option> 
				<option value="comments">내용</option>
				<option value="name">작성자</option>
			</select>
			<input type="text"  name="search" id="search" size="40" />
			<button type="button" onClick="goSearch();">검색</button>
			<div id="searchan" style="border: 0px solid blue;"></div>
			<input type="hidden" name="search2" id="search2" value="1"/>
		</form>
	</div>
	  <table style="margin-top: 1%;" class="table table-condensed">
	    <thead>
	      <tr>
	        <th style="width:5%; text-align: center;">번호</th>
	        <th style="width:60%; text-align: center;">제목</th>
	        <th style="width:8%; text-align: center;">작성자</th>
	        <th style="width:8%; text-align: center;">작성일</th>
	        <th style="width:5%; text-align: center;">조횟수</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:if test="${!empty boardList}">
	      <c:forEach var="boardvo" items="${boardList}">
				<tr>
					<td align="center">${boardvo.seq_board}</td>
					<td>
					    <c:if test="${boardvo.fk_seq == 0}">
						    <c:if test="${boardvo.commentcount > 0}">
						        <span class="title" onClick="goView('${boardvo.seq_board}');">${boardvo.title}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super;">[${boardvo.commentcount}]</span></span> 
						    </c:if>
						    <c:if test="${boardvo.commentcount == 0}">
						        <span class="title" onClick="goView('${boardvo.seq_board}');">${boardvo.title}</span>
						    </c:if>
					    </c:if>				   
					    					    
					    
					    <!-- 답변글인 경우 -->
					    <c:if test="${boardvo.fk_seq > 0}">
					    	<c:if test="${boardvo.commentcount > 0}">																	<!-- depthno : 원글일 경우 0, 답변일경우 1 -->
						        <span class="title" onClick="goView('${boardvo.seq_board}');"><span style="color : red; font-style: italic; padding-left: ${boardvo.depthno*20}px;">└Re.&nbsp;&nbsp;</span>${boardvo.title}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super;">[${boardvo.commentcount}]</span></span> 
						    </c:if>
						    <c:if test="${boardvo.commentcount == 0}">
						        <span class="title" onClick="goView('${boardvo.seq_board}');"><span style="color : red; font-style: italic; padding-left: ${boardvo.depthno*20}px;">└Re.&nbsp;&nbsp;</span>${boardvo.title}</span>
						    </c:if>
					    </c:if>
					    
					</td>
					<td align="center">${boardvo.name}</td>
					<td align="center">${boardvo.regdate}</td>
					<td align="center">${boardvo.readcount}</td>
				</tr>

			</c:forEach>			
	      </c:if>
		<c:if test="${empty boardList}">
		 <tr><td colspan="5" align="center">해당 자료가 없습니다.</td></tr>
		</c:if>
      
	    </tbody>
	  </table>
	
	<button type="button" style="color: black; float: right;" onclick="gowrite();">글쓰기</button>
	<br/>
	<div align="center" style="border:0px solid green; width: 100%;" > 
		${pagebar}
	</div>
	
	</div>
	<div id="nowsearch" style="border: 0px solid yellow; width: 20%; float: left; padding-left: 2%;" align="left">
	</div>
	<form name="goViewFrm">
		<input type="hidden" name="seq_board" />
		<input type="hidden" name="goBackURL" value="${goBackURL}" />
	</form>
	
	
</div>


</div>