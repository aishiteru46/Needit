<%@page import="java.util.Date"%>
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



$(function(){
	//추천 버튼 변경
	if(${isLike}) {
		console.log('추천 이미 함')
		$("#likeCount")
			.addClass("btn-warning")
			.html('추천 취소');
	} else {
		console.log('추천 아직 안함')
		$("#likeCount")
			.addClass("btn-primary")
			.html('추천');
	}// 추천 버튼 End.
	
	//추천, 취소 요청Ajax
	$("#likeCount").click(()=>{
		$.ajax({
			type: "GET"
			, url: "/share/like"
			, data: {  
				boardNo : ${board.boardNo }
			}
			, dataType: "JSON"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#likeCount")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#likeCount")
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
	}); //$("#btnLike").click() End.
})
	
//댓글목록 불러오기
function loadComments() {
	$.ajax({
			type: "GET"
         	, url: "/share/comment/list"
         	, data: { 
         		boardNo : ${view.boardNo }
         	}
         	, success: function(res) {
         		console.log("댓글창 반응 성공")
         		console.log(res)

                // 댓글 목록을 가져와서 HTML로 렌더링
                var commentListHtml = "";
         		
         		const id = '${id}'
                for (var i = 0; i < res.commentList.length; i++) {
                	
                    commentListHtml += '<tr data-cmtNo="' + res.commentList[i].cmtNo + '">';
                    commentListHtml += '<td>' + res.commentList[i].cmtNo + '</td>';
                    commentListHtml += '<td>' + res.commentList[i].writerNick + '</td>';
                    commentListHtml += '<td class="text-start">' + res.commentList[i].content + '</td>';
                    commentListHtml += '<td>' + formatDate(new Date(res.commentList[i].writeDate)) + '</td>';
                    commentListHtml += '<td>';
                    if( id && id == res.commentList[i].writerId ) {
	                    commentListHtml += '	<button class="btn btn-danger btn-xs" onclick="deleteComment(' + res.commentList[i].cmtNo + ');">삭제</button>';
                    }
                    commentListHtml += '</td>';
                    commentListHtml += '</tr>';
                    
                }
				
                // 렌더링된 HTML을 해당 <tbody>에 추가
                $("#commentList tbody").html(commentListHtml);
         		
	         }
	         , error: function() {
    	        console.log("댓글창 반응 실패")
	         }
	
	})	
	
	function formatDate(date) {
	    var curDate = new Date();
	    var writeDate = new Date(date);
	
	    var isSameDay = curDate.toDateString() === writeDate.toDateString();
	
	    var year = writeDate.getFullYear().toString().slice(-2); // 년도의 뒤 2자리를 가져옴
	    var month = ('0' + (writeDate.getMonth() + 1)).slice(-2);
	    var day = ('0' + writeDate.getDate()).slice(-2);
	    var hours = ('0' + writeDate.getHours()).slice(-2);
	    var minutes = ('0' + writeDate.getMinutes()).slice(-2);
	    var seconds = ('0' + date.getSeconds()).slice(-2);
	
	    if (isSameDay) {
	        return hours + ':' + minutes + ':' + seconds;
	        
	    } else {
	        return year + '.' + month + '.' + day + ' ' + hours + ':' + minutes;
	    }
	}

}// loadComments() End.

function deleteComment( cmtNo ) {
	console.log("댓글 삭제 버튼 동작! : ", cmtNo )
	
		$.ajax({
			type: "GET"
	     	, url: "/share/comment/delete"
	     	, data: { 
	     		boardNo : ${view.boardNo },
	     		cmtNo : cmtNo
	     	}
	     	, success: function() {
	     		console.log("댓글삭제 성공")
	     		
	     		//댓글창 재 로드
	     		loadComments()
	         }
	         , error: function() {
		        console.log("댓글삭제 실패")
	         }
		})
	
}// deleteComment() End.

$(()=>{
	
	//댓글 리스트 조회
	loadComments()
	
	//댓글 입력 요청
	$("#btnCommInsert").click(function(){
		console.log("댓글 입력 버튼 동작!")
		
		$.ajax({
			type: "POST"
         	, url: "/share/comment/insert"
         	, data: { 
         		boardNo : ${view.boardNo },
         		writerId : "${id }",
         		writerNick : "${nick }",
         		menu : "${param.menu }",
         		cate : "${param.cate }",
         		content : $("#commentContent").val()
         	}
         	, success: function( res ) {
         		console.log("AJAX 성공")
         		
               	// 댓글 입력 성공 시, 댓글 창 비우고 포커스를 주기
               	$("#commentContent").val(""); // 댓글 창 비우기
               	$("#commentContent").focus(); // 댓글 창에 포커스 주기	         		
         		
	         	loadComments() // 페이지 로딩 시 댓글 목록 불러오기
	         }
	         , error: function() {
    	        console.log("AJAX 실패")
	         }
		}) //ajax end
	}) //$("#btnLike").click() End.
});
</script>
<button type="button" style="width: 30px; height: 30px; float: right;" id="report" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportModal">
<div style="width: 25px; height: 25px; margin: -13px -9px;">⚠</div>
</button>
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
	<td class="table-info">작성일</td>
	<td>
	<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
	<fmt:formatDate var="writeDate" value="${view.writeDate }" pattern="yyyyMMdd" />
	<c:choose>
		<c:when test="${writeDate lt curDate }">
			<fmt:formatDate value="${view.writeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${view.writeDate }" pattern="HH:mm" />
		</c:otherwise>
	</c:choose>		
	</td>
</tr>

<tr>
	<td class="table-info">제목</td><td>${view.title }</td>
	<td class="table-info">파일</td>
	<c:forEach var="file" items="${boardfile }">
	<td>
	<a href="/menu/share/upload/${file.storedName}" download="${file.originName }">${file.originName }</a>
	</td>
	</c:forEach>
<tr>
	<td class="table-info">가격</td><td>${view.price}</td>
	<td class="table-info">예약하기</td><td><a href="/share/book?boardNo=${view.boardNo }"><button>예약하기</button></a></td>
	<td>
		<input type="hidden" name="boardNo" value="${view.boardNo }">
	</td>
	
</tr>
<tr>
	<td class="table-info">추천수</td><td id="like">${cntLike }</td>
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
	<%-- 추천버튼 --%>
		<button class="btn" id="likeCount"></button>
<div class="text-center">
		<a href="/share/list?menu=${view.menu}&cate=${param.cate}" class="btn btn-secondary">목록으로</a>
	
	<c:if test="${id eq view.writerId }">
		<a href="/share/update?boardNo=${view.boardNo }&menu=${view.menu}&cate=${param.cate}"><button class="btn btn-success mt-2" id="btnUpdate">글 수정</button></a>
		<a href="/share/delete?boardNo=${view.boardNo }&menu=${view.menu}&cate=${param.cate}" class="btn btn-danger">삭제</a>
	</c:if>
</div>
<!-- 댓글 처리 -->
<hr>

	<%-- 댓글 작성 --%>
<c:if test="${isLogin }">
	<div class="row text-center justify-content-around align-items-center">
		<div class="col col-2">
			<input type="text" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
		</div>
		<div class="col col-9">
			<textarea class="form-control" id="commentContent" style="resize: none; height: 15px;"></textarea>
		</div>
		<button id="btnCommInsert" class="btn btn-primary col-1">작성</button>
	</div>	<!-- 댓글 조회, 작성 End. -->
</c:if><br>

<%-- 댓글 목록 --%>
<div id="commentList">

	<!-- 댓글 리스트 -->
	<table class="table table-condensed text-center">
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
		<th>닉네임</th>
		<th>댓글</th>
		<th>작성일</th>
		<th></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	</table>
	
</div>



<c:import url="/WEB-INF/views/layout/footer.jsp"/>
