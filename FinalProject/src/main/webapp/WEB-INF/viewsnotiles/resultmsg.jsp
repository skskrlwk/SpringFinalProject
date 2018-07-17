<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	var result1 = "${result1}";
	var result2 = "${result2}";
	var result3 = "${result3}";
	var length = "${length}";
		
	if(result1 == result2 && result3 == length){
		alert("작업 완료!");
		location.href="<%= request.getContextPath()%>/ScheduleDetail.action?seq=${seq}";	
	}else{
		alert("작업 실패!");
		location.href="<%= request.getContextPath()%>/index.action";	
	}
	
</script>    
