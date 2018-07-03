<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top: 200px;">
	fseferfgaWgaerg
		fwsefefgregaergaergreg<br/>
		fwsefefgregaergaergreg<br/>
		fwsefefgregaergaergreg<br/>
		fwsefefgregaergaergreg<br/>

	<div class="schedulelist" style="width: 24%; float: left;">
		
		fwsefefgregaergaergreg<br/>
		fwsefefgregaergaergreg<br/>
		fwsefefgregaergaergreg<br/>
		
		<c:forEach var="schedule" items="${schedulelist}">
			
			DAYS&nbsp;:&nbsp;<input type="number" value="${schedule.days}" />일
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#categorylistModal">${schedule.fk_category}</button>
			<hr/>
			
		</c:forEach>
		
	</div>
	
	<div class="rightmap" style="width: 74%; float: right;">
	
		여기에 지도가 들어감
	
	</div>
</div>

<!-- Modal -->
<div id="#categorylistModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modal Header</h4>
			</div>
			<div class="modal-body">
				<p>Some text in the modal.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>