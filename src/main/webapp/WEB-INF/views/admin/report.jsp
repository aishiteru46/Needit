<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 버튼 크기 */
:root {
  --button-width: 400px;
  --button-height:50px;
}

/* 바깥 div */
#report{
	margin: 0 auto;
	border: 3px solid rgb(255,83,63);
	width: calc(var(--button-width) + 13px);
	height: calc(var(--button-height)*5 + 55px);
	border-radius: 5px; 
}
/* 안쪽 div */
#reportIn{
	margin: 0 3px;
	margin-top: 8px;
}

/* 버튼 스타일 */
#reportBtn1, #reportBtn2{
	border-radius: 5px;
	width: var(--button-width);
	height: var(--button-height);
	border: 0;
	font-size: 25px;
	margin-bottom: 8px;
}
/* 버튼 2번 색깔 */
#reportBtn2{
	background-color: rgb(255,83,63);
	color: white;
}


</style>


</head>
<body>

<div id="report">
<div id="reportIn">
<form action="/admin/report" method="post">
	<div>
	<input class="reportBtn" id="reportBtn1" type="button" value="광고성" name="adver" >
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn2" type="button" value="음란물" name="adult" >
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn1" type="button" value="욕설" name="abuse" >
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn2" type="button" value="불법 정보" name="illegal">
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn1" type="button" value="개인정보 노출" name="privacy" >
	</div>
</form>
</div><!-- .reportIn -->

</div><!-- .report -->

</body>
</html>