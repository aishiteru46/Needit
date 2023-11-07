<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>Needit</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">

html {
 	background-size : cover; 
	background-image: url('../resources/img/3.jpg') ;  
}
form {
     width: 900px; 
     padding: 20px;
     
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
<div class="col-7 mx-auto my-5 ">
<form action="./signup" method="post"  class="card shadow-lg position-absolute top-50 start-50 translate-middle form-signin" >
<img class="mb-3 mx-auto d-block" src="../resources/img/needit..png" width="300" height="70" >
<div class="clearfix"></div>

<div class="form-floating">
	<div class="row">
  		<div class="col">
  			<label class="fs-3 fw-bold">아이디</label>
   	 		<input type="text" class="form-control form-control-lg mb-3" name="id" placeholder="아이디를 입력해주세요" >
  			<label class="fs-3 fw-bold">비밀번호</label>
    		<input type="password" class="form-control form-control-lg mb-3" name="pw" placeholder="비밀번호를 입력해주세요" >
  			<label class="fs-3 fw-bold">비밀번호 확인</label>
    		<input type="password" class="form-control form-control-lg mb-3" placeholder="비밀번호를 입력해주세요" >
  			<label class="fs-3 fw-bold">생년월일</label>
    		<input type="date" class="form-control form-control-lg mb-3" name="birth">
    
  		</div>
  		<div class="col">
    		<label class="fs-3 fw-bold">성별</label>
    		<select name="gender"  class="form-select form-select-lg mb-3" name="gender">
			    <option value="E">기타</option>
	    		<option value="M">남자</option>
			   	<option value="F">여자</option>
			</select>
  			<label class="fs-3 fw-bold">이름</label>
    		<input type="text" class="form-control form-control-lg mb-3" name="name" placeholder="이름을 입력해주세요" >
  			<label class="fs-3 fw-bold">닉네임</label>
    		<input type="text" class="form-control form-control-lg mb-3" name="nick" placeholder="닉네임을 입력해주세요" >
  			<label class="fs-3 fw-bold">전화번호</label>
    		<input type="text" class="form-control form-control-lg mb-3" name="phone" placeholder="전화번호를 입력해주세요" >
  		</div>
  		<div>
  			<label class="fs-3 fw-bold">이메일</label>
   	 		<input type="email" class="form-control form-control-lg mb-3" name="email" placeholder="이메일을 입력해주세요" >
  			<label class="fs-3 fw-bold">주소</label>
    		<input type="text" class="form-control form-control-lg mb-3" name="addr" placeholder="주소을 입력해주세요" >
  		</div>
	</div>
</div>


	<div>
		<a id="needit"class=" col-12 btn btn-danger btn-lg"href="./join">회원가입</a>
	</div>
</form>
</div>
<div class="col-6 mx-auto">

</div>
</div><%--컨테이너 --%>


</body>
</html>