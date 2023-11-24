<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(function(){
	  $(".star").click(function(){
		var starImg = $("#star" + boardNo + "+" + menu + "+" + cate);
	    var id = this.id;
	    var boardNoMenuCate = id.replace('star', '');
	    var parts = boardNoMenuCate.split('+');
	    var boardNo = parts[0];
	    var menu = parts[1];
	    var cate = parts[2];
	    
	    $.ajax({
	         type: "post"
	         , url: "/share/basket"
	         , data: {
				boardNo : boardNo
				, menu : menu
				, cate : cate
	         }
	         , dataType: "json"
	         , success: function( res ) {
	            console.log("AJAX 성공")
	            console.log(res)
	            console.log(res.check)
				if( res.check == 1 ) {
					starImg.attr("src", "/resources/img/star.png");
					
				} else {
					deleteBasket(boardNo, menu, cate, starImg);
				}
	         }
	         , error: function() {
	            console.log("AJAX 실패")

	         }
	      })
	  });

function deleteBasket(boardNo, menu, cate, starImg){
	
		$.ajax({
		       type: "post"
		       , url: "/share/deletebasket"
		       , data: {
				boardNo : boardNo
				, menu : menu
				, cate : cate
		       }
		       , dataType: "json"
		       , success: function( res ) {
		          console.log("AJAX 성공")
		          console.log(res.deleteCheck)
		          if ( res.deleteCheck){
					starImg.attr("src", "/resources/img/emptyStar.png");
		          }
		       }
		       , error: function() {
		          console.log("AJAX 실패")
		
		       }
		})

	}
});
</script>

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
.heart {
	float: right;
    position: absolute;
    display: inline-block;
    margin-top: 333px;
    margin-left: 135px;
	
}


.star {
	width: 30px;
	height: 30px;
	margin-left: -5px;
	margin-bottom: 30px; 
}




</style>

<div class="container">

<c:forEach  var="list" items="${list }" begin="0" end="0">
	<c:if test="${list.MENU == 2 and list.CATE == 1 }">
		<h3>나눔해요 / 물품</h3>	
	</c:if>
	<c:if test="${list.MENU == 2 and list.CATE == 2 }">
		<h3>나눔해요 / 인력</h3>	
	</c:if>
	<c:if test="${list.MENU == 2 and list.CATE == 3 }">
		<h3>나눔해요 / 공간</h3>	
	</c:if>
</c:forEach>

<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
  <div class="row">
  </c:if>
  	
    <div class="write-container">
    
    	${list.BASKET_STATUS }
    	<c:if test="${list.BASKET_STATUS eq 1}">
	        <span class="heart"><img class="star" id="star${list.BOARD_NO}+${list.MENU}+${list.CATE}"src="/resources/img/star.png"></span>
    	</c:if>
    	<c:if test="${list.BASKET_STATUS eq 0}">
	        <span class="heart"><img class="star" id="star${list.BOARD_NO}+${list.MENU}+${list.CATE}"src="/resources/img/emptyStar.png"></span>
    	</c:if>
        
        <h6 class="no">no. ${list.BOARD_NO}</h6>
        <a class = "boardNo" href="/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}" board_no="${list.BOARD_NO }"><h6 class="title">제목 : ${list.TITLE }</h6></a>
        <c:if test="${ not empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/></a>
	        </div>
        </c:if>
        <c:if test="${ empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/resources/img/noimg.png"/></a>
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
		<a class="btn btn-secondary" href="/share/write?menu=${param.menu }&cate=${param.cate}">글쓰기</a>
	</c:if>
</div>

<small class="float-end mb-3">total : ${paging.totalCount }</small><br>

</div> <!-- .container -->
<br>


<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

</script>

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
.heart {
	float: right;
    position: absolute;
    display: inline-block;
    margin-top: 333px;
    margin-left: 135px;
	
}


.star {
	width: 30px;
	height: 30px;
	margin-left: -5px;
	margin-bottom: 30px; 
}




</style>

<div class="container">

<c:forEach  var="list" items="${list }" begin="0" end="0">
	<c:if test="${list.MENU == 2 and list.CATE == 1 }">
		<h3>나눔해요 / 물품</h3>	
	</c:if>
	<c:if test="${list.MENU == 2 and list.CATE == 2 }">
		<h3>나눔해요 / 인력</h3>	
	</c:if>
	<c:if test="${list.MENU == 2 and list.CATE == 3 }">
		<h3>나눔해요 / 공간</h3>	
	</c:if>
</c:forEach>

<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
  <div class="row">
  </c:if>
  	
    <div class="write-container">
    
    	${list.BASKET_STATUS }
    	<c:if test="${list.BASKET_STATUS eq 1}">
	        <span class="heart"><img class="star" id="star${list.BOARD_NO}+${list.MENU}+${list.CATE}"src="/resources/img/star.png"></span>
    	</c:if>
    	<c:if test="${list.BASKET_STATUS eq 0}">
	        <span class="heart"><img class="star" id="star${list.BOARD_NO}+${list.MENU}+${list.CATE}"src="/resources/img/emptyStar.png"></span>
    	</c:if>
        
        <h6 class="no">no. ${list.BOARD_NO}</h6>
        <a class = "boardNo" href="/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}" board_no="${list.BOARD_NO }"><h6 class="title">제목 : ${list.TITLE }</h6></a>
        <c:if test="${ not empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/></a>
	        </div>
        </c:if>
        <c:if test="${ empty list.THUMBNAIL_NAME  }">
	        <div>
	        	<a href="/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}&cate=${list.CATE}"><img class="preview" src="/resources/img/noimg.png"/></a>
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
		<a class="btn btn-secondary" href="/share/write?menu=${param.menu }&cate=${param.cate}">글쓰기</a>
	</c:if>
</div>

<small class="float-end mb-3">total : ${paging.totalCount }</small><br>

</div> <!-- .container -->
<br>


<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
