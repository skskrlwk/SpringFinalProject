<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	<c:if test="${n == 1}">
		alert("댓글수정 성공!!");
	</c:if>
	
	<c:if test="${n != 1}">
		alert("댓글수정 실패!!");
	</c:if>
	
	location.href="<%= request.getContextPath() %>/boardview.action?seq_board=${seq_board}";
	// 글목록을 보여주는 페이지로 이동

</script>
    