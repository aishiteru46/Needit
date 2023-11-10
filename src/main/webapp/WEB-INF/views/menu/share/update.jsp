<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$(".del").click(e => {
		$(e.target).prev().toggleClass("text-decoration-line-through")
		
		$(e.target).next().prop("checked", ()=>{return !$(e.target).next().prop("checked");})
	})
	
	$("#content").summernote({
		height: 300
	})
})
</script>

<div class="container">
<h1>글 수정</h1>
<hr>

<div class="col-10 mx-auto">
<form action="/menu/share/update" method="post" enctype="multipart/form-data">

<input type="hidden" name="boardNo" value="${updateBoard.boardNo }" readonly="readonly">

<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" readonly="readonly" value="${id }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title" value="${updateBoard.title }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content">${updateBoard.content }</textarea>
</div>

<%-- 새로운 첨부파일 --%>
<div id="newFile">

<div class="form-group mb-3">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

</div>

<%-- 기존 첨부파일 --%>
<div id="originFile">

<c:forEach var="boardfile" items="${boardfile }">
	<div>
		<a href="./download?fileNo=${boardfile.fileNo }">${boardfile.originName }</a>
		<span class="del fw-bold fs-4 text-danger">X</span>
		
		<input type="checkbox" class="d-none" name="delFileno" value="${boardfile.fileNo }">
	</div>
</c:forEach>

</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>
</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />



