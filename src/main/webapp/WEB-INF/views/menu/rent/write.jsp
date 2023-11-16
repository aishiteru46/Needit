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

//썸네일 미리보기
function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function (event) {
        var thumbnailContainer = document.querySelector("#thumbnail_container");
        thumbnailContainer.style.backgroundImage = "url('" + event.target.result + "')";
    };

    reader.readAsDataURL(event.target.files[0]);
}// .setThumbnail() End

//가격란에 문자입력 방지
$(document).ready(function() {
    $("#price").on("keyup", function() {
        var checkType = $("#price").val();

        if (isNaN(checkType)) {
            alert("숫자만 입력 가능합니다");
            $("#price").val("");
            $("#price").focus();
        }
    
    });
});
</script>

<style type="text/css">
	
#thumbnail_container{
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
<br><br>

<div class="col-10 mx-auto">
<form action="./write" method="post" enctype="multipart/form-data">
<input type="hidden" name="menu" id="menu" name="menu" value="${param.menu }" />
<input type="hidden" name="menu" id="cate" name="cate" value="${param.cate }" />

<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" readonly="readonly" name="writerId" value="${nick }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해주세요" required>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="location">위치</label>
	<input type="text" class="form-control" readonly="readonly" name="location" value="${addr1 }" id="location">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="price">가격</label>
	<input type="text" class="form-control" name="price" id="price" required>
</div>

<div class="form-group mb-3">
   <label class="form-label" for="thumbnailFile">썸네일</label>
   <input type="file" class="form-control form-control-user" name="file" id="thumbnailFile" onchange="setThumbnail(event);"><br>
   <div id="thumbnail_container"></div>
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