<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<c:import url="/WEB-INF/views/layout/header.jsp" />    


<script type="text/javascript">
$(()=>{
// 	if(${isLike}) {
// 		$("#btnLike")
// 			.addClass("btn-warning")
// 			.html('추천 취소');
// 	} else {
// 		$("#btnLike")
// 			.addClass("btn-primary")
// 			.html('추천');
// 	}
	
// 	$("#btnLike").click(()=>{
		
// 		$.ajax({
// 			type: "get"
// 			, url: "/menu/please/like"
// 			, data: { "boardNo": '${viewBoard.boardNo }' }
// 			, dataType: "json"
// 			, success: function( data ) {
// 					console.log("성공");
	
// 				if( data.result ) { //추천 성공
// 					$("#btnLike")
// 					.removeClass("btn-primary")
// 					.addClass("btn-warning")
// 					.html('추천 취소');
				
// 				} else { //추천 취소 성공
// 					$("#btnLike")
// 					.removeClass("btn-warning")
// 					.addClass("btn-primary")
// 					.html('추천');
				
// 				}
				
// 				//추천수 적용
// 				$("#like").html(data.cnt);
				
// 			}
// 			, error: function() {
// 				console.log("실패");
// 			}
// 		}); //ajax end
		
// 	}); //$("#btnRecommend").click() end
	
	

	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"boardNo",
				value:"${viewBoard.boardNo }"
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end
	
});

function deleteComment(commentNo) {
	$.ajax({
		type: "post"
		, url: "/menu/please/comment/delete"
		, dataType: "json"
		, data: {
			commentNo: commentNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}


</script>

<style type="text/css">
.content {
	min-height: 300px;
}
</style>


<div class="container">
<h1>게시글 상세보기</h1>
	
	<div class="position-absolute end-0 top-0 mt-2 me-2">
	<button id="btnLike" class="btn"></button>
	</div>

<hr>


<table class="table table-bordered">


<colgroup>
	<col style="width: 15%;">
	<col style="width: 35%;">
	<col style="width: 15%;">
	<col style="width: 35%;">
</colgroup>

<tr>
	<td class="table-info">글번호</td><td colspan="3">${viewBoard.boardNo }</td>
	<td class="table-info">추천수</td><td id="like">${cntLike }</td>
</tr>
<tr>
	<td class="table-info">아이디</td><td>${viewBoard.writerId }</td>
	<td class="table-info">닉네임</td><td>${viewBoard.writerNick }</td>
</tr>
<tr>
	<td class="table-info">조회수</td><td>${viewBoard.hit }</td>
	<td class="table-info">작성일</td>
	<td><fmt:formatDate value="${viewBoard.writeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="table-info">제목</td><td colspan="3">${viewBoard.title }</td>
</tr>
<tr>
	<td class="table-info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">
		<div class="content">
		
			<%-- 이미지 표시 부분 --%>
			<c:forEach var="filetb" items="${fileTb }">
			  <c:if test="${not empty filetb.storedName }">
			    <img src="<c:url value='/update/fileNo=${filetb.fileNo }' />" alt="${filetb.originName }" />
			  </c:if>
			</c:forEach>
		
		${viewBoard.content }
		</div>
		
	
		
	</td>
</tr>

</table>




<div class="text-center">
	<a href="/menu/please/list?menu=${viewBoard.menu}" class="btn btn-secondary">목록</a>
	
	<c:if test="${id eq viewBoard.writerId }">
		<a href="/menu/please/update?boardNo=${viewBoard.boardNo }&menu=${viewBoard.menu}" class="btn btn-primary">수정</a>
		<a href="./delete?boardNo=${viewBoard.boardNo }&menu=${viewBoard.menu}" class="btn btn-danger">삭제</a>
	</c:if>
</div>





<!-- 댓글 처리 -->
<hr>
<div>

	<!-- 비로그인상태 -->
	<c:if test="${not login }">
	<strong>로그인이 필요합니다</strong><br>
	<button onclick='location.href="/member/login";'>로그인</button>
	<button onclick='location.href="/member/join";'>회원가입</button>
	</c:if>
	
	<!-- 로그인상태 -->
	<c:if test="${login }">
	<!-- 댓글 입력 -->
	<div class="row justify-content-around align-items-center">
		<div class="col-2">
			<input type="text" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
		</div>
		<div class="col-9">
			<textarea class="form-control" id="commentContent"></textarea>
		</div>
		<button id="btnCommInsert" class="btn btn-primary col-1">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed text-center">
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 50%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
	<tr>
		<th>번호</th>
		<th>작성자</th>
		<th>댓글</th>
		<th>작성일</th>
		<th></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="comment">
	<tr data-commentno="${comment.commentNo }">
		<td>${comment.rnum }</td>
		<td>${comment.writerId }</td>
		<td class="text-start">${comment.content }</td>
		<td><fmt:formatDate value="${comment.writeDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
		<td>
			<c:if test="${sessionScope.id eq comment.writerId }">
			<button class="btn btn-warning btn-xs" onclick="deleteComment(${comment.commentNo });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</table><!-- 댓글 리스트 end -->

</div><!-- 댓글 처리 end -->










</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />