<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
#AdminNotice{
	background-color: #ff8108;
	width: 302px;
}
#longText{
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
}
</style>

<script type="text/javascript">
// $(() => {
// 	$("#title").focus()
	
// 	})
// })

/* 삭제 버튼 */
function deleteBoard(boardNo) {
    if (confirm('정말로 삭제하시겠습니까?')) {
        $.ajax({
            type: "POST",
            url: "/admin/reportList",
            data: { boardNo: boardNo },
            success: function (response) {
                location.reload();
            },
            error: function (e) {
                console.log("에러 발생: ", e);
            }
        });
    }
}

</script>

<!-- 안쪽 내용 -->
<div id="AdminContent">

<div class="col-10 mx-auto">
<form action="./noticeUpdate" method="post" enctype="multipart/form-data">

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content"></textarea>
</div>

<!-- <div class="form-group mb-3"> -->
<!-- 	<label class="form-label" for="file">첨부파일</label> -->
<!-- 	<input type="file" class="form-control" name="file" id="file" multiple="multiple"> -->
<!-- </div> -->

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>
</div><!-- .col-10 mx-auto -->

<hr>

<!-- 작성한 공지 목록 -->
<div>

<table class="table table-striped table-hover table-sm" style="table-layout: fixed">

<colgroup>
	<col style="width: 10%;">
	<col style="width: 20%;">
	<col style="width: 50%;">
	
	<col style="width: 15%;">
	<col style="width: 15%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>게시글번호</th>
		<th>제목</th>
		<th>내용</th>

		<th>작성날짜</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${noticeList }">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td id="longText">${list.TITLE }</td>
		<td id="longText">${list.CONTENT }</td>
		<td>${list.WRITE_DATE}</td>
        <td><button class="delete_btn" onclick="deleteBoard(${list.BOARD_NO})">삭제</button></td>
	</tr>
</c:forEach>
</tbody>
</table>


</div>






</div><!-- .AdminContent -->


</body>
</html>