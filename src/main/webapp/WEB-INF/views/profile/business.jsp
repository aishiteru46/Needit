<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>업체등록</h1>
<hr>

<form action="/profile/business" method="post">
	<label>업체 이름</label><input type="text" name="businessName"><br>
	<label>업체 번호</label><input type="text" name="businessPhone"><br>
	<label>업체 주소</label><input type="text" name="businessAddr"><br>
	<label>업체 링크</label><input type="text" name="businessUrl"><br><br>
	
	<button>업체등록!</button>
	
</form>

</body>
</html>