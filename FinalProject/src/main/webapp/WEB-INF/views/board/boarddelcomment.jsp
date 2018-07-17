<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	<c:if test="${n == 1}">
		alert("글 삭제 성공!!");
		location.href="<%= request.getContextPath() %>/boardview.action?seq_board=${seq_board}&goBackURL=${goBackURL}";
	</c:if>
	
	<c:if test="${n != 1}">
		alert("글삭제 실패!!");
		location.href="<%= request.getContextPath() %>/boardlist.action";
	</c:if>
	

</script>
    