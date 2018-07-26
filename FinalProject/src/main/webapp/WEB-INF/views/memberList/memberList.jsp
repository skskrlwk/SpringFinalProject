<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">

<script type="text/javascript">


	function goMemberDelete(userid){
		
		var bool = confirm(userid + " 회원님을 삭제하시겠습니까?");
		
		if(bool) {
			$("#userid").val(userid);
			var frm = document.member;
			
			frm.method = "post";
			frm.action = "/finalproject/memberDelete.action";
			frm.submit();
		}
	}
	
	function goMemberRecover(userid){
		
		var bool = confirm(userid + " 회원님을 복구하시겠습니까?");
		
		if(bool) {
			$("#userid").val(userid);
			var frm = document.member;
			
			frm.method = "post";
			frm.action = "/finalproject/goMemberRecover.action";
			frm.submit();
		}
	}

</script>


<div class="card mb-3">
   <div class="card-header" style="padding-top: 200px;">
     <h4>회원 정보 리스트</h4>
   </div>
   <div class="card-body"> 
	 <div class="table-responsive">           
		  <table class="table table-bordered" id="dataTable">
		    <thead>
		      <tr>
		        <th>아이디</th>
		        <th>이름</th>
		        <th>이메일</th>
		        <th>전화번호</th>
		        <th>성별</th>
		        <th>회원 상태</th>
		      </tr>
		    </thead>
		    <tbody>
			  <c:if test="${memberlist == null || empty memberlist}">
			  	<tr>
			  	  <td colspan="4"> 저장된 상품이 없습니다. </td>
			  	<tr>
			  </c:if>
			  <c:if test="${memberlist != null && not empty memberlist}">
			  	<c:forEach items="${memberlist}" var="vo">
			  		<tr>
			  		  <td>${vo.userid}</td>
			  		  <td>${vo.name}</td>
			  		  <td>${vo.email}</td>
			  		  <td>${vo.tel}</td>
			  		  <td>
			  		  	<c:if test="${vo.gender == 1}">
			  		  		남자
			  		  	</c:if>
			  		  	<c:if test="${vo.gender == 2}">
			  		  		여자
			  		  	</c:if>
			  		  </td>
			  		  <td>
			  		  	<c:if test="${vo.quitYN == 1}">
				  		  	<button type="button" class="btn btn-primary" style="background-color: #ff0066; font-size: 10pt; font-weight: bold; padding: 1%;" onclick="javascript:goMemberDelete('${vo.userid}');">
								 회원 삭제하기
							</button>
						</c:if>
						<c:if test="${vo.quitYN == 0}">
				  		  	<button type="button" class="btn btn-primary" style="background-color: #007bff; font-size: 10pt; font-weight: bold; padding: 1%;" onclick="javascript:goMemberRecover('${vo.userid}');">
								회원 복구하기
							</button>
						</c:if>
					</td>
			  		</tr>
			  	</c:forEach>
			  </c:if>    
			  
			  <tr>
				<th colspan="5" style="text-align: center;">
					${pageBar}
				</th>
				
				<th colspan="2" style="text-align: right;">
					<span style="color: red; font-weight: bold;">현재[${currentShowPageNo}]페이지</span> / 총[${totalPage}]페이지 &nbsp; 
					회원수 : 총${totalMemberCount}명
				</th>
			</tr>
		    </tbody>
		  </table>
		  
		  
		  
	 </div>  
   </div>
 </div>


<form name="member">
	<input type="hidden" name="userid" id="userid">
</form>