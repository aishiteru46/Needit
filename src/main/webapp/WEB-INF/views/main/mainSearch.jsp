<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
/* 검색 */ 
#MainSearchDiv {
    position: absolute;
    margin-top: -46px;
    margin-left: 800px;
}
#MainSearchDiv1{
    position: absolute;
    margin-top: -57px;
    margin-left: 780px;
}
/* 검색input */
#MainSearch {
    position: inherit;
    width: 355px;
    border: 1px solid #ccc;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}
/* 검색버튼 */
#MainBtnSearch {
    position: inherit;
    margin-left: -7px;
    border: 1px solid #ccc;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
/* 검색버튼 focus 없애기 */
#MainSearch:focus, #MainBtnSearch:focus{
	outline: none;
}


</style>


<div id="container">

<!-- 검색버튼 -->
<div id="MainSearchDiv">
  <form action="/mainSearch" method="get" id="searchForm">
	<input type="text" name="searchText" id="MainSearch" placeholder=" 필요한 것을 검색해보세요."
		required oninvalid="this.setCustomValidity('검색어를 입력해주세요')" oninput="this.setCustomValidity('')"/>
	<button id="MainBtnSearch">검색</button>
  </form>
</div><!-- #MainSearchDiv -->
<div style="margin-bottom: 90px;"></div>

<!-- 검색결과 -->


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
        <div id="write-conatiner-price">💸<fmt:formatNumber value="${list.PRICE}" pattern="#,###" />원</div>
        
        <div id="write-conatiner-loc" ><i style="color: rgb(255,83,63)" class="bi bi-geo-alt-fill"></i>${list.LOCATION } </div>
    </div><!-- .write-container -->
    
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
</c:forEach>

<small class="float-end" style="margin-right: 8px; margin-top: -10px;">total : ${paging.totalCount }</small>





</div><!-- #container -->

<div style="clear: both; margin-bottom: 50px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />