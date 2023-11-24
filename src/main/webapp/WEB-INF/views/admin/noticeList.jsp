<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
#NoticeTop{
	text-align: center;
	font-size: 50px;
	margin-bottom: 30px;
}
#NoticeDiv{
	border-bottom: 1px solid black;
	margin-bottom: 15px;
}
#NoticeFloat{
	float: left;
	position: relative;
	width: 50px;
	height: 22px;
	border: 1px solid red;
	font-size: 15px;
	background-color: pink;
	color: red;
	border-radius: 5px;
	text-align: center;
	vertical-align: middle;
	margin-top: 3px;
	margin-right: 4px;
	
}
#NoticeTitleContent{
	width: 1100px;
}
#NoticeTitle{
	display: block;
	height: 100%;
	font-size: 20px;
	font-weight: bold;
	overflow: hidden;
    margin-bottom: 5px;
}
#NoticeContent{
	display: block;
	height: 100%;
	font-size: 16px;
    margin-left: 54px;
}
#NoticeDate{
	display: inline-block;
	float: right;
	position: relative;
	margin-top: -24px;
	margin-right: 10px;
}


</style>

<div style="margin-top: 5%;"></div>

<!-- 공지사항 -->
<div id="NoticeTop">⭐NOTICE.공지사항</div>
<c:forEach var="list" items="${noticeList }">
	<div id="NoticeDiv">
		<div id="NoticeFloat">공지</div>
<%-- <a href="/admin/noticeView?boardNo=${list.boardNo }&menu=4&cate=1"> --%>
	<div id="NoticeTitleContent">
		<span id="NoticeTitle">${list.title }</span>
		<span id="NoticeContent">${list.content }</span>
<!-- </a> -->
	</div><!-- #NoticeTitleContent -->
		<div id="NoticeDate"><fmt:formatDate value="${list.writeDate }" pattern="yyyy-MM-dd"/></div>
	</div><!-- #NoticeDiv -->
</c:forEach>




<c:import url="/WEB-INF/views/layout/footer.jsp" />