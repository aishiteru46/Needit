<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
#AdminBusiness{
	background-color: #ff8108;
	width: 302px;
}

#tableWrapper th{
	position: sticky;
    top: 0px;
}
#tableWrapper{
	overflow-x: hidden;
	overflow-y: scroll;
	height: 213px;
}

#AdminContent{
	width: 80%;
}
</style>

<script type="text/javascript">
/* 승인 버튼 */
$(function(){
	
	$("#yes").click(function(){
    	console.log("승인")
		$.ajax({
	       type: "POST",
	       url: "/admin/businessReq",
	       data: {
	    	   
	    	   id: '${id}' 
	    	   
	       },
	       success: function(response) {
	       },
	       error: function(xhr, status, error) {
	       }
	   });
   	})
   
    $("#no").click(function(){
   	console.log("취소")
	$.ajax({
	       type: "POST",
	       url: "/admin/businessReq",
	       data: {
	    	   
	    	   id: '${id}' 
	    	   
	       },
	       success: function(response) {
	       },
	       error: function(xhr, status, error) {
	       }
	   });
   	})
    

})

</script>


<!-- 안쪽 내용 -->
<div id="AdminContent">

<div id="tableWrapper">
<table class="table table-striped table-sm">

<colgroup>
	<col style="width: 10%;">
	<col style="width: 10%;">
	<col style="width: 20%;">
	<col style="width: 20%;">
	<col style="width: 20%;">
	
	<col style="width: 10%;">
	<col style="width: 10%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>아이디</th>
		<th>업체 이름</th>
		<th>업체 주소</th>
		<th>업체 전화번호</th>
		<th>업체 URL</th>

		<th>승인</th>
		<th>취소</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${businessList }">
	<tr>
		<td>${list.ID }</td>
		<td>${list.BUSINESS_NAME }</td>
		<td>${list.BUSINESS_ADDR }</td>
		<td>${list.BUSINESS_PHONE }</td>
		<td>${list.BUSINESS_URL }</td>
		
		<td><button id="yes">승인</button></td>
		<td><button id="no">취소</button></td>
	</tr>
</c:forEach>
</tbody>
</table>

</div><!-- #tableWrapper -->
</div><!-- #AdminContent -->

</body>
</html>