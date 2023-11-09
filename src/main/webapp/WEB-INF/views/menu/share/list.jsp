<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

 .write-container {
    border: 1px solid #ccc;
    border-right: 1px solid #ccc;
}

.write-container select {
    width: 320px;
    height: 30px;
}

.row {
	text-align: center;
}

.write-container {
    height: 380px;
    width: 350px;
    margin: 1em auto; 
    text-align: center; 
}

.col-md-4 {
    margin-right: 30px;
}

</style>


</style>
</head>
<body>

<h1>물품 게시판</h1>

<a href=""></a>

<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
 	 <div class="write-container col-md-4" >
  		<select>
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  		</select>
  		<div>
   		 <p>이미지</p>
  		</div>
   		 <a href="/menu/share/view?boardNo=${list.boardNo }">${list.title }</a>
    	<p>${list.writerId }</p>
    	<p>${list.price} ${list.hit}</p>
  </div>
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
  <br>
</c:forEach>

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
		<th>지역</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${list }">

<div>


</div>

<tr>
	<td></td>
	<td>
		<a href="/menu/share/view?boardNo=${list.boardNo }">${list.title }</a>
	</td>
	<td>${list.writerId }</td>
	<td></td>
	<td>${list.hit}</td>
	<td>
		<fmt:formatDate value="${list.writeDate}" pattern="yyyy-MM-dd" />
	</td>
	<td></td>
	<td></td>
</tr>
</c:forEach>
</tbody>
</table>

<a href="/menu/share/write"><button>글쓰기</button></a>

<small class="float-end mb-3">total : ${paging.totalCount }</small>



<c:import url="/WEB-INF/views/layout/pagination.jsp"/>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
