<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#businessReq input{
    width: 215px;
    height: 28px;
    border: 1px solid #ccc;
    margin-bottom: 3px;
    margin-left: 5px;
    vertical-align: middle;
    text-align: center;
    font-size: 14px;
    border-radius: 5px;
}
#businessReq button{
	background-color: rgb(255,83,63);
    color: white;
    border: none;
    width: 53px;
    height: 25px;
    border-radius: 5px;
    margin-left: 121px;
    margin-top: 7px;
}
#businessReq{
	width: 338px;
    height: 183px;
    border: 2px solid rgb(255,83,63);
    border-radius: 5px; 
}
#businessReq form{
	margin-left: 18px;
    margin-top: 11px;
} 
</style>

</head>
<body>

<div id="businessReq">
<form action="/profile/business" method="post">
	<label>업체 이름</label><input type="text" name="businessName"><br>
	<label>업체 번호</label><input type="text" name="businessPhone"><br>
	<label>업체 주소</label><input type="text" name="businessAddr"><br>
	<label>업체 링크</label><input type="text" name="businessUrl"><br>
	
	<button>등록</button>
	
</form>
</div>

</body>
</html>