<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

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

.write-container select {
    width: 320px;
    height: 30px;
}

.row {
	text-align: center;
}

.write-container {
    height: 380px;
    width: 350px;
    margin: 1em auto; 
    text-align: center; 
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

</style>

<!-- <script type="text/javascript"> -->
<!-- // $(function(){ -->
<!-- //   $.ajax({ -->
<!-- //         type: "get" -->
<!-- //         , url: "/menu/share/thumbnail" -->
<!-- //         , data: { -->
		
<!-- //         } -->
<!-- //         , dataType: "json" -->
<!-- //         , success: function( res ) { -->
<!-- //            console.log("AJAX 성공") -->
<!-- //            if (res.fileData.length > 0) { -->
<!-- //                 var imagePath = res.fileData[0].storedName; -->
<!-- //                 $("#preview").attr("src", "../upload/" + imagePath); -->
<!-- //             } -->
		
<!-- //         } -->
<!-- //         , error: function() { -->
<!-- //            console.log("AJAX 실패") -->

<!-- //         } -->
<!-- //      }) -->
	
<!-- // }) -->
<!-- </script> -->


</head>
<body>

<c:forEach items="${list }" var="list" begin="0" end="0">
<c:if test="${ list.MENU eq 'm2c1' }">
<h1>나눔 게시판 물품</h1>
</c:if>

<c:if test="${ list.MENU eq 'm2c2' }">
<h1>나눔 게시판 인력</h1>
</c:if>

<c:if test="${ list.MENU eq 'm2c3' }">
<h1>나눔 게시판 공간</h1>
</c:if>
</c:forEach>
<hr>


<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
 	 <div class="write-container">
 	 	 <h6 class="no">no. ${list.BOARD_NO}</h6>
   		 <a href="/menu/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}"><h6 class="title">제목 : ${list.TITLE }</h6></a>
  		<c:if test="${ not empty list.THUMBNAIL_NAME  }">
  		<div >
			<a href="/menu/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}"><img class="preview" src="/upload/${list.THUMBNAIL_NAME}"/></a>
  		</div>
  		</c:if>
  		<c:if test="${ empty list.THUMBNAIL_NAME  }">
  		<div>
			<a href="/menu/share/view?boardNo=${list.BOARD_NO }&menu=${list.MENU}"><img class="preview" src="/resources/img/noimg.png"/></a>
  		</div>
  		</c:if>
    	<h4 class="col-md-4">${list.WRITER_ID }</h4>
    	<h5 class="col-md-4">${list.PRICE}</h5> <h6>${list.HIT}</h6>
  </div>
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
  <br>
</c:forEach>



<c:forEach var="menuData" items="${list}" begin="0" end="0">
<a href="/menu/share/write?menu=${menuData.MENU}"><button>글쓰기</button></a>
</c:forEach>

<small class="float-end mb-3">total : ${paging.totalCount }</small>



<c:import url="/WEB-INF/views/layout/pagination.jsp"/>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
