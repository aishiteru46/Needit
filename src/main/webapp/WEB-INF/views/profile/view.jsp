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

<div class="container">
<h1>마이페이지</h1>
<hr>

${userGrade}



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


<script>


$(document).ready(function() {
    $('#uploadForm').click(function(e) {
        e.preventDefault();

        // FormData 객체 생성
        var formData = new FormData($(this)[0]);

        // Ajax를 통한 파일 업로드
        $.ajax({
            type: 'POST',
            url: '/profile/imgupdate',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                // 업로드 성공 시 이미지를 바로 갱신
                $('#profileImage').attr('src', '/upload/' + response.thumbnailName);
             // 콘솔에 성공 메시지 출력
                console.log('업로드 성공:', response);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    });
});
</script>

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
                 이미지를 업로드하세요.<input type="file" name="file"/>
               </span>
             </td>            
           </tr>      
           <tr>
             <td colspan="2" style="text-align: left;">
                <input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
             </td>             
           </tr>
         </table>
      </form> 
    </div>
   </div>
 </div>


<div class="container mt-5">
    <h2>자기소개</h2>
    
    <!-- 자기소개글을 입력하는 텍스트박스 -->
    <form action="./introduce" method="post">
        <div class="mb-3">
            <label for="introduce" class="form-label">자기소개글:</label>
            <textarea class="form-control" id="introduce" name="introduce" rows="5" maxlength="100"  placeholder="여기에 자기소개를 작성해주세요..."></textarea>
        </div>

        <button type="submit" class="btn btn-primary">저장</button>
    </form>
</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />