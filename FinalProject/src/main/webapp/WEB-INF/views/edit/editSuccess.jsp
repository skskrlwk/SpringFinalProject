<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script type="text/javascript">
 
    
</script>



<!-- Home -->

	<div class="home">
		
		<div class="home_slider_container">
			
			
			<!-- Image by https://unsplash.com/@anikindimitry -->
			<div class="home_slider_background" style="background-image:url(<%= request.getContextPath() %>/resources/images/registerSuccess.jpg)"></div>
			<div class="register_slider_content">
					<br/><br/><br/><br/><br/><br/>
				<div class="home_slider_content_inner" style="width: 800px; height: 400px; margin: auto;" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
					
					<div style="float: left; width: 352px; height: 450px; margin: auto;">
						<a href="<%=request.getContextPath()%>/scheduleAdd.action">
							<img src="<%= request.getContextPath() %>/resources/images/scheduleAdd.jpg" width="350px" height="350px" style="display:block;" >
							<button style="margin-left: 7%;" class="button search_button" onClick="javascript:location.href='<%= request.getContextPath() %>/scheduleAdd.action">나만의 여행 계획 작성하러 가기<span></span><span></span><span></span></button>
						</a>
					</div>
					
					<div style="float: right; width: 352px; height: 450px; margin: auto;">
						<a href="<%=request.getContextPath()%>/index.action">
							<img src="<%= request.getContextPath() %>/resources/images/home_slider.jpg" width="350px" height="350px" style="display:block;" >
							<button style="margin-left: 21%;" class="button search_button" onClick="javascript:location.href='<%= request.getContextPath() %>/index.action">Go to HOME<span></span><span></span><span></span></button>
						</a>
					</div>
				</div>
			</div> 
		
		</div>
		
	</div>
		


  