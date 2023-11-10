<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
#AdminBanner{
	background-color: #ff8108;
	width: 302px;
}

#BannerImgPre{
	width: 1000px;
	
	
}
</style>

<script type="text/javascript">



</script>


<!-- 안쪽 내용 -->
<div id="AdminContent">

<form action="./bannerUpdate" method="post" enctype="multipart/form-data">

<div class="form-group mb-3">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>
</form>
<br>

<!-- 이미지 미리보기 -->
<div id="BannerImgPre">
	<c:forEach items="${file }" var="bannerNames">
		<img alt="썸네일" src="/resources/banner/${bannerNames.storedName }">
	</c:forEach>
</div><!-- .BannerImgPre -->

</div><!-- .AdminContent -->


</body>
</html>