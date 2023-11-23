<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
#AdminReport{
	background-color: #ff8108;
	width: 302px;
}
</style>

<script type="text/javascript">
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

<div id="reportBoard">
<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width: 10%;">
	<col style="width: 30%;">
	<col style="width: 15%;">

	<col style="width: 15%;">
	<col style="width: 20%;">
	<col style="width: 10%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>게시글번호</th>
		<th>제목</th>
		<th>작성자</th>

		<th>신고종류</th>
		<th>작성일</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${reportBoardList }">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.TITLE }</td>
		<td>${list.WRITER_ID }</td>
		<td>${list.REPORT_TYPE }</td>
		<td>${list.REPORT_DATE }</td>
        <td><button class="delete_btn" onclick="deleteBoard(${list.BOARD_NO})">삭제</button></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div><!-- #reportBoard -->

<hr>

<div id="reportComment">
<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width: 10%;">
	<col style="width: 30%;">
	<col style="width: 15%;">

	<col style="width: 15%;">
	<col style="width: 20%;">
	<col style="width: 10%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>댓글번호</th>
		<th>내용</th>
		<th>작성자</th>

		<th>신고종류</th>
		<th>작성일</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${reportBoardList }">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.TITLE }</td>
		<td>${list.WRITER_ID }</td>
		<td>${list.REPORT_TYPE }</td>
		<td>${list.REPORT_DATE }</td>
        <td><button class="delete_btn" onclick="deleteBoard(${list.BOARD_NO})">삭제</button></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div><!-- #reportComment -->




</div><!-- .AdminContent -->



</body>
</html>