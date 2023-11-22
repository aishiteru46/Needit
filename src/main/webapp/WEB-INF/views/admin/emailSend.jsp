<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
/* 왼쪽 목록 선택시 색상 */
#AdminEmail{
	background-color: #ff8108;
	width: 302px;
}

/* 이메일 목록 */
#emailList{
	width: 1200px;
    height: 153px;
	border: 1px solid black;
	margin-left: 10px;
}

.emailGroup {
    display: inline-block;
    vertical-align: top;
    margin-right: 20px;
}

</style>

<script type="text/javascript">


function sendEmail(event) {
    event.preventDefault();

    let selectedEmails = [];
    $('input[name="email"]:checked').each(function() {
        selectedEmails.push($(this).val());
    });

    let title = $("#emailTitle").val();
    let content = $("#emailContent").val();
    
    if (!selectedEmails || selectedEmails.length === 0) {
        alert("이메일을 선택해주세요.");
        return; 
    }
    if (title.trim() === '') {
        alert("제목을 입력해주세요.");
        return; 
    }

    $.ajax({
        url: "/admin/emailSend",
        type: "post",
        traditional: true,
        data: {
            'm_email': selectedEmails,
            'title': title,
            'content': content
        },
        success: function(response) {
            alert("이메일이 정상적으로 발송되었습니다.");
            $("#emailTitle").val('');
            $("#emailContent").val('');
            $('input[name="email"]').prop('checked', false);
        },
        error: function () {
            alert("전송실패");
        }
    });
}

$(document).ready(function() {
    $('#emailForm').submit(sendEmail);
    
    $('#selectAll').click(function() {
        $('input[name="email"]').prop('checked', $(this).prop('checked'));
    });
});

var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}


</script>

<!-- 안쪽 내용 -->
<div id="AdminContent">

<!-- <label>이메일 목록</label><br> -->
<!-- <div id="emailList"> -->
<!-- <select name="email" id="email" > -->
<!-- 	<option value="all">전체</option> -->
<%-- 		<c:forEach var="list" items="${emailList}"  > --%>
<%-- 			<option value="${list.EMAIL}"<c:if test="${(email) == (list.EMAIL)}">selected</c:if>>${list.EMAIL}</option> --%>
<%-- 		</c:forEach> --%>
<!-- </select> -->
<!-- </div> -->

<label style="margin-left: 10px;">이메일 목록</label><br>
<div id="emailList" onclick="showCheckboxes()">
    <div style="margin-left: 20px; margin-top: 4px;">
	    <input type="checkbox" id="selectAll" name="selectAll">
	    <label for="selectAll" >전체 선택</label><br>
    </div>

    <div class="emailGroup">
        <c:forEach var="list" items="${emailList}" varStatus="loop">
            <c:if test="${loop.index % 5 == 0}">
                </div><div class="emailGroup">
            </c:if>
            <input type="checkbox" id="${list.EMAIL}" name="email" value="${list.EMAIL}">
            <label for="${list.EMAIL}">${list.EMAIL}</label><br>
        </c:forEach>
    </div>
</div><br>

<form id="emailForm" action="/admin/emailSend" method="post">
  
<!-- 제목 -->
<div align="center">
	<input type="text" name="title" id="emailTitle" size="120" style="width: 100%" placeholder="제목을 입력해주세요" class="form-control">
</div><br>

<!-- 내용 -->
<div align="center">
	<textarea name="content" id="emailContent" cols="120" rows="12" style="width: 100%; resize: none" placeholder="내용" class="form-control"></textarea>
</div><br>

<div align="center">
	<input type="submit" value="메일 보내기" class="btn btn-warning" onclick="sendEmail()">
</div>
</form>

</div><!-- .AdminContent -->


</body>
</html>