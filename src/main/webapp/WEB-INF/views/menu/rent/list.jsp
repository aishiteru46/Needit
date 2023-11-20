<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

.row {
    text-align: center;
}

.write-container {
    height: 526px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
    overflow: hidden;
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.write-container:hover {
    border-color: #ff533f;
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
	display: inline-block;
	float: left;
	position: absolute;
    margin-left: -114px;
    margin-top: 10px;
}

.title {
 	width: 150px; 
 	color: black; 
 	font-weight: bold; 
 	overflow: hidden; 
 	text-overflow: ellipsis; 
 	white-space: nowrap; 
	display: inline-block;
    margin-top: 10px;
    margin-bottom: -12px;
    margin-left: -6px;
}
#write-conatiner-hit, #write-conatiner-like {
	display: inline-block;
	float: right;
	position: absolute;
	font-size: 14px;
    margin-left: 45px;
}
#write-conatiner-hit {
	margin-top: 25px;
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
	float: right;
	position: relative;
	font-size: 18px;
	margin-top: -8px;
	margin-right: 4px;
}
#write-conatiner-price {
	margin-top: 45px;
    margin-bottom: 13px;
    font-size: 27px;
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

</style>

<div class="container">

<c:forEach  var="list" items="${list }" begin="0" end="0">
	<c:if test="${list.MENU eq 'm1c1' }">
		<h5>대여해요 / 물품</h5>	
	</c:if>
	<c:if test="${list.MENU eq 'm1c2' }">
		<h5>대여해요 / 인력</h5>	
	</c:if>
	<c:if test="${list.MENU eq 'm1c3' }">
		<h5>대여해요 / 공간</h5>	
	</c:if>
</c:forEach>

<!-- <button class="gridType">그리드</button> -->
<!-- <button class="listType">리스트</button> -->

<div class="gridContainer">
<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
  <div class="row">
  </c:if>
  	
    <div class="write-container">
 		<div class="write-container-head">
	        <div class="no">no.${list.BOARD_NO}</div> 
	        <a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><div class="title">${list.TITLE }</div></a>
        <div id="write-conatiner-like">❤️  ${list.LIKE_CNT }</div>
        <div id="write-conatiner-hit">👀  ${list.HIT}</div>
        </div><!-- .write-container-head -->
        <hr>
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
        <hr>
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
        
        <div id="write-conatiner-loc">🗺︎  ${list.LOCATION }</div>
    </div><!-- .write-container -->
    
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
</c:forEach>

<div class="write">
	<c:if test="${not empty isLogin and isLogin }">
		<a class="btn btn-secondary" href="/rent/write?menu=${param.menu }&cate=${param.cate }">글쓰기</a>
	</c:if>
</div>

<small class="float-end mb-3">total : ${paging.totalCount }</small><br>

</div> <!-- .container -->
<br>
</div><!-- .gridContainer -->

<!-- <div class="listContainer"> -->
<!-- 	<div class="row"> -->
<%-- 	<c:forEach items="${list}" var="list" varStatus="loop"> --%>
<!-- 	 	 <div class="write-container"> -->
<!-- 	  		<br> -->
<%-- 	   		<a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}">제목 : ${list.TITLE }</a><br><br> --%>
<%-- 	    	<h6>글번호 : ${list.BOARD_NO}</h6> --%>
<%-- 	    	<h6>작성자 : ${list.WRITER_ID }</h6> --%>
<%-- 	    	<h6>닉네임 : ${list.WRITER_NICK }</h6> --%>
<%-- 	    	<h6>가격 : ${list.PRICE}</h6> --%>
<%-- 	    	<h6>조회수 :  ${list.HIT}</h6> --%>
<!-- 	    	<h6>작성일 :   -->
<%-- 				<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />  --%>
<%-- 				<fmt:formatDate var="writeDate" value="${list.WRITE_DATE }" pattern="yyyyMMdd" />  --%>
<%-- 				<c:choose>  --%>
<%-- 				<c:when test="${writeDate lt curDate }">  --%>
<%-- 						<fmt:formatDate value="${list.WRITE_DATE }" pattern="yyyy-MM-dd" />  --%>
<%-- 					</c:when>  --%>
<%-- 					<c:otherwise>  --%>
<%-- 						<fmt:formatDate value="${list.WRITE_DATE }" pattern="HH:mm" />  --%>
<%-- 					</c:otherwise>  --%>
<%-- 				</c:choose>		    	 --%>
<!-- 	    	</h6> -->
<%-- 	    	<h6>위치 : ${list.LOCATION }</h6> --%>
<!-- 	  	</div> -->
<%-- 	</c:forEach> --%>
	
<!-- 	<div> -->
<!-- 		<table class="table table-striped table-hover table-sm"> -->
		
<%-- 		<colgroup> --%>
<%-- 			<col style="width:7%;"> --%>
<%-- 			<col style="width:30%;"> --%>
<%-- 			<col style="width:10%;"> --%>
<%-- 			<col style="width:5%;"> --%>
<%-- 			<col style="width:10%;"> --%>
<%-- 			<col style="width:5%;"> --%>
<%-- 			<col style="width:10%;"> --%>
<%-- 		</colgroup> --%>
		
<!-- 		<thead> -->
<!-- 			<tr class="table-danger"> -->
<!-- 				<th>글번호</th> -->
<!-- 				<th>제목</th> -->
<!-- 				<th>닉네임</th> -->
<!-- 				<th>조회</th> -->
<!-- 				<th>작성일</th> -->
<!-- 				<th>가격</th> -->
<!-- 				<th>지역</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
		
<!-- 		<tbody> -->
<%-- 		<c:forEach var="list" items="${list }"> --%>
<!-- 			<tr> -->
<%-- 				<td>${list.BOARD_NO }</td> --%>
<!-- 				<td> -->
<%-- 					<a href="/rent/view?boardNo=${list.BOARD_NO }">${list.TITLE }</a> --%>
<!-- 				</td> -->
<%-- 				<td>${list.WRITER_NICK }</td> --%>
<%-- 				<td>${list.HIT}</td> --%>
<!-- 				<td> -->
<%-- 					<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" /> --%>
<%-- 					<fmt:formatDate var="writeDate" value="${list.WRITE_DATE }" pattern="yyyyMMdd" /> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${writeDate lt curDate }"> --%>
<%-- 							<fmt:formatDate value="${list.WRITE_DATE }" pattern="yyyy-MM-dd" /> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<fmt:formatDate value="${list.WRITE_DATE }" pattern="HH:mm" /> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose>				 --%>
<!-- 				</td> -->
<%-- 				<td>${list.PRICE }</td> --%>
<%-- 				<td>${list.LOCATION }</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</tbody> -->
		
<!-- 		</table> -->
<!-- 	</div> -->
<!-- </div>.listContainer -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
