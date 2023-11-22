<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style type="text/css">
.write {
    margin-top: 25px;
    margin-bottom: -23px;
}
.row {
    text-align: center;
}

.write-container {
    height: 507px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
    overflow: hidden;
    border: 1px solid #343a4070;
}

.write-container:hover {
/*     border-color: #ff533f; */
    box-shadow: 5px 5px 5px gray;
    transform: scale( 1.03 );
    transition: all 0.15s ease-in;
}

.col-md-4 {
    margin-right: 30px;
}

.preview {
	margin: 15px auto 15px auto;
 	width: 350px;
 	height: 300px;
	display: flex;
	object-fit: cover;
    justify-content: center;
	align-items: center;
    background-size: cover; 
    background-repeat: no-repeat;
	background-position: center center;
}

.write-container-head {
	width: 380px;
	margin: 0 auto;
}

.no {
    font-size: 15px;
    display: inline-block;
    float: left;
    position: absolute;
    margin-left: -70px;
    margin-top: 14px;
}

.title {
	font-size: 18px;
 	width: 245px; 
	color: rgb(255,83,63);
 	font-weight: bold; 
 	overflow: hidden; 
 	text-overflow: ellipsis; 
 	white-space: nowrap; 
	display: inline-block;
    margin-top: 10px;
    margin-bottom: -12px;
    margin-left: -15px;
}
#write-conatiner-hit, #write-conatiner-like {
	display: inline-block;
	float: right;
	position: absolute;
	font-size: 14px;
}
#write-conatiner-hit {
    margin-top: 23px;
}
#write-conatiner-like {
	margin-top: 4px;
}
#write-conatiner-nick {
    float: left;
    position: relative;
    font-size: 18px;
    margin-top: -8px;
    margin-left: 4px;
}
#write-conatiner-time {
    float: left;
    position: absolute;
    font-size: 18px;
    margin-top: 20px;
    margin-left: 4px;
}
#write-conatiner-price {
	float: right;
    margin-top: -5px;
    margin-bottom: 19px;
    margin-right: 6px;
    font-size: 30px;
    text-align: center;
}
#write-conatiner-loc {
	width: 353px;
    font-size: 19px;
   	overflow: hidden; 
 	text-overflow: ellipsis; 
 	white-space: nowrap;
}
#nickIcon{
	float: none;
	display: inline-block;
}
#rentListHr:hover {
	color: rgb(255,83,63);
}
#rentText1 {
	margin-top: 60px;
    margin-bottom: -55px;
    font-size: 30px;
    text-align: center;
    color: #343a40;
}
#rentText2 {
    vertical-align: text-top;
	font-size: 25px;
	text-align: center;
	display: inline-block;
    color: #343a40;
}
#viewType {
	margin-top: -1px;
    margin-bottom: -2px;
    margin-right: 17px;
    display: inline-block;
}

.btn {
    --bs-btn-line-height: 1.3;
	--bs-btn-color: #fff;
    --bs-btn-bg: #343a40;
    --bs-btn-hover-border-color: unset;    
} 
 
</style>

<style>
.pagination {
    --bs-pagination-active-bg: #ff533f;
    --bs-pagination-color: #373b3e;
	--bs-pagination-active-border-color: #ff533f;  
    --bs-pagination-hover-color: #ff533f;	  
}
</style>

<div class="container">

<c:forEach  var="list" items="${list }" begin="0" end="0">
	<c:if test="${list.MENU eq '1' && list.CATE eq '1' }">
		<div id="rentText1"> 대여해요 
			<div id="rentText2">[물품]</div>
<!-- 			<img src="/resources/img/borrowIcon.png" style="width: 45px; height: 45px; margin-top: -28px;"> -->
		</div>
	</c:if>
	<c:if test="${list.MENU eq '1' && list.CATE eq '2' }">
		<div id="rentText1"> 대여해요
			<div id="rentText2">[인력]</div>
<!-- 			 <img src="/resources/img/humanpower.png" style="width: 45px; height: 45px; margin-top: -28px;"> -->
		</div>
	</c:if>
	<c:if test="${list.MENU eq '1' && list.CATE eq '3' }">
		<div id="rentText1"> 대여해요
			<div id="rentText2">[공간]</div>
<!-- 			 <img src="/resources/img/place.png" style="width: 45px; height: 45px; margin-top: -26px;"> -->
		</div>
	</c:if>
</c:forEach>

<div class="write">
	<c:if test="${not empty isLogin and isLogin }">
		<a class="btn me-2 float-end sm" href="/rent/write?menu=${param.menu }&cate=${param.cate }">✍️글쓰기</a>
	</c:if>
	<c:if test="${empty isLogin and not isLogin }">
		<a class="btn me-2 float-end sm" href=""  data-bs-toggle="modal" data-bs-target="#exampleModal">✍️글쓰기</a>
	</c:if>
	
	<!-- 그리드타입,리스트타입 선택 -->
	<div class="float-end" id="viewType">
		<a type="button" href="/rent/list?menu=${param.menu}&cate=${param.cate}"><img src="/resources/img/girdtype.png" style="width: 40px; height: 40px;"></a>
		<a type="button" href="/rent/listType?menu=${param.menu}&cate=${param.cate}"><img src="/resources/img/listtype2.png" style="width: 32px; height: 40px;"></a>
	</div>

<small class="float-start ms-2 mt-2">total : ${paging.totalCount }</small><br><br>
</div>

<div class="gridContainer">
<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
  <div class="row">
  </c:if>
  	
    <div class="write-container">
 		<div class="write-container-head">
<%-- 	        <div class="no">no.${list.BOARD_NO}</div> --%>
	        <div class="no">Title.</div>
	        <a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><div class="title">${list.TITLE }</div></a>
        <div id="write-conatiner-like">❤️  ${list.LIKE_CNT }</div>
        <div id="write-conatiner-hit">👀  ${list.HIT}</div>
        </div><!-- .write-container-head -->
        <hr id="rentListHr">
        <c:if test="${ not empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/></a>
	        </div>
        </c:if>
        <c:if test="${ empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/resources/img/noimg.png"/></a>
	        </div>
        </c:if>
        <hr id="rentListHr">
        <div id="write-conatiner-nick"><div id="nickIcon">✍️</div>${list.WRITER_NICK }</div>
        <div id="write-conatiner-time">🕟
            <fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" /> 
            <fmt:formatDate var="writeDate" value="${list.WRITE_DATE }" pattern="yyyyMMdd" /> 
            <c:choose> 
                <c:when test="${writeDate lt curDate }"> 
                    <fmt:formatDate value="${list.WRITE_DATE }" pattern="yyyy-MM-dd" /> 
                </c:when> 
                <c:otherwise> 
                    <fmt:formatDate value="${list.WRITE_DATE }" pattern="HH:mm" /> 
                </c:otherwise> 
            </c:choose>                    
        </div><!-- #write-conatiner-time -->
        <div id="write-conatiner-price">💸<fmt:formatNumber value="${list.PRICE}" pattern="#,###" />원</div>
        
        <div id="write-conatiner-loc" ><i style="color: rgb(255,83,63)" class="bi bi-geo-alt-fill"></i>${list.LOCATION } </div>
    </div><!-- .write-container -->
    
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
</c:forEach>

</div> <!-- .container -->
<br>
</div><!-- .gridContainer -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
