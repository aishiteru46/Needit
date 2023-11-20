<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
#booktable, th, td {

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
    };

    reader.readAsDataURL(event.target.files[0]);
}// .setThumbnail() End
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




<div class="container">
<h1>마이페이지</h1>
<hr>


${userGrade}

프로필 올릴때 user_page 생성되게해둔상태인데 이러면 안되고<br>
회원가입때 usertb에 id 들어가면서 user_page도 동시에 생겨야 될거같음<br>
인서트로해놔서 수정안되고 처음등록만 되는데 나중에 업데이트로 수정






<div id="profileImageContainer">
    <c:if test="${not empty img}">
        <img id="profileImage" src="/upload/${img.thumbnailName}" alt="User Profile Image">
    </c:if>
</div>





<h3>${id}님의 프로필사진</h3>

<div class="panel panel-default">
   <div class="panel-body">
      <form action="./imgupdate" method="post" enctype="multipart/form-data">
         <input type="hidden" name="id" value="${id}"/>
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
            <tr>
               <td style="width: 110px; vertical-align: middle;">아이디</td>
               <td>${id}</td>
            </tr>
            <tr>
               <td style="width: 110px; vertical-align: middle;">사진 업로드</td>
               <td colspan="2">
                  <span class="btn btn-default">
                     이미지를 업로드하세요.<input type="file" name="file" onchange="setThumbnail(event);"/>
                  </span>
               </td>            
            </tr>      
            <tr>
               <td colspan="2" style="text-align: left;">
                  <input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
                   <!-- 이미지 삭제 버튼 -->
                   <button type="button" class="btn btn-danger btn-sm pull-right" onclick="deleteImg()">이미지 삭제</button>
               </td>
               
            </tr>
         </table>
      </form> 
      <!-- 썸네일 미리보기를 담을 div 추가 -->
      <div id="thumbnail_container"></div>
   </div>
</div>


<script>
    // 이미지 삭제 함수
    function deleteImg() {
        if (confirm('이미지를 삭제하시겠습니까?')) {
            // Ajax를 이용하여 서버에 이미지 삭제 요청을 보냅니다.
            var xhr = new XMLHttpRequest();
            
            // 아래 URL은 서버 측의 이미지 삭제를 처리하는 엔드포인트로 변경해야 합니다.
            var url = "./imgdelete";
            
            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            
            // 여기에서 필요한 경우에 따라 데이터를 전송합니다.
            var formData = "id=" + encodeURIComponent(document.getElementById("id").value);
            xhr.send(formData);

            // 이미지를 화면에서 감추는 부분
            var thumbnailContainer = document.getElementById("thumbnail_container");
            thumbnailContainer.innerHTML = ""; // 썸네일을 비우거나 다른 방식으로 감추세요.
        }
    }
</script>

<hr>

<div class="container mt-5">
    <h2>자기소개</h2>
    
    <!-- 자기소개글을 입력하는 텍스트박스 -->
    <form action="./introduce" method="post">
            <input type="hidden" id="id" name="id" value="${id}">
        <div class="mb-3">
            <textarea class="form-control" id="intro" name="intro" rows="5" maxlength="100" >${userPage.intro}</textarea>
        </div>

        <button type="submit" class="btn btn-primary">저장</button>
    </form>
</div>




<hr>

<a href="javascript:void(0);" class="btn btn-danger" onclick="confirmAndSubmit('${id}')">회원탈퇴</a><br>

지금 usertb테이블의 id를 board테이블 에서 write_id로 사용하고 있어서 회원삭제가 안됨<br>
회원탈퇴시 글까지 삭제 되는 경우 - > DB에 cascade구문 추가 <br>
회원탈퇴시 글은 살리는 경우 -> DB에 usertb에 is_deleted컬럼 추가해서 탈퇴시 delete로 지우지말고 update로 is_daleted true해주고 이후에 회원조회할때마다 is_deleted 상태인애들은 빼고 조회해서 탈퇴한애들 숨겨두면 됨
둘중하나 선택해야함

<script>
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
</script>

<hr>

<a href="infoupdate" class="btn btn-success">회원정보 수정</a>

<br>
회원정보수정은 마이페이지에서 독립되어있어야 예쁠듯
<hr>

<table id="booktable">
<c:forEach items="${booklist }" var="list" begin="0" end="10">
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
		<td>${list.START_TIME }</td>
		<td>${list.END_TIME }</td>
		<td><button>승인</button></td>
		<td><button>취소</button></td>
	</tr>
	
</c:forEach>
</table>

<hr>






<c:import url="/WEB-INF/views/layout/footer.jsp" />