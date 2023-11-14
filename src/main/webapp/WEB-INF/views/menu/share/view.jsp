<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(() => {
	
	$(".content").summernote({
		height: 300
	})
})

// 추천
$(function(){
	$("#like").click(function(){
	
	  $.ajax({
         type: "get"
         , url: "/menu/share/like"
         , data: {
        	 boardNo : ${view.boardNo}
         }
         , dataType: "json"
         , success: function( res ) {
            console.log("AJAX 성공")
			
            if(res.isLike){
            	$("#like").html("추천취소")
            	$("#likeCount").html(res.likeCount)
            } else {
            	$("#like").html("추천하기")
            	$("#likeCount").html(res.likeCount)
            }
         }
         , error: function() {
            console.log("AJAX 실패")

         }
      })	
	})
})

//댓글
$(function(){
	$("#btnComment").click(function(){
		console.log("안녕")
	  $.ajax({
	         type: "post"
	         , url: "/menu/share/commentinsert"
	         , data: {
	        	 boardNo : ${view.boardNo},
				 content : $("#content").val()
	         }
	         , success: function( res ) {
	            console.log("AJAX 성공")
	            console.log(res)
	            $("#content").val('')
	            $("#commentPlace").html(res)

	         }
	         , error: function() {
	            console.log("AJAX 실패")

	         }
	      })
	})
	
})

$(function(){
	   $.ajax({
	         type: "get"
	         , url: "/menu/share/commentlist"
	         , data: {
				boardNo : ${view.boardNo}
	         }
	         , dataType: "html"
	         , success: function( res ) {
	            console.log("AJAX 성공")
	            $("#commentPlace").html(res)

	         }
	         , error: function() {
	            console.log("AJAX 실패")

	         }
	      })
		
})

</script>

<table class="table table-boardered">

<colgroup>
	<col style="width: 15%;">
	<col style="width: 35%;">
	<col style="width: 15%;">
	<col style="width: 35%;">
</colgroup>

<tr>
	<td class="table-info">글번호</td><td colspan="3">${view.boardNo }</td>
</tr>

<tr>
	<td class="table-info">아이디</td><td>${view.writerId }</td>
</tr>
<tr>
	<td class="table-info">조회수</td><td>${view.hit }</td>
	<td class="table-info">작성일</td><td><fmt:formatDate value="${view.writeDate}" pattern="yyyy-MM-dd" />
</tr>

<tr>
	<td class="table-info">제목</td><td>${view.title }</td>
	<td class="table-info">파일</td>
<tr>
	<c:forEach var="file" items="${boardfile }">
	
	<td><a href="/menu/share/upload/${file.storedName}" download="${file.originName }">${file.originName }</a></td>
	</c:forEach>
</tr>
<tr>
	<td class="table-info">가격</td><td>${view.price}</td>
</tr>
<tr>
	<td class="table-info">추천수</td><td id="likeCount">${likeCount}</td>
		<td><button id="like">추천하기</button></td>
</tr>
<tr>
	<td class="table-info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">
		<div class="content">
			${view.content }
		</div>
	</td>
</tr>
</table>
<div class="text-center">
		<a href="/menu/share/list?menu=${view.menu}" class="btn btn-secondary">목록으로</a>
	
	<c:if test="${id eq view.writerId }">
		<a href="/menu/share/update?=${view.boardNo }&menu=${view.menu}"><button class="btn btn-success mt-2" id="btnUpdate">글 수정</button></a>
		<a href="./delete?boardNo=${view.boardNo }&menu=${view.menu}" class="btn btn-danger">삭제</a>
	</c:if>
</div>
<!-- 댓글 처리 -->
<hr>

	<!-- 비로그인상태 -->
	<c:if test="${not isLogin }">
	<strong>로그인이 필요합니다</strong><br>
	<button onclick='location.href="/user/login";'>로그인</button>
	<button onclick='location.href="/user/sign";'>회원가입</button>
	</c:if>
	
	<!-- 로그인상태 -->
	<c:if test="${isLogin }">
	<!-- 댓글 입력 -->
	<div class="row justify-content-around align-items-center">
		<div class="col-2">
			<input type="text" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
		</div>
		<div class="col-9">
			<textarea class="form-control" name="content" id="content"></textarea>
			
		</div>
		<button id="btnComment" class="btn btn-primary col-1">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<div id="commentPlace"></div>



<c:import url="/WEB-INF/views/layout/footer.jsp"/>
