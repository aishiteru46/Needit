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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.reportBtn').click(function() {
	$('.reportBtn').css('outline', 'none');
	  
	$(this).css('outline', '2px solid #E8133D');
	});
});


</script>

</head>
<body>

<div id="report">
<div id="reportIn">
<!-- <form action="/admin/report" method="post"> -->
	<div>
	<input class="reportBtn" id="reportBtn1" type="submit" value="광고성" name="reportType" >
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn2" type="submit" value="음란물" name="reportType" >
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn1" type="submit" value="욕설" name="reportType" >
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn2" type="submit" value="불법 정보" name="reportType">
	</div>
	
	<div>
	<input class="reportBtn" id="reportBtn1" type="submit" value="개인정보 노출" name="reportType" >
	</div>
<!-- </form> -->
</div><!-- .reportIn -->

</div><!-- .report -->

</body>
</html>