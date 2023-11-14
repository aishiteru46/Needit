<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">

$(()=>{
	if(${isLike}) {
		console.log('추천 이미 함')
		$("#btnLike")
			.addClass("btn-warning")
			.html('추천 취소');
	} else {
		console.log('추천 아직 안함')
		$("#btnLike")
			.addClass("btn-primary")
			.html('추천');
	}
	
	$("#btnLike").click(()=>{
		
		$.ajax({
			type: "GET"
			, url: "/menu/rent/like"
			, data: {  
				boardNo : ${board.boardNo }
			}
			, dataType: "JSON"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnLike")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnLike")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#like").html(data.cnt);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnLike").click() end
});
</script>

<style type="text/css">
.content {
	min-height: 300px;
}
</style>

<div class="container">

<div class="position-relative">
	<h1>게시글 상세보기</h1>
	<hr>

	<div class="position-absolute end-0 top-0 mt-2 me-2">
	<button id="btnRecommend" class="btn"></button>
	</div>
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
	<td class="table-info">글번호</td><td>${board.boardNo }</td>
	<td class="table-info">추천수</td><td id="like">${cntLike }</td>
</tr>
<tr>
	<td class="table-info">아이디</td><td>${board.writerId }</td>
	<td class="table-info">닉네임</td><td>${board.writerNick }</td>
</tr>
<tr>
	<td class="table-info">조회수</td><td>${board.hit }</td>
	<td class="table-info">작성일</td>
	<td>
	<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
	<fmt:formatDate var="writeDate" value="${board.writeDate }" pattern="yyyyMMdd" />
	<c:choose>
		<c:when test="${writeDate lt curDate }">
			<fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${board.writeDate }" pattern="HH:mm" />
		</c:otherwise>
	</c:choose>		
	</td>
</tr>
<tr>
	<td class="table-info">제목</td><td colspan="3">${board.title }</td>
</tr>
<tr>
	<td class="table-info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">
		<div class="content">
		${board.content }
		</div>
	</td>
</tr>
</table>


<%-- 첨부파일 --%>
<c:forEach var="file" items="${fileTb }">
<a href="./download?fileNo=${file.fileNo }">${file.originName }</a><br>
</c:forEach>

<div style="text-align: center;">
		<button class="btn" id="btnLike"></button>
</div><br>

<div class="text-center">
	<a class="btn btn-success" href="/menu/rent/list?menu=m1c1">목록</a>
	
	<c:if test="${id eq board.writerId }">
		<a href="./update?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
		<a href="./delete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>
	</c:if>
</div>

</div> <!-- .container -->



<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

