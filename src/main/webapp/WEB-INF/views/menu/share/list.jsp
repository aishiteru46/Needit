<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

</head>
<body>

<h1>물품 게시판</h1>

<a href=""></a>

<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width:10%;">
	<col style="width:10%;">
	<col style="width:20%;">
	<col style="width:20%;">
	
	<col style="width:10%;">
	<col style="width:10%;">
	<col style="width:10%;">
	<col style="width:10%;">
</colgroup>

<thead>
	
	<tr class="table-success">
		<th>번호</th>
		<th>제목</th>
		<th>작성자아이디</th>
		<th>작성자닉네임</th>
		<th>조회수</th>
		<th>날짜</th>
		<th>추천수</th>
		<th>가격</th>
		<th>지역</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${list }">
<tr>
	<td>${list.boardNo }</td>
	<td>
		<a href="./view?boardNo=${list.boardNo }">${list.title }</a>
	</td>
	<td></td>
	<td></td>
	<td>${list.hit}</td>
	<td>
		<fmt:formatDate value="${list.writeDate}" pattern="yyyy-MM-dd" />
	</td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</c:forEach>
</tbody>
</table>


<c:import url="/WEB-INF/views/layout/pagination.jsp"/>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
