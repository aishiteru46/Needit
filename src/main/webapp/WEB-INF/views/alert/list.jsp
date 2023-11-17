<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.alert-back {
	position: absolute;
	top: 10px;
	right: 15px;
	z-index: 999;
}

.wrap-alert {
/* 	top:0px; */
	width: 100%;
	height:100%;
}

ul {
	border-bottom: 1px solid #4E4134;
}

ul:hover {
	font-weight: bold;
	cursor: pointer;
}

li {
	margin-left: -25px;
	color: #4E4134;
}

#newIcon {
	color: white;
	font-size: 10px;
	border: 1px solid green;
	background-color: green;
	border-radius: 3px;
	width: 32px;
	height: 20px;
	display: inline-block;
	z-index: 2;
	vertical-align: middle;
}
#newIcon1 {
	display: inline-block;
	margin-top: 1px;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$(".alert-back").css("cursor","pointer").click(function () {
    	$("#alert").css("left", "0px")
		$("#alert").attr("style", "visibility:hidden")
    	
    });
    
    $(".alertData").click(function() {
		$.ajax({
			type: "post"
			, url: "/alert/read"
			, data: { alertNo: $(this).data("alert") }
			, dataType: "json"
			, success: function( res ) {
				console.log("AJAX 성공")
				loadAlert() // 알람을 읽었을 때 안읽은 알람들을 불러옴
				hasNew() // 알람을 읽었을 때 새로 생긴 알람이 있는지 확인해서 불러옴
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
				
	})
	
})

</script>
</head>
<body>

<div class="wrap-alert">

<img class="alert-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">

<div class="wrap-content">
	<c:forEach var="list" items="${list }">	
	<ul class="alertData" id="alertData" data-alert="${list.alertNo }">
		<li>
			<c:if test="${list.alertStatus eq 0 }"> <div id="newIcon"><div id="newIcon1">NEW</div></div> </c:if>
			<c:if test="${list.menu eq 1 }">[대여]</c:if>
			<c:if test="${list.menu eq 2 }">[나눔]</c:if>
			<c:if test="${list.menu eq 3 }">[해주세요]</c:if>
			<c:if test="${list.menu eq 4 }">[커뮤니티]</c:if>
			<c:if test="${list.menu eq 5 }">[동네업체]</c:if>
			<c:if test="${list.menu eq 6 }">[채팅]</c:if>
		</li>
		<li>
			<c:if test="${list.content eq 1 }">승인 완료 됐습니다.</c:if>
			<c:if test="${list.content eq 2 }">승인 요청 중입니다.</c:if>
			<c:if test="${list.content eq 3 }">승인 취소 됐습니다.</c:if>
			<c:if test="${list.content eq 4 }">${list.sender } 님이 댓글을 남겼습니다.</c:if>
			<c:if test="${list.content eq 5 }">${list.sender } 님에게 새로운 메세지가 왔습니다.</c:if>
			<c:if test="${list.content eq 6 }">${list.sender } 님이 추천 하였습니다.</c:if>
		</li>
	</ul>
	</c:forEach>
</div><!-- .wrap-content  -->

</div><!-- .wrap-alert -->

</body>
</html>