<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
/* 썸네일 div */
#Thumbnail{
	border:1px solid #ccc;
	width: 1000px;
	height: 400px;
	margin: 50px auto 10px auto;
	overflow: hidden;
}
/* 썸네일 */
.carousel-inner {
    width: 100%;
    height: 100%;
}

.carousel-inner img {
    object-fit: cover;
    width: 100%;
    height: 100%;
}

/* 검색 */
#MainSearchDiv{
	text-align: center;
	margin-top: 1em;
}
/* 검색input */
#MainSearch{
	width: 1000px;
	height: 30px;
	border: 1px solid #ccc;
	border-radius: 3px; 
}
/* 검색버튼 */
#MainBtnSearch{
	background-color: inherit;
	border: 0;
}

/* 나눔,대여,업체 div */
#MainRent, #MainShare, #MainBusiness{
	border: 1px solid #ccc;
	width: 1200px;
	height: 300px
}

/* 추천게시글 */
#MainLike{
	border: 1px solid #ccc;
	width: 700px;
	height: 300px;
	float: left;
}

/* 지도 */
#MainMap{
	border: 1px solid #ccc;
	width: 500px;
	height: 300px;
	float: right;
}

/* hr 위아래 조절 */
hr{
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #black;
}


</style>




<div id="container">

<!-- 이미지 불러오기 -->
<%-- <img alt="asd" src="/resources/banner/${모델값(컨트롤러가 보내줌) }"> --%>
<!-- <img alt="1" src="/resources/banner/cat1.jpeg143f681e3fb5"> --><!-- TEST -->
<!-- <div id="Thumbnail"> -->
<%-- 	<c:forEach items="${file }" var="bannerNames"> --%>
<%-- 		<img alt="썸네일" src="/resources/banner/${bannerNames.storedName }"> --%>
<%-- 	</c:forEach> --%>
<!-- </div> -->

<!-- 신고버튼 테스트 나중에 삭제좀 -->

<!-- 버튼 트리거 모달 -->
<button type="button" style="width: 30px; height: 30px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportModal">
<div style="width: 25px; height: 25px; margin: -13px -9px;">⚠</div>
</button>


<!-- 썸네일 -->
<!-- 저장 경로를 img폴더로 지정, src에 storedname EL문으로 불러오기 -->
<div id="Thumbnail">
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000" data-bs-interval = "false">
	<!-- 사진 밑에 대시 3개 -->
	<div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  	</div>
  
	<div class="carousel-inner">
		<c:forEach items="${file }" var="bannerNames" varStatus="status">
		<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
			<img src="/resources/banner/${bannerNames.storedName }" class="d-block w-100 h-300 m-auto" alt="썸네일1">
		</div>
  		</c:forEach>
	</div><!-- .carousel-inner -->
	
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div><!-- 썸네일 끝 -->
<hr>

<!-- 검색 -->
<div id="MainSearchDiv">
	<input type="text" id="MainSearch" value="${param.search }" />
	<button id="MainBtnSearch">🔍</button>
</div><!-- 검색끝 -->
<hr>

<!-- 대여해요 게시글 -->
<div id="MainRent" >
대여해요
</div>
<hr>

<!-- 나눔해요 게시글 -->
<div id="MainShare">
나눔해요
</div>
<hr>

<!-- 니딧 인증 업체 -->
<div id="MainBusiness">
업체
</div>
<hr>

<!-- 인기 게시글(추천수) -->
<div id="MainLike">
게시글
</div>

<!-- 주변 지도 -->
<div id="MainMap">
주변지도
</div>

</div><!-- .container -->
<div style="clear: both;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
