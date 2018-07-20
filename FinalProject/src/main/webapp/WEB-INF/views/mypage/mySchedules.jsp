<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	.btn_myschedules {
		width: 19%;
		margin-left: 2%;
		margin-bottom: 2%;
		padding-top: 1%;
		padding-bottom: 1%;
		border: solid 0px grey;
		border-radius: 12px;
		background-color: #ddddff;
	}
	
</style>

<div class="home_slider_background" style="background-image: url('/finalproject/resources/images/bg_mypage.jpg'); background-size: 100%;"></div>

<div align="center" style="padding-top: 200px;">
	
	<div align="left" style="width: 90%; display: inline-block; margin-left: 5%; vertical-align: top;">
		
		<c:forEach var="schedules" items="${myschedules}" varStatus="status">
			
			<a href="../ScheduleDetail.action?seq=${schedules.seq_schedule}">
				<button type="button" class="btn_myschedules">
					<div id="div_myschedules${status.index}" align="center" style="width: 100%; display: inline-block; padding: 1%;">
						<div style="width: 80%; overflow: hidden;">
							<img src="/finalproject/resources/images/city/${schedules.imgsrc}" height="300px" />
						</div><br/>
						<span style="font-size: 16pt; font-weight: bold;">${schedules.title}</span><br/>
						<span style="font-size: 12pt; font-weight: bold;">${schedules.startday}&nbsp;~&nbsp;${schedules.endday}</span><br/>
						<span style="font-size: 12pt; font-weight: bold;">(${schedules.days}일)</span>
					</div>
				</button>
			</a>
			
		</c:forEach>
		
		<div id="div_myschedules${status.index}" style="display: inline-block; padding: 1%;">
			
		</div>
		
	</div>

</div>