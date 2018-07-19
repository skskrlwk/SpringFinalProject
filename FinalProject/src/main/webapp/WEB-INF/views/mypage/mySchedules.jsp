<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="center" style="margin-top: 200px;">

	<div style="width: 20%; display: inline-block; border: 1px solid red; vertical-align: top;">
		
		개인정보!
		
	</div>
	
	<div align="left" style="width: 65%; display: inline-block; margin-left: 5%; vertical-align: top;">
		
		<c:forEach var="schedules" items="${myschedules}" varStatus="status">
			
			<button type="button" style="width: 30%; margin-left: 2%; margin-bottom: 2%;">
				<div id="div_myschedules${status.index}" style="display: inline-block;">
					<img src="/finalproject/resources/img/f1.jpg" width="80%" /><br/>
					<span style="font-size: 16pt; font-weight: bold;">${schedules.title}</span><br/>
					<span style="font-size: 12pt; font-weight: bold;">${schedules.startday}&nbsp;~&nbsp;${schedules.endday}</span><br/>
					<span style="font-size: 12pt; font-weight: bold;">(${schedules.days}일)</span>
				</div>
			</button>
			
		</c:forEach>
		
	</div>

</div>