<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
#AdminEmail{
	background-color: #ff8108;
	width: 302px;
}
</style>

<script type="text/javascript">
let code = "";     //이메일 인증 저장위한 코드
function sendEmail() {
	let emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if (!emailCheck.test($("#email").val())) {
		alert("이메일 형식에 맞추어 작성하세요");
	} else {
		let email = $("#email").val();  //입력한 이메일
		
		$.ajax({
			url: "/admin/emailSend",
			type: "post",
			data: {'m_email':email},
			success: function(rnum) {
				//alert("s");
				alert("기입하신 이메일로 인증번호를 전송했습니다.");
				
				$("#codeInput").attr("disabled", false); //입력칸 활성화
				code = rnum;
			},
			error: function () {
				alert("fail");
			}
		});
	}
}




</script>

<!-- 안쪽 내용 -->
<div id="AdminContent">

<form action="/admin/emailSend" method="get">
  <div>
    <input type="text" name="email" id="email"  size="120"
    style="width: 100%" placeholder="상대의 이메일"
    class="form-control">
  </div>
  
    <p>
      <div align="center">
      <!-- 내용 -->
        <textarea name="content" cols="120" rows="5"
        style="width: 100%; resize: none" placeholder=
        	"Needit 홈페이지를 방문해주셔서 감사합니다.
             저희 서비스를 이용해 주셔서 감사합니다.
             많은 이용 부탁드립니다."
        class="form-control" disabled="disabled"></textarea>
      </div>
    <p>
  <div align="center">
    <input type="submit" value="메일 보내기" class="btn btn-warning" onclick="sendEmail()">
  </div>
</form>

</div><!-- .AdminContent -->


</body>
</html>