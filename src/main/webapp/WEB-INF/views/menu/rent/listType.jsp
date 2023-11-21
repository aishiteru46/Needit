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
    margin-bottom: -22px;
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
	float: left;
	position: absolute;
 	width: 70px;
 	height: 70px;
	margin-top: 14px;
    margin-left: 5px;
    
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: contain;
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
	display: inline-block;
    margin-top: 10px;
    margin-bottom: -12px;
    margin-left: -6px;
}
.titlebox {
	width:420px; 
	height:99px; 
	margin-left:65px;
}
#title {
	width: 100%;
	margin-left: -18px;
    padding: 36px;
  	overflow: hidden;
 	text-overflow: ellipsis; 
 	white-space: nowrap; 
}

#locationBox {
	width: 100px;
  	overflow: hidden;
 	text-overflow: ellipsis; 
 	white-space: nowrap; 
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
	margin-top: 37px;
    margin-bottom: -34px;
    font-size: 40px;
    text-align: center;
}
#rentText2 {
	font-size: 25px;
	text-align: center;
	display: inline-block;
}
#viewType {
	margin-top: -1px;
    margin-bottom: -2px;
    margin-right: 17px;
    display: inline-block;
}

th {
	background-color: rgb(255,83,64);
}

.listType tr td,
.listType tr th {
	font-weight: normal;
	font-size: 16px;
	text-align: center;
	border-bottom: 1px solid #ccc;
}

.listType tr th {
	color: white;
	font-weight: bold;
	height: 40px;
}

.thumbnail {
	display:inline-block;
	float: left;

}

.table-container {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.btn { 
	--bs-btn-color: #fff;
    --bs-btn-bg: #343a40;
    --bs-btn-hover-border-color: unset;
} 

</style>

<div class="container">

<c:forEach  var="list" items="${list }" begin="0" end="0">
	<c:if test="${list.MENU eq '1' && list.CATE eq '1' }">
		<div id="rentText1"> 대여해요 
			<div id="rentText2">물품 <img src="/resources/img/borrowIcon.png" style="width: 45px; height: 45px; margin-top: -28px;"></div>
		</div>
	</c:if>
	<c:if test="${list.MENU eq '1' && list.CATE eq '2' }">
		<div id="rentText1"> 대여해요
			<div id="rentText2">인력 <img src="/resources/img/humanpower.png" style="width: 45px; height: 45px; margin-top: -28px;"></div>
		</div>
	</c:if>
	<c:if test="${list.MENU eq '1' && list.CATE eq '3' }">
		<div id="rentText1"> 대여해요
			<div id="rentText2">공간 <img src="/resources/img/place.png" style="width: 45px; height: 45px; margin-top: -26px;"></div>
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

	<div class="float-end" id="viewType">
		<a type="button" href="/rent/list?menu=1&cate=1"><img src="/resources/img/girdtype.png" style="width: 40px; height: 40px;"></a>
		<a type="button" href="/rent/listType?menu=1&cate=1"><img src="/resources/img/listtype2.png" style="width: 32px; height: 40px;"></a>
	</div>

<small class="float-start ms-2 mt-2">total : ${paging.totalCount }</small><br><br><br>
</div>

<div class="listContainer">
	
	<div class="table-container">
		<table class="listType">
		
		<colgroup>
			<col style="width:5%;">
			<col style="width:45%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:5%;">
		</colgroup>
		
		<thead>
			<tr>
				<th style="border-top-left-radius: 8px;">No.</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th><th>가격</th><th style="border-top-right-radius: 8px;">위치</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.BOARD_NO }</td>
				<td>
					<div>
				        <c:if test="${ not empty list.THUMBNAIL_NAME  }">
					        <div class="thumbnail">
					        	<a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/></a>
					        </div>
				        </c:if>
				        <c:if test="${ empty list.THUMBNAIL_NAME  }">
					        <div class="thumbnail">
					        	<a href="/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/resources/img/noimg.png"/></a>
					        </div>
				        </c:if>
				        <div class="titlebox">					
							<a href="/rent/view?boardNo=${list.BOARD_NO }"><div style="text-align: left;" id="title">${list.TITLE }</div></a>
						</div>
					</div>
				</td>
				<td>${list.WRITER_NICK }</td>
				<td>${list.HIT}</td>
				<td>
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
				</td>
				<td><fmt:formatNumber value="${list.PRICE}" pattern="#,###" />원</td>
				<td><div id="locationBox">${list.LOCATION }</div></td>
			</tr>
		</c:forEach>
		</tbody>
		
		</table>
	</div>

</div> <!-- .container -->
<br>
<!-- </div>.listContainer -->



<c:import url="/WEB-INF/views/layout/paginationForList.jsp" />

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
