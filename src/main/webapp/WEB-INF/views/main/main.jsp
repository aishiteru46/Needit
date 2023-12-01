<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
/* 최신 사진 간격 */
:root{
	--imgMargin : 3.5px 0px -2px 2.6px;
}

/* selectBox */
#mainSelectBox{
    width: 89px;
    height: 40px;
	float: right;
    position: absolute;
    margin-left: -92px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

/* 검색 */ 
#MainSearchDiv {
    position: absolute;
    vertical-align: top;
    margin-top: -46px;
    margin-left: 800px;
}
/* #MainSearchDiv1{ */
/*     position: absolute; */
/*     margin-top: -57px; */
/*     margin-left: 780px; */
/* } */
/* 검색input */
#MainSearch {
    position: inherit;
    vertical-align: top;
    width: 355px;
    height: 35px;
    border: 1px solid #ccc;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}
/* 검색버튼 */
#MainBtnSearch {
    position: absolute;
    vertical-align: top;
    height: 35px;
    width: 52px;
    margin-left: -7px;
    border: 1px solid #ccc;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
/* 검색버튼 focus 없애기 */
#MainSearch:focus, #MainBtnSearch:focus{
	outline: none;
}
/* 썸네일 div */
#Thumbnail{
	border:1px solid #ccc;
	border-radius: 10px;
	width: 1200px;
	height: 500px;
	margin: 40px auto 0px auto;
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

/* 나눔,대여,업체 div */
#MainRent, #MainShare, #MainBusiness{
	border: 1px solid #ccc;
	width: 1200px;
	height: 300px;
	border-radius: 10px;
}

/* 오늘의 인기 게시글 */
#MainCommu{
	border: 1px solid #ccc;
	width: 695px;
	height: 300px;
	float: left;
	border-radius: 10px;
/* 	display: table-cell; */
/* 	vertical-align: middle; */
}


/* 지도 */
#MainMap{
	border: 1px solid #ccc;
	width: 505px;
	height: 300px;
	float: right;
	border-radius: 10px;
}

/* hr 위아래 조절 */
/* hr{ */
/* 	margin-top: 20px; */
/* 	margin-bottom: 20px; */
/* 	border: 1px solid #black; */
/* } */

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
#mainTitleHit{
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
	width: 289px;
	height: 200px;
	margin: var(--imgMargin);
}
/* 썸네일 사진 없을 때 */
#MainNoITumbnail{
	width: 289px;
	height: 200px;
 	margin: var(--imgMargin);
	border: 1px solid #ccc;
}
/* 대여, 나눔해요 썸네일 제목 */
#MainThumbnailTitle{
	width: 289px;
	height: 25px;
	text-align: center;
	font-size: 17px;
	font-weight: bold;
	margin-top: 5px;
	
	/* 긴내용 자르고 뒤에... */
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

/* 오늘의 인기 게시글 */
#MainCommuHitDiv{
	margin: -30px -14px 60px 7px;
	width: 695px;
	height: 85px;
}
#MainCommuHitHr{
	position: relative;
	top: 100px;
}
#MainCommuHitTitle{
	display: block;
	font-size: 22px;
	font-weight: bold;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
#MainCommuHitContent{
    display: inline-block;
    width: 682px;
    height: 66px;
	font-size: 18px;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
/* 썸머노트 사진 등록시 */
#MainCommuHitContent p{
	float: left;
	position: absolute;
	max-width: 682px;
	max-height: 66px;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
#MainCommuHitContent img{
	display :block;
/* 	display :inline-block; */
    max-width: 120px;
}
/* 인기 게시글 100이상 붉은 글씨 */
.MainCommuHit{
    display: inline-block;
    float: right;
    position: inherit;
    font-size: 12px;
    margin-right: 15px;
    margin-top: 7px;
    border: 1px solid;
    border-radius: 5px;
    width: 82px;
    height: 21px;
    text-align: center;
}
.lowCount{
    color: green;
    border-color: green;
}

.highCount{
    color: red;
    border-color: red;
}
/* 지도 아이콘 링크 */
#mainMapIcon{
	width: 30px;
	height: 30px;
	margin-top: -49px;
    margin-right: 9px;
    float: right;
}
/* 지도 링크 M안에 사진 */
#mainMapIconSpan{
    background: url(/resources/img/blueSea.jpg) no-repeat center bottom / cover;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
    font-weight: bolder;
    font-size: 36px;
    margin-top: -64px;
    margin-right: 16px;
    width: 30px;
    height: 50px;
    float: right;
}
/* 지도 링크 클릭 */
#mainMapIconSpan1{
    display: block;
    float: right;
    position: relative;
    margin-top: -21px;
    margin-right: 16px;
    font-size: 12px;
    width: 25px;
    height: 10px;
    color: blue;
    text-decoration: underline;
}

/* 항목별 간격 맞추기 */
#textMargin{
	margin-bottom: 2.5em;
}

.modal-content{
	width: 300px;
    margin: 0 auto;
}
#searchAlert{
	text-align: center;
}

/* 플로팅 버튼 */
.policy-floating-button{
    background-color:white;
    color: black;
    border: 0;
    margin: 0;
    width: 45px;
    height: 45px;
    border-radius: 20px;
    cursor: pointer;
    border: 1px solid #ccc;
    box-shadow: 2px 2px 2px #ccc;
}

#FloatMain{
	margin: 5px 0px;
	font-size: 13px;
}

.floating {
	display: block;
    position: fixed;
    bottom: 20px;
    right: 12px;
}

</style>


<script type="text/javascript">
function topFunction() {
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
}

function downFunction() {
    window.scrollTo({
        top: 8000,
        behavior: "smooth"
    });
}
</script>

<div id="container">

<!-- 플로팅 버튼 -->
<div class="floating">
<button onclick="topFunction()" class="policy-floating-button" id="scrollTop">
<!-- svg 사진 url -->
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
</svg>
</button><br>
<c:if test="${isLogin and (id eq admin)  }">
	<a href="/admin"><button class="policy-floating-button" id="FloatMain">FAQ</button></a><br>
</c:if>
<c:if test="${not isLogin }">
	<button class="policy-floating-button" id="FloatMain" data-bs-toggle="modal" data-bs-target="#exampleModal">FAQ</button><br>
</c:if>
<c:if test="${isLogin and (id ne admin) }">
	<a href="/admin/chat"><button class="policy-floating-button" id="FloatMain" data-bs-toggle="modal" data-bs-target="#exampleModal">FAQ</button></a><br>
</c:if>
<button onclick="downFunction()" class="policy-floating-button" id="scrollDown">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
</svg>
</button>
</div><!-- .floating -->


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
<!-- <button type="button" style="width: 30px; height: 30px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportModal"> -->
<!-- <div style="width: 25px; height: 25px; margin: -13px -9px;">⚠</div> -->
<!-- </button> -->

<!-- 검색버튼 -->
<div id="MainSearchDiv">
  <form action="/mainSearch" method="get" id="searchForm">
<!--     <select name="selectSub" id="selectSub" required="required"> -->
<!--     	<option value="rent">대여해요</option> -->
<!--     	<option value="share">나눔해요</option> -->
<!--     	<option value="please">해주세요</option> -->
<!--     </select> -->
	<input type="text" name="searchText" id="MainSearch" placeholder=" 필요한 것을 검색해보세요."
		required oninvalid="this.setCustomValidity('제목을 입력해주세요')" oninput="this.setCustomValidity('')"/>
	<button id="MainBtnSearch">검색</button>
  </form>
</div><!-- #MainSearchDiv -->

<div style="margin-bottom: 90px;"></div>
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
			<img src="/resources/banner/${bannerNames.storedName }" class="d-block w-100 h-300 m-auto" alt="배너 썸네일">
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
<div id="textMargin"></div>

<!-- 대여해요 게시글 -->
<div id="MainRent" >
<div id="mainTitle">최신 대여해요 게시글</div>
	<c:forEach var="boardRentInfo" items="${boardRentInfo}">
		<div id="MainTumbnailDiv" class="MainDiv">
		<a href="/rent/view?boardNo=${boardRentInfo.BOARD_NO }&menu=1&cate=${boardRentInfo.CATE }">
			<c:if test="${not empty boardRentInfo.THUMBNAIL_NAME }">
				<div><img src="/upload/${boardRentInfo.THUMBNAIL_NAME }" id="MainThumbnailImg"></div>
			</c:if>
			<c:if test="${empty boardRentInfo.THUMBNAIL_NAME }">	
				<div><img id="MainNoITumbnail" alt="사진이 없습니다" src="/resources/img/noimg.png"></div>
			</c:if>
		</a>
		<div id="MainThumbnailTitle">${boardRentInfo.TITLE}</div>
		</div><!-- #MainTumbnailDiv -->
	</c:forEach>
</div><!-- #MainRent -->
<div id="textMargin"></div>

<!-- 나눔해요 게시글 -->
<div id="MainShare">
<div id="mainTitle">최신 나눔해요 게시글</div>
	<c:forEach var="boardShareInfo" items="${boardShareInfo}">
		<div id="MainTumbnailDiv">
		<a href="/share/view?boardNo=${boardShareInfo.BOARD_NO }&menu=2&cate=${boardShareInfo.CATE }">
			<c:if test="${not empty boardShareInfo.THUMBNAIL_NAME }">
				<div><img src="/upload/${boardShareInfo.THUMBNAIL_NAME }" id="MainThumbnailImg" ></div>
			</c:if>
			<c:if test="${empty boardShareInfo.THUMBNAIL_NAME }">
				<div><img id="MainNoITumbnail" alt="사진이 없습니다" src="/resources/img/noimg.png"></div>
			</c:if>
		</a>
		<div id="MainThumbnailTitle">${boardShareInfo.TITLE}</div>
		</div><!-- #MainTumbnailDiv -->
	</c:forEach>
</div><!-- #MainShare -->
<div id="textMargin"></div>

<!-- 니딧 인증 업체 -->
<div id="MainBusiness">
<div id="mainTitle">니딧 인증 업체</div>
	<c:forEach var="businessInfo" items="${businessInfo}">
		<div id="MainTumbnailDiv">
		<a href="/business/view?boardNo=${businessInfo.BOARD_NO }&menu=5&cate=${businessInfo.CATE }">
			<c:if test="${not empty businessInfo.THUMBNAIL_NAME }">
				<div><img src="/upload/${businessInfo.THUMBNAIL_NAME }" id="MainThumbnailImg"></div>
			</c:if>
			<c:if test="${empty businessInfo.THUMBNAIL_NAME }">			
				<div><img id="MainNoITumbnail" alt="사진이 없습니다" src="/resources/img/noimg.png"></div>
			</c:if>
		</a>
		<div id="MainThumbnailTitle">${businessInfo.TITLE}</div>
		</div><!-- #MainTumbnailDiv -->
	</c:forEach>
</div><!-- #MainBusiness -->
<div id="textMargin"></div>

<!-- 인기 게시글(추천수) -->
<div id="MainCommu">
<div id="mainTitleHit">오늘의 인기 게시글</div>
    <hr id="MainCommuHitHr">
	<c:forEach var="commuHit" items="${commuHit}">
		<div id="MainCommuHitDiv">
			<a href="/community/view?boardNo=${commuHit.BOARD_NO }&menu=4&cate=${commuHit.CATE }">
            <span class="MainCommuHit ${commuHit.HIT lt 100 ? 'lowCount' : 'highCount'}">조회수: ${commuHit.HIT}</span>
			<span id="MainCommuHitTitle">${commuHit.TITLE}</span>
			<span id="MainCommuHitContent">${commuHit.CONTENT}</span>
			</a>
		</div><!-- #MainCommuHitDiv -->
	</c:forEach>
</div><!-- #MainCommu -->

<!-- 주변 지도 -->
<div id="MainMap">
<div id="mainTitleMap">내 주변 지도</div>
<a href="/map">
	<span id="mainMapIconSpan">M</span>
	<span id="mainMapIconSpan1">클릭</span>
</a>

<!-- 지도 링크 작게 -->
<div><%@ include file="/WEB-INF/views/main/mainpageMap.jsp" %></div>
<!-- <iframe src="/admin/mainpageMap" style="width: 300px; height: 222px;"></iframe> -->
</div><!-- #MainMap -->

</div><!-- #container -->

<div style="clear: both; margin-bottom: 50px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
