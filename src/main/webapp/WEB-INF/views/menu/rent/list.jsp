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
    height: 600px;
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

.no {
	margin-top: 10px;
}

.title {
	margin-top: 10px;
	color: black;
	font-weight: bold;
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

<button class="gridType">그리드</button>
<button class="listType">리스트</button>

<div class="gridContainer">
<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
  <div class="row">
  </c:if>
  	
    <div class="write-container">
        <h6 class="no">no. ${list.BOARD_NO}</h6>
        <a href="/menu/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}"><h6 class="title">제목 : ${list.TITLE }</h6></a>
        <c:if test="${ not empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/menu/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}"><img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/></a>
	        </div>
        </c:if>
        <c:if test="${ empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/menu/rent/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}"><img class="preview" src="/resources/img/noimg.png"/></a>
	        </div>
        </c:if>
        <h6>작성자 : ${list.WRITER_ID }</h6>
        <h6>닉네임 : ${list.WRITER_NICK }</h6>
        <h6>가격 : <fmt:formatNumber value="${list.PRICE}" pattern="#,###" />원</h6>
        <h6>👀  ${list.HIT}</h6>
        <h6>✍️  
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
        </h6>
        <h6>❤️  ${list.LIKE_CNT }</h6>
        <h6>🚩  ${list.LOCATION }</h6>
    </div><!-- .write-container -->
    
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
</c:forEach>

<div class="write">
	<c:if test="${not empty isLogin and isLogin }">
		<a class="btn btn-secondary" href="./write?menu=${param.menu }">글쓰기</a>
	</c:if>
</div>

<small class="float-end mb-3">total : ${paging.totalCount }</small><br>

</div> <!-- .container -->
<br>
</div><!-- .gridContainer -->

<div class="listContainer">
	<div class="row">
	<c:forEach items="${list}" var="list" varStatus="loop">
	 	 <div class="write-container">
	  		<br>
	   		<a href="/menu/rent/view?boardNo=${list.boardNo }&menu=${list.menu}">제목 : ${list.title }</a><br><br>
	<%--    		<img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/> --%>
	    	<h6>글번호 : ${list.boardNo}</h6>
	    	<h6>작성자 : ${list.writerId }</h6>
	    	<h6>닉네임 : ${list.writerNick }</h6>
	    	<h6>가격 : ${list.price}</h6>
	    	<h6>조회수 :  ${list.hit}</h6>
	    	<h6>작성일 :  
				<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" /> 
				<fmt:formatDate var="writeDate" value="${list.writeDate }" pattern="yyyyMMdd" /> 
				<c:choose> 
				<c:when test="${writeDate lt curDate }"> 
						<fmt:formatDate value="${list.writeDate }" pattern="yyyy-MM-dd" /> 
					</c:when> 
					<c:otherwise> 
						<fmt:formatDate value="${list.writeDate }" pattern="HH:mm" /> 
					</c:otherwise> 
				</c:choose>		    	
	    	</h6>
	    	<h6>위치 : ${list.location }</h6>
	  	</div>
	<%--   <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}"> --%>
	<!--   </div>.row -->
	<%--   </c:if> --%>
	</c:forEach>
	
	<div>
		<table class="table table-striped table-hover table-sm">
		
		<colgroup>
			<col style="width:7%;">
			<col style="width:30%;">
			<col style="width:10%;">
			<col style="width:5%;">
			<col style="width:10%;">
			<col style="width:5%;">
			<col style="width:10%;">
		</colgroup>
		
		<thead>
			<tr class="table-danger">
				<th>글번호</th>
				<th>제목</th>
				<th>닉네임</th>
				<th>조회</th>
				<th>작성일</th>
				<th>가격</th>
				<th>지역</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.boardNo }</td>
				<td>
					<a href="./view?boardNo=${list.boardNo }">${list.title }</a>
				</td>
				<td>${list.writerNick }</td>
				<td>${list.hit}</td>
				<td>
					<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
					<fmt:formatDate var="writeDate" value="${list.writeDate }" pattern="yyyyMMdd" />
					<c:choose>
						<c:when test="${writeDate lt curDate }">
							<fmt:formatDate value="${list.writeDate }" pattern="yyyy-MM-dd" />
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${list.writeDate }" pattern="HH:mm" />
						</c:otherwise>
					</c:choose>				
				</td>
				<td>${list.price }</td>
				<td>${list.location }</td>
			</tr>
		</c:forEach>
		</tbody>
		
		</table>
	</div>
</div><!-- .listContainer -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
