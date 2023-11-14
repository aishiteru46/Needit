<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
// $(function(){
// 	$(".btnDelete").click(function(){
// 		var cmtNo = $(this).attr('id')
// 		console.log(cmtNo)
// 		var boardNo = ${board.boardNo}
// 		console.log(boardNo)
// 	  $.ajax({
// 	         type: "post"
// 	         , url: "/comment/delete"
// 	         , data: {
// 	        	 cmtNo : cmtNo,
// 	        	 boardNo : boardNo
	        	 
// 	         }
// 	         , dataType: "html"
// 	         , success: function( res ) {
// 	            console.log("AJAX 성공")
	     
// 	            commentload()

// 	         }
// 	         , error: function() {
// 	            console.log("AJAX 실패")

// 	         }
// 	      })
// 	})
	
// })

// function commentload(){
//   $.ajax({
//         type: "get"
//         , url: "/menu/share/commentlist"
//         , data: {}
//         , dataType: "html"
//         , success: function( res ) {
//            console.log("AJAX 성공")
//            $("#commentPlace").html(res)

//         }
//         , error: function() {
//            console.log("AJAX 실패")

//         }
//      })
// }
		

</script>
<style type="text/css">
table, th {
	text-align:center;
}

th {
	height:30px;
}
/* 게시글 제목 */
td:nth-child(2) {
	text-align:left;
}

</style>

<div class="container">

<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width:10%;">
	<col style="width:60%;">
	<col style="width:10%;">
	<col style="width:20%;">
</colgroup>

<thead>
	
	<tr class="table-danger">
		<th>작성자</th>
		<th>내용</th>
		<th>날짜</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<c:forEach var="comment" items="${commentList }">
<tr>
	<td>${comment.writerId }</td>
	<td>${comment.content }</td>
	<td>
		<fmt:formatDate value="${comment.writeDate}" pattern="yyyy-MM-dd" />
	</td>
	<c:if test="${comment.writerId eq id}">
	<td><button class="btnDelete" id="${comment.cmtNo }">삭제</button></td>
	</c:if>
</tr>
</c:forEach>
</tbody>
</table>

</div><!-- .container -->


