<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var urlEndPoint = 'http://localhost:8088/subcribe'; // Sse 엔드포인트
	var enventSource = EventSource(urlEndPoint);
	
	eventSource.addEventListener("lateNews", function (event) {
		var articleData = Json.parse( event.data );
		console.log("Event : " + event)
		addBlock(articleData.title, articleData.text ;
	});
	
})// 제이쿼리 펑션 끝
</script>
</head>
<body>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>
<h1>안녕하세용 ㅋ </h1>




</body>
</html>