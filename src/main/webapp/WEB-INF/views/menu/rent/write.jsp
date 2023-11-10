<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$("#content").summernote({
		height: 300
	})
})
</script>

<script type="text/javascript">
// function setThumbnail(event){
// 	var reader = new FileReader();
	
// 	reader.onload = function(event){
// 		var img = document.createElement("img");
// 		img.setAttribute("src", event.target.result);
// 		img.setAttribute("class", "col-lg-6");
// 		document.querySelector("div#thumnail_container").appendChild(img);
// 	};
	
// 	reader.readAsDataURL(event.target.files[0]);
// }

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function (event) {
        var thumbnailContainer = document.querySelector("#thumnail_container");
        thumbnailContainer.style.backgroundImage = "url('" + event.target.result + "')";
    };

    reader.readAsDataURL(event.target.files[0]);
}
</script>

<style type="text/css">
	
#thumnail_container{
    border: 1px solid #ccc;
    width: 200px;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
}

</style>

<div class="container">

<hr><br><br>

<div class="col-10 mx-auto">
<form action="./write" method="post" enctype="multipart/form-data">
<input type="hidden" name="menu" id="menu" name="menu" value="${param.menu }" />

<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" readonly="readonly" name="writerId" value="${id }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="location">지역</label>
	<input type="text" class="form-control" name="location" id="location">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="price">가격</label>
	<input type="text" class="form-control" name="price" id="price">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="thumnail">썸네일</label>
	<input class="form-control form-control-user" type="file" name="file" id="thumnail" onchange="setThumbnail(event);"><br>
	<div id="thumnail_container"></div>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content"></textarea>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>
</div>

</div> <!-- .container -->

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />