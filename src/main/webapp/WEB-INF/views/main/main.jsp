<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
/* 최신 사진 간격 */
:root{
	--imgMargin : 3px 1px -2px 1px;
}
/* 썸네일 div */
#Thumbnail{
	border:1px solid #ccc;
	width: 1200px;
	height: 500px;
	margin: 50px auto 10px auto;
	overflow: hidden;
}
/* 썸네일 */
.carousel-inner {
    width: 1200px;
    height: 500px;
}

.carousel-inner img {
    object-fit: cover;
    width: 1200px;
    height: 500px;
}

/* 검색 */
#MainSearchDiv{
	text-align: center;
	margin-top: 1em;
}
/* 검색input */
#MainSearch{
	width: 1000px;
	height: 35px;
	border: 1px solid #ccc;
	border-radius: 5px;
}
/* 검색버튼 */
#MainBtnSearch{
	background-color: inherit;
	border: 0;
	margin-left: -5px;
}

/* 나눔,대여,업체 div */
#MainRent, #MainShare, #MainBusiness{
	border: 1px solid #ccc;
	width: 1200px;
	height: 300px;
	border-radius: 10px;
}

/* 오늘의 인기 게시글 */
#MainLike{
	border: 1px solid #ccc;
	width: 700px;
	height: 300px;
	float: left;
	border-radius: 10px;
}

/* 지도 */
#MainMap{
	border: 1px solid #ccc;
	width: 500px;
	height: 300px;
	float: right;
	border-radius: 10px;
}

/* hr 위아래 조절 */
hr{
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #black;
}

/* 게시글 제목 */
#mainTitle{
	border-bottom: 1px solid #ccc;
	width: 1199px;
	height: 63px;
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	line-height: 60px;
}
#mainTitleLike{
	border-bottom: 1px solid #ccc;
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	width: 700px;
	height: 63px;
	line-height: 60px;
}
#mainTitleMap{
	border-bottom: 1px solid #ccc;
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	width: 499px;
	height: 63px;
	line-height: 60px;
}

/* 대여, 나눔해요 썸네일 바깥 div */ 
#MainTumbnailDiv{
	display: inline-block;
	margin: var(--imgMargin);
}

/* 대여, 나눔해요 썸네일 이미지 */
#MainThumbnailImg{
	width: 291px;
	height: 200px;
	margin: var(--imgMargin);
}
/* 썸네일 사진 없을 때 */
#MainNoITumbnail{
	width: 291px;
	height: 200px;
 	margin: var(--imgMargin);
	border: 1px solid #ccc;
}
/* 대여, 나눔해요 썸네일 제목 */
#MainThumbnailTitle{
	width: 291px;
	height: 25px;
	text-align: center;
	font-size: 17px;
	font-weight: bold;
	margin-top: 5px;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500" data-bs-interval = "false">
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
	<form action="/main" method="get">
		<input type="text" id="MainSearch" value="${param.search }" placeholder="필요한 것을 검색해보세요." />
		<button id="MainBtnSearch" type="submit">🔍</button>
	</form>
</div><!-- 검색끝 -->
<hr>

<!-- 대여해요 게시글 -->
<div id="MainRent" >
	<div id="mainTitle">최신 대여해요 게시글</div>
	<c:forEach var="boardRentInfo" items="${boardRentInfo}">
		<div id="MainTumbnailDiv">
			<c:if test="${not empty boardRentInfo.THUMBNAIL_NAME }">
				<div><a href="/menu/rent/list?menu=1"><img src="/upload/${boardRentInfo.THUMBNAIL_NAME }" id="MainThumbnailImg"></a></div>
			</c:if>
			<c:if test="${empty boardRentInfo.THUMBNAIL_NAME }">			
				<div><img id="MainNoITumbnail" alt="사진이 없습니다" src="/resources/img/noimg.png"></div>
			</c:if>
			<div id="MainThumbnailTitle">${boardRentInfo.TITLE}</div>
		</div><!-- #MainTumbnailDiv -->
	</c:forEach>
</div>
<hr>

<!-- 나눔해요 게시글 -->
<div id="MainShare">
<div id="mainTitle">최신 나눔해요 게시글</div>
	<c:forEach var="boardShareInfo" items="${boardShareInfo}">
		<div id="MainTumbnailDiv">
			<c:if test="${not empty boardShareInfo.THUMBNAIL_NAME }">
				<div><a href="/menu/rent/list?menu=2"><img src="/upload/${boardShareInfo.THUMBNAIL_NAME }" id="MainThumbnailImg" ></a></div>
			</c:if>
			<c:if test="${empty boardShareInfo.THUMBNAIL_NAME }">
				<div><img id="MainNoITumbnail" alt="사진이 없습니다" src="/resources/img/noimg.png"></div>
			</c:if>
			<div id="MainThumbnailTitle">${boardShareInfo.TITLE}</div>
		</div><!-- #MainTumbnailDiv -->
	</c:forEach>
</div><!-- #MainShare -->
<hr>

<!-- 니딧 인증 업체 -->
<div id="MainBusiness">
<div id="mainTitle">니딧 인증 업체</div>
</div>
<hr>

<!-- 인기 게시글(추천수) -->
<div id="MainLike">
<div id="mainTitleLike">오늘의 인기 게시글</div>
</div>

<!-- 주변 지도 -->
<div id="MainMap">
<div id="mainTitleMap">내 주변 지도</div>
<%-- <div style="width: 499px; height: 63px;"><%@ include file="/WEB-INF/views/map/map.jsp" %></div> --%>
</div>

</div><!-- #container -->

<div style="clear: both;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
