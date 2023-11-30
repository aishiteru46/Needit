<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
//썸네일 미리보기
function setThumbnail(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
      var thumbnailContainer = document.querySelector("#thumbnail_container");
      thumbnailContainer.style.backgroundImage = "url('" + event.target.result + "')";
      document.getElementById("previewSection").style.display = "block"; // 파일 선택 시 보이도록 설정
  };

  reader.readAsDataURL(event.target.files[0]);
}// .setThumbnail() End

function confirmAndSubmit(userId) {
    var confirmYes = window.confirm("정말 탈퇴하시겠습니까?");
    
    if (confirmYes) {
        // 폼 생성
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "./delete");

        // hidden input 필드 추가
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "id");
        hiddenField.setAttribute("value", userId);

        // 폼에 hidden input 추가
        form.appendChild(hiddenField);

        // body에 폼 추가
        document.body.appendChild(form);

        // 폼 제출
        form.submit();
    }
}

//프로필사진바로삭제
$(function(){

 $("#imgDelete").click(function(){
    console.log("프로필사진 삭제 작동")
    
    $.ajax({
        type: "get"
        , url: "/profile/imgdelete"
        , data: {}
        , dataType: "json"
        , success: function( res ) {  
           console.log("AJAX 성공")
          location.reload()
          
        }
       , error: function() {
           console.log("AJAX 실패")
       
        }
    })
 })
 
});


$(function(){

   //프로필사진 등록
    $("#imgUpdate").click(function(){
       console.log("프로필사진 업데이트 작동")
       
       var formData = new FormData($("#uploadForm")[0]);
       
       $.ajax({
           type: "post"
           , url: "/profile/imgupdate"
           , data: formData
           , processData: false  // 필수
                , contentType: false  // 필수
           , dataType: "json"
           , success: function( res ) {  
              console.log("AJAX 성공")
             location.reload()
             
           }
          , error: function() {
              console.log("AJAX 실패")
          
           }
       })

    })
    
 });


 //자기소개 수정
 $(function(){
    $("#introUpdate").click(function(){
       console.log("자기소개 업데이트 작동")
       
       $.ajax({
           type: "post"
           , url: "/profile/introduce"
           , data: {
              
              id : "${id}"
              , intro : $("#intro").val()
              
              
           }
           , dataType: "json"
           , success: function( res ) {  
              console.log("자기소개 업데이트 성공")
             
           }
          , error: function() {
              console.log("AJAX 실패")
          
           }
       })
    })
    
 });
 
 
function toggleSection(sectionId) {
    var section = document.getElementById(sectionId);
    section.classList.toggle('hidden');
}

function toggleSection(sectionId) {
  var section = document.getElementById(sectionId);
  var arrow = document.getElementById(sectionId + 'Arrow');

  if (section.style.display === 'none') {
    section.style.display = 'block';
    arrow.innerHTML = '▲'; // 펼쳐진 상태에 대한 원하는 기호로 변경
  } else {
    section.style.display = 'none';
    arrow.innerHTML = '▼'; // 축소된 상태에 대한 원하는 기호로 변경
  }
}


</script>

<script type="text/javascript">

//예약 승인 
$(function(){
	$("#confirmBtn").click(function(){
		var confirmBtn = $(this);
		  $.ajax({
	         type: "post"
	         , url: "/profile/confirm"
	         , data: {
	        	 rentNo: confirmBtn.data("rent_no")
	             , boardNo: confirmBtn.data("board_no")
	         }
	         , dataType: "json"
	         , success: function( res ) {
	            console.log("AJAX 성공")
	            location.reload()
	         }
	         , error: function() {
	            console.log("AJAX 실패")
	
	         }
	      })
		
	});
})


$(function(){

   $(".cancelBtn").click(function() {
	   var cancelBtn = $(this);
	      
	      $.ajax({
	         type: "post"
	         , url: "/cancel"
	         , data: {
	            merchantUid: cancelBtn.data("uid")
	            , rentNo: cancelBtn.data("no")
	            , boardNo: cancelBtn.data("board_no")
	         }
	         , dataType: "json"
	         , success: function( data ) {
	            console.log("결제취소, 대여 요청상태 변경 성공")
	            
	            alert("취소가 완료되었습니다.\n온라인결제를 하셨다면 환불처리 됩니다.")
	            
	            if(data.status === "success"){
	            	location.reload();
	            }
	            
	         }
	         , error: function(xhr, status, error) {
	            console.log("AJAX 실패", status, error)
	         }
	      })
	      
	   })	
	
// 	$(".cancelBtn").click(function(){
// 		var cancelBtn = $(this);
// 		  $.ajax({
// 		         type: "post"
// 		         , url: "/profile/cancel"
// 		         , data: {
// 		        	 rentNo: cancelBtn.data("rent_no")
// 		             , boardNo: cancelBtn.data("board_no")
// 		         }
// 		         , dataType: "json"
// 		         , success: function( res ) {
// 		            console.log("AJAX 성공")
// 		            location.reload()

// 		         }
// 		         , error: function() {
// 		            console.log("AJAX 실패")

// 		         }
// 		      })
//     })
    
	
    $.ajax({
        url: '/profile/checkEmail',
        method: 'GET',
        type:'json',
        data: {},  // 수정된 부분: 빈 객체를 전달하지 않음
        success: function (res) {
           console.log(res);

           if (res.email === true) {
               $("input[name=emailAgr][value=1]").prop("checked", true);
           } else {
               $("input[name=emailAgr][value=0]").prop("checked", true);
           }
        },
        error: function (error) {
            console.error(error);
        }
    });

    // 라디오 버튼 변경 시 서버에게 POST 요청
    $("input[name=emailAgr]").change(function () {
        var emailAgr = $("input[name=emailAgr]:checked").val();

        $.ajax({
            url: '/profile/email',
            method: 'POST',
            data: {
                emailAgr: emailAgr
            },
            success: function (res) {
                console.log(res);
            },
            error: function (error) {
                console.error(error);
            }
        });
    });
});

</script>
<style type="text/css">

/* 썸네일 미리보기 */
#thumbnail_container{
	width: 350px;
    height: 350px;
    float: left;
    position: absolute;
    margin-top: 67px;
    border-radius: 300px;
    background-size: cover;
    overflow: hidden;
}
/* 프로필 사진 */
#profileImg{
	width: 350px;
    height: 350px;
    background-size: cover;
    object-fit: cover;
}
/* 프로필사진, 닉네임, 사진등록 삭제 */
#profileImgContainer{ 
	width: 400px; 
    float: left; 
    margin-top: 67px;
/*     display: inline-block; */
}
/* 프로필 등록 삭제 버튼 배치 */
#profileImgUpdate{
	margin-left: 96px;
	margin-top: 6px;
}
/* 프로필 사진 크기 */
#profileImage{
	width: 350px;
	border-radius: 310px;
}
/* 유저 정보 */
#userContent{
    width: 775px;
    height: 332px;
/*     display: inline-block; */
    float: left;
}
.userInfo thead{
	width: 200px;
    background-color: azure;
}
.userInfo tbody td{
	width: 575px;
	vertical-align: middle;
  	display: table-cell;
}
.userInfo th{
	height: 48px;
}
.userInfo td{
	height: 48px;
}
/* 유저 정보 테이블 둥글게 */
#userContent table{
	border-radius: 10px;
}
/* 회원등급 사진 */
#userGrade{
	display: inline-block;
}
#userGrade img{
	width: 20px;
	height: 30px;
	display: inline-block;
	vertical-align: top;
}
/* 자기소개 너비 */
#introduce{
	width: 1134px;
    clear: both;
    margin: 0 auto;
}
/* 자기소개 id */
#introId{
	margin-bottom: 10px;
	border: 1px solid #ccc;
}
/* 자기소개칸 둥글게 */
#introId, #introText{
    border-radius: 10px;
}
/* 목록들 제목 h1 */
.listH1{
    margin-left: 16px;
}
/* 테이블 th 색상 */
.rentTable th{
	background-color: rgb(255,83,63);
	color: white;
}
/* 목록 테이블 둥글게 */
.rentTable{
	border-radius: 5px;
	width: 99%;
}
.userInfo td{
	border-bottom: 1px solid #cccccc40;
}
/* 목록들 스크롤 */
.tableScroll{
	overflow-x: hidden;
    overflow-y: scroll;
    height: 200px;
    width: 1139px;
    margin-left: 20px;
    display: inline-block;
}
/* 사진 수정 버튼 */
#fileEdit{
    border: 1px solid rgb(255,83,63);
    border-radius: 5px;
    background-color: rgb(255,83,63);
    color: white;
    width: 46px;
    height: 31px;
    text-align: center;
    font-size: 15px;
    font-weight: normal;
    padding: 3px;
    float: left;
    margin-top: -36px;
    margin-left: 162px;
}

/* 유저 정보 */
/* .userInfo th{ */
/* 	background-color: rgb(255,83,63); */
/* } */

/* 유저 정보 테이블 모양 세로 정렬 */
#userContent thead{
	float: left;
}
#userContent thead tr, thead tr th{
	display: block;
}
#userContent tbody{
	display: block;
	overflow-x: hidden;
	white-space: nowrap; 
}
#userContent tbody tr{
	display: inline-block;
}
#userContent tbody tr td{
	display: block;
}
/* 등급 크기 */
#userContent tbody tr td img{
	width: 25px;
    height: 28px;
    vertical-align: top;
}
.userInfo th div, .userInfo td div{
	margin-top: 7px;
}
/* 취소 승인 버튼 */
.agrBtn{
	font-size: 16px;
	font-weight: bold;
    width: 99%;
    height: 34px;
    margin-left: 1px;
    border-radius: 5px;
}
.rentDate{
	width: 287px;
}
.rentTable tr th:first-child {
	border-top-left-radius: 5px;
}
.rentTable tr th:last-child {
	border-top-right-radius: 5px;
	border: none;
}
.rentTable th{
	border-right: 1px solid #ccc;
}
.rentTable td{
	border-bottom: 1px solid #ccc;
	font-weight: normal;
}

/* 업체 마크 */
#userContent svg{
   display: inline-block;
   margin-left: 5px;
   margin-top: -11px;
   color: rgb(255,83,63);
}
/* 업체 링크 */
#businessUrl{
   position: absolute;
    margin-top: -69px;
    margin-left: 400px;
    margin-bottom: 24px;
    font-size: 18px;
    width: 776px;
    height: 50px;
    background-color: #ccc;
    color: black;
    border-radius: 5px;
    vertical-align: middle;
}
</style>

<div class="container">


<div id="userUpdateSection" class="float-end mb-4">
	<!-- 업체등록 버튼 -->
<!-- 	<a href="/profile/business"><button class="btn btn-info" style="color: white;">업체등록</button></a> -->
	<button type="button" class="btn btn-info" style="color: white;" data-bs-toggle="modal" data-bs-target="#businessModal">
  업체등록
	</button>
	<a href="infoupdate" class="btn btn-success" >회원정보 수정</a>
</div><!-- #userUpdateSection -->

<!-- 썸네일 미리보기를 담을 div 추가 -->
<div id="thumbnail_container"></div>

<div style="margin-top: 20px;"></div>

<div id="profileTop">
<div id="profileImgContainer" >
<div id="profileImg">
	<c:if test="${not empty img}">
	    <img id="profileImage" src="/upload/${img.thumbnailName}" alt="User Profile Image">
	</c:if>
	<c:if test="${empty img}">
	    <img id="profileImage" src="/resources/img/defaultProfile.png" alt="User Profile Image">
	</c:if>
</div><!-- #profileImg -->

<div id="profileImgUpdate">
	<!-- 이미지 등록 버튼 -->
	<div class="btn btn-primary btn-sm" id="imgUpdate" >저장</div>
	<!-- 이미지 삭제 버튼 -->
	<div class="btn btn-danger btn-sm" id="imgDelete" >삭제</div>
	<form style="margin-top: 5px; margin-left: -57px;" id="uploadForm" action="./imgupdate" method="post" enctype="multipart/form-data">
		<label for="thumbnailFile" id="fileEdit">수정</label>
		<input type="file" name="file" id="thumbnailFile" onchange="setThumbnail(event);" style="display: none;" />
	</form>
</div>
</div><!-- #profileImgContainer -->


<div class="panel panel-default" id="userContent">
<h3>${nick}님의 프로필</h3>
<c:if test="${BUSINESS_STATUS eq 1 }">
   <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-award" viewBox="0 0 16 16">
     <path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z"/>
     <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
   </svg>
</c:if>
	<input type="hidden" name="id" value="${id}"/>
	<table class="userInfo" style="text-align: center;">
	  <thead>
	   <tr>
	      <th style="border-top-left-radius: 5px;"><div>아이디</div></th>
	      <th><div>닉네임</div></th>
	      <th><div>등급</div></th>
	      
	      <th><div>가입일</div></th>
	      <th style="height: 73px;"><div style="margin-top: 19px;">주소</div></th>
	      <th style="border-bottom-left-radius: 5px;"><div>이메일 수신</div></th>
	   </tr>
	  </thead>
	   
	   <tbody>
	   <tr>
	      <td style="border-top-right-radius: 5px;"><div>${id }</div></td> 
	      <td><div>${nick }</div></td>
	      <td><div>Lv.${user.grade }
	      <!-- 회원등급 -->
			<c:choose>
				<c:when test="${userGrade eq 1}">
					<img src="/resources/img/계란.png"/>
				</c:when>
				<c:when test="${userGrade eq 2}">
					<img src="/resources/img/금간계란.png"/>
				</c:when>
				<c:when test="${userGrade eq 3}">
					<img src="/resources/img/병아리.png"/>
				</c:when>
				<c:when test="${userGrade eq 4}">
					<img src="/resources/img/닭.png"/>
				</c:when>
				<c:when test="${userGrade eq 5}">
					<img src="/resources/img/치킨.png"/>
				</c:when>
			</c:choose></div>
	      </td>
	       <td><div><fmt:formatDate pattern="yyyy-MM-dd" value="${user.joinDate }"/></div></td>
	      <td style="height: 73px;"><div>${user.addr1 }<br>
	      		${user.addr2 }</div>
	      </td>
	      <td style="border-bottom-right-radius: 5px;"><div><label>동의<input type="radio" name="emailAgr" value="1"></label>
			  	<label>미동의<input type="radio" name="emailAgr" value="0"></label></div>
		  </td>
	   </tr>
	  </tbody>
	</table>
</div><!-- #userContent -->
</div><!-- #profileTop -->

<!-- 사진, 유저정보와 자기소개 사이 마진 -->
<div style="clear: both; margin-bottom: 35px;"></div>

<!-- 업체 링크 -->
<div id="businessUrl">
   
</div>

<div id="introduce">
    <h2>자기소개</h2>
    
    <!-- 자기소개글을 입력하는 텍스트박스 -->
    <div>
        <div>
            <textarea class="form-control" id="introText" name="intro" rows="5" maxlength="100">${user.intro }</textarea>
        </div>

        <button type="submit" class="btn btn-primary mt-2" id="introUpdate">저장</button>
    </div>
</div><!-- #introduce -->

<hr>

<h1 class="listH1">빌려줄 예약 목록</h1>
<div class="tableScroll">
<table class="rentTable">
	<tr>
		<th>게시글 번호</th>
		<th>예약 번호</th>
		<th>예약자</th>
		<th>예약 날짜</th>
		<th>예약 시작 시간</th>
		<th>예약 끝 시간</th>
		<th>결제 상태</th>
		<th>승인 처리</th>
		<th>취소</th>
		
	</tr>
<c:forEach items="${myList }" var="list" begin="0" end="10">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.RENT_NO }</td>
		<td>${list.RENTER_ID }</td>
		<td class="rentDate">${list.RENT_DATE }</td>
		<c:choose>
	    <c:when test="${list.START_TIME % 2 == 1}">
		        <c:set var="hour" value="${(list.START_TIME ) / 2}" />
		        <c:set var="minute" value="00" />
		    </c:when>
		    <c:when test="${list.START_TIME % 2 == 0}">
		        <c:set var="hour" value="${list.START_TIME / 2}" />
		        <c:set var="minute" value="30" />
		    </c:when>
		</c:choose>

		<!-- 시작 시간 출력 -->
		<td>${hour}:${minute}</td>
		
		<c:choose>
		    <c:when test="${list.END_TIME % 2 == 1}">
		        <c:set var="endHour" value="${(list.END_TIME + 1) / 2 - 1}" />
		        <c:set var="endMinute" value="00" />
		    </c:when>
		    <c:when test="${list.END_TIME % 2 == 0}">
		        <c:set var="endHour" value="${list.END_TIME / 2}" />
		        <c:set var="endMinute" value="30" />
		    </c:when>
		</c:choose>
	
		<!-- 종료 시간 출력 -->
		<td>${endHour}:${endMinute}</td>
		<c:choose>
            <c:when test="${list.PAYMENT_TYPE eq 1}">
                <td><button disabled="disabled" class="agrBtn">결제됨</button></td>
            </c:when>
            <c:when test="${list.PAYMENT_TYPE eq 0}">
                <td><button disabled="disabled" class="agrBtn">직거래</button></td>
            </c:when>
        </c:choose>
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button id="confirmBtn" class="agrBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">승인</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 0 || list.RENT_STATUS eq 2 }">
			<td><button disabled="disabled" class="agrBtn">승인 완료</button></td>
		</c:if>

		<!-- 취소 빈칸 채우기 -->
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button class="cancelBtn" data-no="${list.RENT_NO }" data-uid="${list.MERCHANT_UID }" data-board_no="${list.BOARD_NO }">취소</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 0 }">
			<td><button disabled="disabled" class="agrBtn">취소 완료</button></td>
		</c:if>
    
	</tr>
	
</c:forEach>
</table><!-- .rentTable -->
</div><!-- .tableScroll -->

<%-- <small class="float-end" style=" margin-right: 8px; margin-top: -10px; margin-bottom: 20px;">total : ${paging.totalCount }</small> --%>

<%-- <c:import url="/WEB-INF/views/layout/paginationRent.jsp" /> --%>
		
<hr>


<h1 class="listH1">빌린 예약 목록</h1>
<div class="tableScroll">
<table class="rentTable">
	<tr>
		<th>게시글 번호</th>
		<th>예약 번호</th>
		<th>주문번호</th>
		<th>예약 날짜</th>
		<th>예약 시작 시간</th>
		<th>예약 끝 시간</th>
		<th>결제 상태</th>
		<th>승인 처리</th>
		<th>취소</th>
	</tr>
<c:forEach items="${list }" var="list" begin="0" end="10">
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.RENT_NO }</td>
		<td>${list.MERCHANT_UID }</td>
		<td>${list.RENT_DATE }</td>

		<c:choose>
	    <c:when test="${list.START_TIME % 2 == 1}">
		        <c:set var="hour" value="${(list.START_TIME + 1) / 2}" />
		        <c:set var="minute" value="00" />
		    </c:when>
		    <c:when test="${list.START_TIME % 2 == 0}">
		        <c:set var="hour" value="${(list.START_TIME / 2) - 1}" />
		        <c:set var="minute" value="30" />
		    </c:when>
		</c:choose>

		<!-- 시작 시간 출력 -->
		<td>${hour}:${minute}</td>
		
		<c:choose>
		    <c:when test="${list.END_TIME % 2 == 1}">
		        <c:set var="endHour" value="${(list.END_TIME + 1) / 2 - 1}" />
		        <c:set var="endMinute" value="00" />
		    </c:when>
		    <c:when test="${list.END_TIME % 2 == 0}">
		        <c:set var="endHour" value="${list.END_TIME / 2}" />
		        <c:set var="endMinute" value="30" />
		    </c:when>
		</c:choose>
	
		<!-- 종료 시간 출력 -->
		<td>${endHour}:${endMinute}</td>
		
		<c:choose>
            <c:when test="${list.PAYMENT_TYPE eq 1}">
                <td><button disabled="disabled" class="agrBtn">결제됨</button></td>
            </c:when>
            <c:when test="${list.PAYMENT_TYPE eq 0}">
                <td><button disabled="disabled" class="agrBtn">직거래</button></td>
            </c:when>
        </c:choose>
		
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button id="confirmBtn" class="agrBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">승인</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 0 || list.RENT_STATUS eq 2 }">
			<td><button disabled="disabled" class="agrBtn">승인 완료</button></td>
		</c:if>


		<!-- 취소 빈칸 채우기 -->
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button class="cancelBtn" data-no="${list.RENT_NO }" data-uid="${list.MERCHANT_UID }" data-board_no="${list.BOARD_NO }">취소</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 0 }">
			<td><button disabled="disabled" class="agrBtn">취소 완료</button></td>
		</c:if>
	</tr>
</c:forEach>
</table>
</div><!-- .tableScroll -->

<hr>

<h1 class="listH1">내가 쓴 글</h1>
<div id="boardSection" class="tableScroll">
   <table class="listType rentTable">
         <tr>
            <th>No.</th>
            <th class="title">제목</th>
            <th>게시판</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
         <c:forEach items="${board }" var="board">
            <tr>
               <td>${board.boardNo }</td>
               <td>
				    <c:choose>
				        <c:when test="${board.menu eq 1}">
				            <a href="/rent/view?boardNo=${board.boardNo}">${board.title}</a>
				        </c:when>
				        <c:when test="${board.menu eq 2}">
				            <a href="/share/view?boardNo=${board.boardNo}">${board.title}</a>
				        </c:when>
				        <c:when test="${board.menu eq 3}">
				            <a href="/please/view?boardNo=${board.boardNo}">${board.title}</a>
				        </c:when>
				        <c:when test="${board.menu eq 4}">
				            <a href="/community/view?boardNo=${board.boardNo}">${board.title}</a>
				        </c:when>
				        <c:when test="${board.menu eq 5}">
				            <a href="/business/view?boardNo=${board.boardNo}">${board.title}</a>
				        </c:when>
				    </c:choose>
				</td>
               <td>
               		<c:choose>
				        <c:when test="${board.menu eq 1}">
				            대여해요
				        </c:when>
				        <c:when test="${board.menu eq 2}">
				            나눔해요
				        </c:when>
				        <c:when test="${board.menu eq 3}">
				            해주세요
				        </c:when>
				        <c:when test="${board.menu eq 4}">
				            커뮤니티
				        </c:when>
				        <c:when test="${board.menu eq 5}">
				            동네업체
				        </c:when>
				    </c:choose>
               </td>
               <td>
                  <fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
                  <fmt:formatDate var="writeDate" value="${board.writeDate }" pattern="yyyyMMdd" />
                  <c:choose>
                     <c:when test="${writeDate lt curDate }">
                        <fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd" />
                     </c:when>
                     <c:otherwise>
                        <fmt:formatDate value="${board.writeDate }" pattern="HH:mm" />
                     </c:otherwise>
                  </c:choose>
               </td>
               <td>${board.hit}</td>
            </tr>
         </c:forEach>
   </table><!-- .listType -->
</div><!-- .tableScroll -->

<hr>

<h1 class="listH1">내가 쓴 댓글</h1>
<div id="commentSection" class="tableScroll">
<table id="commentTable" class="rentTable">
   <tr>
      <th>No.</th>
      <th>댓글</th>
      <th>게시판</th>
      <th>작성일</th>
   </tr>
   
<c:forEach items="${comment }" var="comment" begin="0" end="10">
   <tr>
      <td>${comment.CMT_NO }</td>
      <td>
         <c:choose>
               <c:when test="${comment.MENU eq 1}">
                   <a href="/rent/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 2}">
                   <a href="/share/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 3}">
                   <a href="/please/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 4}">
                   <a href="/community/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 5}">
                   <a href="/business/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               
           </c:choose>
        </td>
        
        <td>
             <c:choose>
              <c:when test="${comment.MENU eq 1}">
                  대여해요
              </c:when>
              <c:when test="${comment.MENU eq 2}">
                  나눔해요
              </c:when>
              <c:when test="${comment.MENU eq 3}">
                  해주세요
              </c:when>
              <c:when test="${comment.MENU eq 4}">
                  커뮤니티
              </c:when>
              <c:when test="${comment.MENU eq 5}">
                  동네업체
              </c:when>
          </c:choose>
          </td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}"/></td>
   </tr>

</c:forEach>
</table>
</div><!-- .tableScroll -->

<hr>

</div><!-- .container -->

<!-- 찜목록 -->

<h1 class="listH1">찜 목록</h1>
<div id="basketListSection" class="tableScroll">
<table id="basketListTable" class="rentTable">
   <tr>
      <th>No.</th>
      <th>제목</th>
      <th>게시판</th>
      <th>작성자</th>
      <th>작성일</th>
   </tr>
   
<c:forEach items="${basketList }" var="basketList" begin="0" end="10">
   <tr>
      <td>${basketList.BOARD_NO }</td>
      <td>
         <c:choose>
               <c:when test="${basketList.MENU eq 1}">
                   <a href="/rent/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 2}">
                   <a href="/share/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 3}">
                   <a href="/please/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 4}">
                   <a href="/community/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 5}">
                   <a href="/business/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
           </c:choose>
        </td>
        
        <td>
             <c:choose>
              <c:when test="${basketList.MENU eq 1}">
                  대여해요
              </c:when>
              <c:when test="${basketList.MENU eq 2}">
                  나눔해요
              </c:when>
              <c:when test="${basketList.MENU eq 3}">
                  해주세요
              </c:when>
              <c:when test="${basketList.MENU eq 4}">
                  커뮤니티
              </c:when>
              <c:when test="${basketList.MENU eq 5}">
                  동네업체
              </c:when>
          </c:choose>
          </td>
        
        <td>${basketList.WRITER_NICK }</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${basketList.writeDate}"/></td>
   </tr>

</c:forEach>
</table>
</div><!-- .tableScroll -->



<!-- 회원탈퇴 버튼 -->
<button type="button" style="margin-left: 1106px; margin-top: 20px; margin-bottom: -11px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmationModal">회원탈퇴</button>

<!-- <h1 data-bs-toggle="collapse" data-bs-target="#boardSection"> -->

<%-- <c:import url="/WEB-INF/views/layout/paginationMyBoardList.jsp" /> --%>

<!-- 업체등록 모달 -->
<div class="modal fade" id="businessModal" tabindex="-1" aria-labelledby="businessModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="businessModal">업체 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="margin: 0 auto;">
        <%@ include file="/WEB-INF/views/profile/business.jsp" %>
      </div>
    </div>
  </div>
</div>


<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="confirmationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="confirmationModalLabel">회원 탈퇴 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>정말 탈퇴하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
        <a href="/profile/delete"><button type="button" class="btn btn-danger" id="confirmYesButton">네</button></a>
      </div>
    </div>
  </div>
</div>





<c:import url="/WEB-INF/views/layout/footer.jsp" />