<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.tools.ant.taskdefs.Replace"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
   table, th, td {border: solid gray 1px;}
   
   #table, #table2 {width: 1000px; border-collapse: collapse;}
   
   #table th, #table td {padding: 5px;}
   #table th {width: 120px; background-color: #DDDDDD;}
   #table td {width: 860px;}
   
   a{text-decoration: none;}

</style>

<script type="text/javascript">
   
   $(document).ready(function() {
      var count = ${count};
      
      for (var i = 1; i < count+1; i++) {
         $("#divcomments"+i).hide();
         $("#editcancel"+i).hide();
      }
      
   });
   
   function goWrite() {
      
      var frm = document.addWriteFrm;
      
      var nameval = frm.name.value.trim();
            
      
      if(nameval == "") {
         alert("먼저 로그인 하세요!!");
         return;
      }
      
      var commentsval = frm.comments.value.trim();
      
      if(commentsval == "") {
         alert("댓글 내용을 입력하세요!!");
         return;
      }
      
      var data_form = {fk_userid : frm.fk_userid.value,
                     name : frm.name.value,
                     comments: commentsval,
                     fk_seq_board: frm.fk_seq_board.value};
      
      $.ajax({
         url:"<%= request.getContextPath() %>/addComments.action",
         data: data_form,
         type: "POST",
         dataType: "JSON",
         success: function(json) {
            $.each(json, function(entryIndex, entry){
               
               var html = "<div style='border-bottom: 0px dashed gray; padding-bottom: 2%;'><input type='hidden' name='seq_comment' value=\""+entry.seq_comment+"\" />";
               html += "<a style='text-align: center; font-size:14pt; font-weight:bold; color:black;'>"+entry.name+"</a>";
               html += "<a style='text-align: center; font-size:10pt;'>"+entry.regdate+"</a>";
         
               var name = entry.name;
               if(name == "${sessionScope.loginuser.name}"){
                  html += "<div style=\"float: right;\">|<a >수정</a>|";
                  html += "<a >삭제</a>|</div>";
               }
         
               html += "<div style='padding-left: 4%; padding-right: 4%; color:black; word-break:break-all;'><pre>"+entry.comments+"</pre></div>";            
               html += "</div>";
               
               $("#commentDisplay").append(html);
               
               reload();
            });
         },
         error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
         }
      });
      
      $("#comments").val("");
      
   }
   
   function checkLength(comment) {
       if (comment.value.length > 200 ) {
           comment.blur();
           comment.value = comment.value.substring(0, 200);
           comment.focus();
           return false;
       }
   }

   function delcomment(seq_comment) {
      
      var seq_comment = seq_comment;
   //   alert("seq_comment : " + seq_comment);
      
      $("#deleteSeq").val(seq_comment);
      
      var frm = document.deleteFrm;
      frm.seq_comment.value = seq_comment;
      frm.action = "<%= request.getContextPath() %>/delcomment.action";
      frm.method = "post";
      frm.submit(); 
   }

   function editcomment(seq_comment) {

      $("#divcomments"+seq_comment).show();
      $("#deledit"+seq_comment).hide();
      $("#precomment"+seq_comment).hide();
      $("#editcancel"+seq_comment).show();
      
   }

   function editcancel(count) {
      
      $("#editcancel"+count).hide();
      $("#divcomments"+count).hide();
      $("#precomment"+count).show();
      $("#deledit"+count).show();
   }
   
   function editcommentend(count) {
      
      var frm= document.editcommentFrm;
      frm.seq_comment.value = $("#seq_comment"+count).val();
      frm.comments.value = $("#comments"+count).val();
      
      frm.action="<%= request.getContextPath() %>/editcomment.action";
      frm.method="POST";
      frm.submit();
   }
   
   function reload() {
      var frm = document.editcommentFrm;
      frm.action="<%= request.getContextPath() %>/reload.action";
      frm.method="get";
      frm.submit();
   }
   
   function deleteboard() {
      var frm = document.deleteFrm;
      frm.action="<%= request.getContextPath() %>/del.action";
      frm.method="post";
      frm.submit();
   }
   
</script>
<div style="width: 100%; height: 100%;" >
   <div style=" padding-top:10%; background-size: cover; width: 100%; height: 100%; background-image:url('<%= request.getContextPath() %>/resources/images/oldboard.jpg')">
      <input type="hidden" value="${boardvo.seq_board}"/>
         <div style="border: 1px solid blue; margin: 2% auto; width: 65%; background-color: #ffffff; border-radius: 10px; padding-bottom: 1%;">
            <div style="border-bottom: 1px dashed gray; padding: 1%;">
               <span style="font-size: 20pt; color: black;">${boardvo.title}</span>
               <div align="right">
                  <span>${boardvo.regdate}</span>
               </div>
            </div>
            
            <span style="font-size: 15pt; color: black; margin-bottom: 2%; padding-left: 1%;">${boardvo.name}(${boardvo.fk_userid})</span>
      
            <br/><br/><br/><br/>
            <div style="border: 0px solid red; width: 80%; margin: 0 auto;" oncontextmenu="return false" ondragstart="return false" >
               <span style="font-size: 15pt; color: black;">${boardvo.comments}</span><br/>
               
               <c:if test="${boardvo.filename != null}">
                  <div style="border: 1px solid  #d9b3ff; width: 40%; margin: 0 auto;font-size: 14pt; text-align: center;"><a href="<%= request.getContextPath()%>/download.action?seq_board=${boardvo.seq_board}">${boardvo.orgfilename}</a>
                     <a style="color: #d9b3ff;">↓</a></div>
               </c:if>
               
               
            </div>
         
         <br/>
         
         <span style="margin-left: 85%;">조회수${boardvo.readcount}</span>
            <div style="  border: 0px solid green; margin: 0 auto 2% auto; width: 80%; background-color: #e6e6e6;">
                  <div id="commentDisplay"  style="padding-left: 2%; padding-right: 2%; margin-bottom: 2%;">
                  <c:if test="${not empty commentList}">
                     <c:forEach var="commentvo" items="${commentList}" varStatus="status" >
                        <div style="border-bottom: 1px dashed gray; padding-bottom: 2%;"oncontextmenu="return false" ondragstart="return false">
                           <input type="hidden" id="seq_comment${status.count}" name="seq_comment${status.count}" value="${commentvo.seq_comment}" />
                           <a style="text-align: center; font-size: 14pt; color: black; font-weight: bold;">${commentvo.name}</a>
                           <a style="text-align: center; font-size: 10pt;">${commentvo.regdate}</a>
                              <c:if test="${commentvo.name == sessionScope.loginuser.name}">
                              <div id="deledit${status.count}" style="float: right;">|<a style="cursor: pointer;" onclick="editcomment(${status.count})">수정</a>|
                              <a style="cursor: pointer;" onclick="delcomment(${commentvo.seq_comment})">삭제</a>|</div>
                              <div id="editcancel${status.count}" style="cursor: pointer; float: right;" onclick="editcancel(${status.count})">수정취소</div>
                              </c:if>
                              <br/>
                           <div id="precomment${status.count}" style="padding-left: 4%; padding-right: 4%; color:black; word-break:break-all;" >
                              <pre oncontextmenu="return false" ondragstart="return false">${commentvo.comments} </pre>
                           </div>
                           
                           <div id="divcomments${status.count}" style="border: 0px solid red; height:80px; width:95%; margin-left: 3%; margin-right: 0%; padding-bottom: 2%;">
                              <div style="border: 0px solid green; width:83.3%; float:left">
                                 <textarea rows="3" cols="85"  name="comments" id="comments${status.count}" onKeyUp="checkLength(this);" onKeyDown="checkLength(this);" >${commentvo.comments}</textarea>
                              </div>
                              <div style=" border: 0px solid #d9b3ff; width: 13%;float:left; padding-top: 1%; margin-left: 1%;">
                                 <button type="button" class="btn btn-default" style="width: 100%; font-size: 13pt; font-weight: bold;  padding-top: 11%; padding-bottom: 15%;" onClick="editcommentend(${status.count});">수정완료</button>
                              </div>
                            </div>
                            
                        </div>                           
                     </c:forEach>
                  </c:if> 
               </div>
               <form name="addWriteFrm"  >
                   <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" readonly />
                  <input type="hidden"  name="name" value="${sessionScope.loginuser.name}" readonly /> 
                  <div style="border: 0px solid red; height:80px; width:95%; margin-left: 3%; margin-right: 0%; padding-bottom: 2%;">
                     <div style="border: 0px solid green; width:83.3%; float:left">
                        <textarea rows="3" cols="90"  name="comments" id="comments" onKeyUp="checkLength(this);" onKeyDown="checkLength(this);" ></textarea>
                     </div>
                     <div style=" border: 0px solid #d9b3ff; width: 13%;float:left; padding-top: 1%; margin-left: 1%;">
                        <button type="button" class="btn btn-default" style="width: 100%; font-size: 13pt; font-weight: bold;  padding-top: 11%; padding-bottom: 15%;" onClick="goWrite();">등록</button>
                     </div>
                   </div>
                   <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) -->   
                  <input type="hidden" name="fk_seq_board" value="${boardvo.seq_board}" />
               </form> 
               <div style="border:0px solid red;  width: 45%; margin-top: 1%; margin-left: 53%; text-align: right; padding-bottom: 2%;">
                  <button type="button" onclick="javascript:location.href='<%= request.getContextPath() %>/${goBackURL}'">목록 보기</button>
                  <button type="button" onclick="javascript:location.href='<%= request.getContextPath() %>/boardadd.action?fk_seq=${boardvo.seq_board}&groupno=${boardvo.groupno}&depthno=${boardvo.depthno}'">답변쓰기</button>
                  <c:if test="${boardvo.fk_userid == sessionScope.loginuser.userid}">
                     <button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/edit.action?seq_board=${boardvo.seq_board}'">수정</button>
                     <button type="button" onClick="deleteboard();">삭제</button>
                  </c:if>
               </div>
            </div><!--  green -->
         </div><!-- blue -->
   </div><!-- red -->
</div>

<form name="deleteFrm">
   <input type="hidden" id="deleteSeq" name="seq_comment">
   <input type="hidden" id="seq_board" name="seq_board" value="${boardvo.seq_board}">
   <input type="hidden" id="goBackURL" name="goBackURL" value="${goBackURL}">
   
 </form>

<form name = "editcommentFrm">
   <input type="hidden" id="editseq" name="seq_comment">
   <input type="hidden" id="editcomment" name="comments">
   <input type="hidden" id="seq_board" name="seq_board" value="${boardvo.seq_board}">
   <input type="hidden" id="goBackURL" name="goBackURL" value="${goBackURL}">
</form>
