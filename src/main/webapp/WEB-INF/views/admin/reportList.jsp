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
.table tr td{
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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

<!-- 게시글 신고 목록 -->
<div id="reportBoard">
<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width: 16%;">
	<col style="width: 24%;">
	<col style="width: 6%;">
	<col style="width: 6%;">
	<col style="width: 13%;">
	
	<col style="width: 15%;">
	<col style="width: 15%;">
	<col style="width: 5%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>게시글번호</th>
		<th>제목</th>
		<th>메뉴</th>
		<th>카테고리</th>
		<th>작성자</th>

		<th>신고종류</th>
		<th>신고날짜</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${reportBoardList }">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.TITLE }</td>
		<td>${list.MENU }</td>
		<td>${list.CATE }</td>
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


<!-- 댓글 신고 목록 -->
<div id="reportComment">
<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width: 8%;">
	<col style="width: 8%;">
	<col style="width: 36%;">
	<col style="width: 13%;">

	<col style="width: 15%;">
	<col style="width: 15%;">
	<col style="width: 5%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>게시글번호</th>
		<th>댓글번호</th>
		<th>댓글내용</th>
		<th>작성자</th>

		<th>신고종류</th>
		<th>신고날짜</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<c:forEach var="list" items="${reportCmtList }">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.CMT_NO }</td>
		<td>${list.CONTENT }</td>
		<td>${list.WRITER_NICK }</td>
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