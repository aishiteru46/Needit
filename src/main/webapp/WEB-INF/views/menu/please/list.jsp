<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />
    
<style type="text/css">
table, th {
   text-align: center;
}

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
.preview {
	margin: 15px auto 15px auto;
	width: 300px;
	height: 200px;
	object-fit: cover;
}


/* 게시글 제목 */
td:nth-child(2) {
   text-align: left;
}
</style>

<script type="text/javascript">
$(() => {
   $("#btnWrite").click(() => {
      
      location.href = "./write"
      
//       $(location).attr("href", "./write")
      
   })
})
</script>

<c:forEach items="${list }" var="list" begin="0" end="0">
<c:if test="${ list.menu eq 'm3c1' }">
<h1>해주세요</h1><hr><h1>물품</h1>
</c:if>

<c:if test="${ list.menu eq 'm3c2' }">
<h1>해주세요</h1><hr><h1>인력</h1>
</c:if>

<c:if test="${ list.menu eq 'm3c3' }">
<h1>해주세요</h1><hr><h1>공간</h1>
</c:if>
</c:forEach>
<hr>




<table class="table table-striped table-hover table-sm">

<colgroup>
   <col style="width: 10%;">
   <col style="width: 45%;">
   <col style="width: 15%;">
   <col style="width: 10%;">
   <col style="width: 20%;">
</colgroup>


<thead>
   <tr class="table-danger">
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>조회수</th>
      <th>작성일</th>
   </tr>
</thead>


<tbody>
<c:forEach var="board" items="${list }">
   <tr>
      <td>${board.boardNo }</td>
      <td>
         <a href="./view?boardNo=${board.boardNo }&menu=${board.menu}">${board.title }</a>
      </td>
      <td>${board.writerId }</td>
      <td>${board.hit }</td>
      <td>
         <fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd HH:mm:ss"/>      
      </td>
   </tr>
</c:forEach>
</tbody>



</table>




    <c:forEach var="menuData" items="${list}" begin="0" end="0">
    <a href="/menu/please/write?menu=${menuData.menu}">
        <button id="btnWrite" class="btn btn-primary float-start">글쓰기</button>
    </a>
    </c:forEach>




<small class="float-end mb-3">total : ${paging.totalCount }</small>
<div class="clearfix"></div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />