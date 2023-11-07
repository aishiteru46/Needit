<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<style type="text/css">
#AdminUl li{
	list-style: none;
	color: white;
	font-size: 35px;
	margin-bottom: 8px;
	font-weight: bold;
}
</style>

</head>
<body>

	

<!-- 니딧 로고 -->
<img alt="니딧로고" src="/resources/img/needitAdmin_white.png" style="float: left; width: 300px; height: 105px;">
<!-- 위쪽 배경 -->
<div id="AdminTop" style="border: 0px solid rbg(522,83,63); width: 1200px; height: 100px; background: rgb(255,83,63); float: left;"></div>

<!-- 로그아웃 버튼 -->
<form action="post">
<button style="float: right; margin-right: 418px; margin-top: -67px; border: 0px solid; border-radius: 5px; width: 82px; height: 37px;" >로그아웃</button>
</form>

<!-- 목록 -->
<div style="float: left; position: absolute; margin-top: 110px; margin-left: -28px;">
<ul id="AdminUl">
<li>1:1 채팅문의 목록</li>
<li>신고접수 목록</li>
<li>업체요청 목록</li>

<li>메인배너 수정</li>
<li>공지등록</li>
<li>회원 이메일 발송</li>
</ul>
</div>

<!-- 왼쪽 배경 -->
<div id="AdminLeft" style="border: 0px solid rbg(522,83,63); width: 300px; height: 900px; background: rgb(255,83,63);"></div>




<!-- 안쪽 내용 -->
<div>

</div>




</body>
</html>