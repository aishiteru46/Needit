<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
html {
/* 	background-color: #ff533f; */
 	background-size : cover; 
	background-image: url('../resources/img/3.jpg') ;  
}
form {
     width: 450px; 
     padding: 20px;
     
}
#login {
	height: 5.8em;
	padding: 0;
	width: 130px; 
	color: white; 
	background-color: #ff533f;
	border-color: #ff533f;
}
#needit{
	color: white; 
	background-color: #ff533f;
	border-color: #ff533f;
}

</style>
</head>
<body>



<div class="container position-relativ ">
<div class="form col-7 mx-auto my-5 ">
<form action="./login" method="post"  class="card shadow-lg position-absolute top-50 start-50 translate-middle form-signin" >
<img class="mb-3 float-start" src="../resources/img/needit..png" width="250" height="45" >
<div class="clearfix"></div>
	<div class="row mb-2">
		<div class="col-8">
			<input type="text" class="form-control mb-3" name="id" id="id" placeholder="아이디를 입력해주세요" required="required">
			<input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호를 입력해주세요" required="required">
		</div>
			<button class="col-3 mr-2 btn btn-danger float-end" id="login" >로그인</button>
	</div>

	<div class="mb-3">
	<label class="float-start"><input type="checkbox" > 로그인 상태 유지</label>	
		<div class="float-end">
			<a>아이디찾기  </a>
			<a>  비밀번호찾기</a>
		</div>
	</div>
	<div>
		<a id="needit"class=" col-12 btn btn-danger"href="./signup">회원가입</a>
	</div>
</form>
</div>
<div class="col-6 mx-auto">

</div>
</div><%--컨테이너 --%>


</body>
</html>