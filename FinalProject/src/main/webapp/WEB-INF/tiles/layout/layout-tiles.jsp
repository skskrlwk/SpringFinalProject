<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tiles 를 사용한 메인(시작) 페이지 작성하기</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/bootstrap-3.3.7-dist/css/bootstrap.css">
      
   <%-- 스마트 에디터 구현 시작(no frame 사용시) --%>
   
  <link href="<%=request.getContextPath() %>/resources/smarteditor/css/smart_editor2.css" rel="stylesheet" type="text/css">

  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/lib/jindo2.all.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/lib/jindo_component.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/SE2BasicCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/smarteditor2.min.js" charset="utf-8"></script> 

  <!-- 사진첨부샘플  --> 
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script> 
 
  <%-- 스마트 에디터 구현 끝(no frame 사용시) --%>        
      
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    
  <style type="text/css">
  
  </style>
</head>

<body>
	<div id="mycontainer">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
	
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>