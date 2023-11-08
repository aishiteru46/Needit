<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Needit</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">
#needit{
	color: white; 
	background-color: #ff533f;
}
#needitFont{
	color: #ff533f;
}

.wrap{
	width: 1200px;
}
.header h1 a {
	text-decoration: none;
}

</style>


</head>
<body>




<div class ="wrap mx-auto">
<div class="text-center float-end ">
	<%-- 비로그인 --%>
	<c:if test="${empty isLogin }">
		<a href="../user/login"><img src="/resources/img/mypageicon.png" style="height: 40px; width: 40px;"></a>
	</c:if>
	
	<%-- 로그인 --%>
	<c:if test="${not empty isLogin and isLogin }">
		<a class="btn btn-danger"href="../member/mypage">마이페이지</a>
		<a class="btn btn-secondary" href="../member/logout">로그아웃</a>
	</c:if>
</div>
<div class="clearfix"></div>
<header class="header text-center my-4">
	<a href="/member/main"><img src="/resources/img/needit..png" width="500" height="100" ></a>
	<br><br>
	<div class="fs-3" id="menu">
	<nav>
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item active"><a class="nav-link active" aria-current="page" href="#">대여해요</a>
				<ul>
					<li><a href="menu/rent/list?menu=m1c1">물품</a>
					<li><a>인력</a>
					<li><a>공간</a>
				</ul>
			</li>
			<li class="nav-item active"><a class="nav-link" href="#">나눔해요</a>
				<ul>
					<li><a>물품</a>
					<li><a>인력</a>
					<li><a>공간</a>
				</ul>
			</li>
			<li class="nav-item active"><a class="nav-link" href="#">해주세요</a>
				<ul>
					<li><a>물품</a>
					<li><a>인력</a>
					<li><a>공간</a>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">동네업체</a></li>
			<li class="nav-item"><a class="nav-link" href="#">주변지도</a></li>
		</ul>

	</nav>
	</div>
	

	
	
</header>
    