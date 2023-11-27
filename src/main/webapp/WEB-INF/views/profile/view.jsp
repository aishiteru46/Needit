<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.rentTable, th, td {

	border: 1px solid #ccc;
	

}
</style>
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
	$(".cancelBtn").click(function(){
		var cancelBtn = $(this);
		  $.ajax({
		         type: "post"
		         , url: "/profile/cancel"
		         , data: {
		        	 rentNo: cancelBtn.data("rent_no")
		             , boardNo: cancelBtn.data("board_no")
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
    })
    
});

</script>

<style type="text/css">

#thumbnail_container{
    border: 1px solid #ccc;
    width: 200px;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
}

</style>

<style>
    #profileImageContainer {
        width: 300px; /* 프로필 이미지 컨테이너의 너비 */
        height: 300px; /* 프로필 이미지 컨테이너의 높이 */
        overflow: hidden;
        border-radius: 50%; /* 반지름 50%로 설정하여 동그랗게 만듭니다. */
    }

    #profileImage {
        width: 100%; /* 이미지를 100%로 설정하여 부모 컨테이너에 맞게 합니다. */
        height: auto;
        border-radius: 50%; /* 이미지도 둥글게 만듭니다. */
    }
</style>

<style>
        .hidden {
            display: none;
        }
</style>


<style type="text/css">
   #boardSection {
      margin-top: 25px;
      margin-bottom: -22px;
   }

   .listType {
      width: 100%;
      border-collapse: collapse;
      margin-top: 25px;
   }

   .listType th,
   .listType td {
      text-align: center;
      border-bottom: 1px solid #ccc;
      padding: 10px;
   }

   .listType th {
      background-color: rgb(255, 83, 64);
      color: white;
      font-weight: bold;
      height: 40px;
   }

   .listType a {
      text-decoration: none;
      color: black;
   }

   .listType tr:hover {
      background-color: #f5f5f5;
   }
   
   .listType th.title {
      
      width: 50%; /* 원하는 넓이로 조절 */
   }
</style>

<div class="container">
<h1>마이페이지</h1>
<hr>
${userGrade }
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

</c:choose>

<div id="profileImageContainer" >
    <c:if test="${not empty img}">
        <img id="profileImage" src="/upload/${img.thumbnailName}" alt="User Profile Image">
    </c:if>
    <c:if test="${empty img}">
        <img id="profileImage" src="/resources/img/defaultProfile.png" alt="User Profile Image">
    </c:if>
</div>
<c:if test="${not empty img}">
	<div class="btn btn-danger btn-sm pull-right" id="imgDelete" >이미지 삭제</div>
</c:if>
<!-- 이미지 삭제 버튼 -->

<h3>${nick}님의 프로필</h3>

<div class="panel panel-default">
   <div class="panel-body">
      <form id="uploadForm" action="./imgupdate" method="post" enctype="multipart/form-data">
<!--       <form  enctype="multipart/form-data"> -->
         <input type="hidden" name="id" value="${id}"/>
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
            <tr>
               <td style="width: 150px; vertical-align: middle;">아이디</td>
               <td>${id }</td>
            </tr>
            <tr>
               <td style="width: 150px; vertical-align: middle;">닉네임</td>
               <td>${nick }</td>
            </tr>
            <tr>
               <td style="width: 150px; vertical-align: middle;">등급</td>
               <td>${user.grade }</td>
            </tr>
            <tr>
               <td style="width: 150px; vertical-align: middle;">가입일</td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.joinDate }"/></td>
            </tr>
            <tr>
               <td style="width: 150px; vertical-align: middle;">주소</td>
               <td>${user.addr1 }<br>${user.addr2 }</td>
            </tr>
            <tr>
               <td style="width: 150px; vertical-align: middle;">이메일 수신</td>
               <c:choose>
        			<c:when test="${user.emailAgr eq 1}">
                		<td>동의</td>
                	</c:when>
        			<c:when test="${user.emailAgr eq 0}">
                		<td>미동의</td>
                	</c:when>
                </c:choose>
            </tr>
            <c:if test="${empty img}">
            <tr id="previewSection"  style="display: none;">
            	<td colspan="2" style="text-align: left;">
            	
               	<!-- 썸네일 미리보기를 담을 div 추가 -->
               	<div id="thumbnail_container"></div>

                   <!-- 이미지 등록 버튼 -->
                   <div class="btn btn-primary btn-sm pull-right" id="imgUpdate" >등록</div>
               </td>
            </tr>
            <tr>
               <td style="width: 150px; vertical-align: middle;">사진 업로드</td>
               <td colspan="2">
                  <span class="btn btn-default">
                  
					<!-- 숨겨진 파일 입력(input type="file") 요소 -->
                     <input type="file" name="file" id="thumbnailFile" onchange="setThumbnail(event);"/>
                  </span>
               </td>            
            </tr>      
            </c:if>
         </table>
      </form> 
      
      
   </div>
</div>


<hr>

<div class="container mt-5">
    <h2>자기소개</h2>
    
    <!-- 자기소개글을 입력하는 텍스트박스 -->
    <div>
            <input type="text" id="id" name="id" value="${nick}" readonly="readonly">
        <div class="mb-3">
            <textarea class="form-control" id="intro" name="intro" rows="5" maxlength="100">${user.intro }</textarea>
        </div>

        <button type="submit" class="btn btn-primary" id="introUpdate">저장</button>
    </div>
</div>

<hr>

<a href="infoupdate" class="btn btn-success" >회원정보 수정</a><br>

<a href="/profile/business"><button>업체등록</button></a>
<hr>

<a href="javascript:void(0);" class="btn btn-danger" onclick="confirmAndSubmit('${id}')">회원탈퇴</a><br>

지금 usertb테이블의 id를 board테이블 에서 write_id로 사용하고 있어서 회원삭제가 안됨<br>
회원탈퇴시 글까지 삭제 되는 경우 - > DB에 cascade구문 추가 <br>
회원탈퇴시 글은 살리는 경우 -> DB에 usertb에 is_deleted컬럼 추가해서 탈퇴시 delete로 지우지말고 update로 is_daleted true해주고 이후에 회원조회할때마다 is_deleted 상태인애들은 빼고 조회해서 탈퇴한애들 숨겨두면 됨
둘중하나 선택해야함


<hr>


<h1>빌려줄 예약 목록</h1>
<table class="rentTable">
<c:forEach items="${myList }" var="list" begin="0" end="10">
	<tr>
		<th>게시글 번호</th>
		<th>예약 번호</th>
		<th>예약자</th>
		<th>예약 날짜</th>
		<th>예약 시작 시간</th>
		<th>예약 끝 시간</th>
		<th>승인 처리</th>
		<th></th>
		
	</tr>
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.RENT_NO }</td>
		<td>${list.RENTER_ID }</td>
		<td>${list.RENT_DATE }</td>
		<c:choose>
	    <c:when test="${list.START_TIME % 2 == 1}">
		        <c:set var="hour" value="${(list.START_TIME + 1) / 2 - 1}" />
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
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button id="confirmBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">승인</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 2 }">
			<td><button disabled="disabled">승인 완료</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button class="cancelBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">취소</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 0 }">
			<td><button disabled="disabled">취소 완료</button></td>
		</c:if>
    
	</tr>
	
</c:forEach>
</table>
<c:import url="/WEB-INF/views/layout/pagination.jsp" />
		
<hr>

<h1>빌린 예약 목록</h1>
<table class="rentTable">
<c:forEach items="${list }" var="list" begin="0" end="10">
	<tr>
		<th>게시글 번호</th>
		<th>예약 번호</th>
		<th>예약자</th>
		<th>예약 날짜</th>
		<th>예약 시작 시간</th>
		<th>예약 끝 시간</th>
		<th>승인 처리</th>
		<th></th>
		
	</tr>
	<tr>
		<td>${list.BOARD_NO }</td>
		<td>${list.RENT_NO }</td>
		<td>${list.RENTER_ID }</td>
		<td>${list.RENT_DATE }</td>
		<c:choose>
	    <c:when test="${list.START_TIME % 2 == 1}">
		        <c:set var="hour" value="${(list.START_TIME + 1) / 2 - 1}" />
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
		
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button id="confirmBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">승인</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 2 }">
			<td><button disabled="disabled">승인 완료</button></td>
		</c:if>
		
		<c:if test="${list.RENT_STATUS eq 1 }">
			<td><button class="cancelBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">취소</button></td>
		</c:if>
		<c:if test="${list.RENT_STATUS eq 0 }">
			<td><button disabled="disabled">취소 완료</button></td>
		</c:if>
	</tr>
</c:forEach>
</table>


<hr>


<h1 onclick="toggleSection('boardSection')">
   내가 쓴 글
   <span id="boardSectionArrow" style="float: right;">▼</span>
</h1>

<div id="boardSection" class="hidden">
   <table class="listType">
      <thead>
         <tr>
            <th>No.</th>
            <th class="title">제목</th>
            <th>가격(30분)</th>
            
            <th>작성일</th>
            <th>조회</th>
         </tr>
      </thead>
      <tbody>
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
               <td><fmt:formatNumber value="${board.price}" pattern="#,###" />원</td>
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
      </tbody>
   </table>
</div>

<hr>

<h1 onclick="toggleSection('commentSection')">
   내가 쓴 댓글
   <span id="commentSectionArrow" style="float: right;">▼</span>
</h1>


<div id="commentSection" class="hidden">
<table id="commentTable">
   <tr>
      <th>No.</th>
      <th>댓글</th>
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
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}"/></td>
   </tr>

</c:forEach>
</table>
</div>


${basketList }


<c:import url="/WEB-INF/views/layout/footer.jsp" />