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
<script type="text/javascript">
$(document).ready(function(){
	$('.menu_btn').click(function(){
	$('.menu_btn').toggleClass('lijo');
	$('.gnb').toggleClass('surya');

	});    
	var max_h=0;
	$(".sub").each(function () {
		var h = parseInt($(this).css("height"));
		if (max_h < h) {
			max_h = h;
		}
	});

	// 마우스 over 시
	$('.gnb').mouseenter(function () {
	// menu bg
		var menuHeight = $('#header').outerHeight();
	
		$('.hd_bg').css({
		'top': menuHeight + 'px',
		height: max_h + 30 + 'px',
		});
		
		$('#header').addClass('open');
	});
		     
	$('.gnb').mouseleave(function () {
		$('.hd_bg').css('height', '0');
	     $('#header').removeClass('open');
	});
	 
	$('.gnb > li').mouseenter(function () {
	    $(this).addClass('active');
	    $(this).siblings().removeClass('active')
	});
	
	$('.gnb > li').mouseleave(function () {
	    $(this).removeClass('active');
	});
 
});

document.addEventListener('DOMContentLoaded', function () {
    var trigger = document.getElementById('popover-trigger');
    var popover = document.getElementById('popover-content');

    trigger.addEventListener('click', function () {
        if (popover.style.display === 'block') {
            popover.style.display = 'none';
        } else {
            popover.style.display = 'block';
        }
    });

    // 이미지 외의 영역을 클릭하면 팝오버가 닫히도록 설정
    document.addEventListener('click', function (event) {
        if (!trigger.contains(event.target) && !popover.contains(event.target)) {
            popover.style.display = 'none';
        }
    });
});

</script>
<style type="text/css">

#needitFont{color: #ff533f;}
a {text-decoration: none; color: #333;}
li {list-style: none; }
nav {list-style: none; padding: 0; display: flex;}
nav li {width: 150px; margin-right: 20px;}
.wrap {width: 1200px; margin: auto;} 

.container{max-width: 1200px;margin: auto; font-size: 20px; font-weight: bold;}
#header {background: #fff;margin: 0; position: relative; text-align: center;}
#header .container{justify-content: center;align-items: center; }
#header .gnb{text-align: center;}
#header .nav ul.gnb{margin-bottom:0px;padding-left:0px;display: flex;}
#header .nav ul.gnb li{margin-bottom:0px;color:#000;text-align: center;position: relative;}
#header .nav ul.gnb li a {box-sizing: border-box;display:block;transition:.8s ease;text-transform:uppercase;}
#header .nav ul.gnb li ul.sub{position:absolute;padding-left:0px;opacity:0;visibility: hidden;padding-top:10px;z-index: 3;width: 100%}
#header .nav ul.gnb li ul.sub li {position: relative;}
#header .nav ul.gnb li ul.sub li a{padding:10px;}
#header .nav ul.gnb:hover li ul.sub{visibility:visible;opacity:1;transform:translateY(0px);} 
#header .nav ul.gnb li:hover{display:inline-block;margin-bottom:0px;}
#header.open .hd_bg{position: absolute;width: 100%;background: #fff;z-index: 1;transition: all .3s;border-top: 1px solid #dcdcdc; opacity: 95%;}
#header .nav ul.gnb li ul.sub li a{text-align: center}
#header .nav .active  {position: relative}
#header .nav .active:hover:after{content: '';display: block;width: 100%;height: 2px;background: #000;position: absolute;left: 0;bottom: 0}



.image-container {
    position: relative;
    display: inline-block;
}

#popover-content {
    display: none;
    position: fixed;
    background-color: #ff533f;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    padding: 10px;
    z-index: 2;
    border-radius: 10px;
}
}

#popover-content ul {
	text-align: center;
    list-style: none;
    padding: 0;
    margin: 0;
    
}

#popover-content ul li {
    margin-bottom: 5px;
    
}

#popover-content a {
    text-decoration: none;
    color: #333;
    display: block;
    padding: 5px;
    border-radius: 10px;
    
}

#popover-content a:hover {
    background-color: #f0f0f0;
}










</style>

</head>
<body>

<div class="wrap">

		<div class="float-end" style="margin-top: 30px; width: 90px; height: 40px; text-align: right; ">
				<%-- 비로그인 --%>
			<c:if test="${empty isLogin }">
				<a href="/user/login"><img src="/resources/img/mypageicon.png" style="height: 40px; width: 40px; left:  40px;"></a>
			</c:if>
			<c:if test="${not empty isLogin and isLogin }">
				<a href="/main"><img src="/resources/img/jong.png" style="height: 40px; width: 40px;"></a>
				    <div class="image-container">
				        <img src="/resources/img/mypageicon.png" id="popover-trigger" style="height: 40px; width: 40px;">
				        <div class="popover-content" id="popover-content" style="right:350; top: 80;">
				            <!-- 팝오버 내용 -->
				            <ul style="padding-left: 0px; text-align: center;">
				                <li><img src="/resources/img/profile.png" width="30px" height="30px" style="text-align: left;"><label style="color: white;">${nick } </label></li>
				                <li><a href="#">마이페이지</a></li>
				                <li><a href="#">내 채팅</a></li>
				                <li><a href="#">빌린거/빌려준거</a></li>
				                <li><a href="#">장바구니</a></li>
				                <li><a href="#">고객센터</a></li>
				                <li><a href="/user/logout">로그아웃</a>
				            </ul>
				        </div>
				    </div>
			</c:if>
		</div>
	<div class=" text-center mx-auto p-4  " style="width: 1200px;" >
		<div class="mx-auto p-2">
		<a href="/main"><img src="/resources/img/needit..png" width="500" height="100"></a>
		</div>
	</div>
	
<header id="header" >
	
	<div class="container ">
	
		<nav class="nav justify-content-center">
            <ul class="gnb">
                <li><a id="needitFont" style="font-size: 30px;">대여해요</a>
                    <ul class="sub">
                        <li><a href="/menu/rent/list?menu=m1c1">물품</a></li>
                        <li><a href="/menu/rent/list?menu=m1c2">인력</a></li>
                        <li><a href="/menu/rent/list?menu=m1c3">공간</a></li>
                    </ul>
                </li>
                
                <li><a id="needitFont" style="font-size: 30px;">나눔해요</a>
                     <ul class="sub">
                        <li><a href="/menu/share/list?menu=m2c1">물품</a></li>
                        <li><a href="/menu/share/list?menu=m2c2">인력</a></li>
                        <li><a href="/menu/share/list?menu=m2c3">공간</a></li>
                    </ul>
                </li>
                
                <li><a id="needitFont" style="font-size: 30px;">해주세요</a>
                     <ul class="sub">
                    	<li><a href="/menu/please/list?menu=m3c1">물품</a>
						<li><a href="/menu/please/list?menu=m3c2">인력</a>
						<li><a href="/menu/please/list?menu=m3c3">공간</a>
                    </ul>
                </li>
                
                <li><a id="needitFont" style="font-size: 30px;">커뮤니티</a>
                     <ul class="sub">
               			<li><a href="#">공지사항</a>
						<li><a href="#">우리동네 소식</a>
						<li><a href="#">자유 게시판</a>
						<li><a href="#">팁 게시판</a>
                    </ul>
                </li>
                
                <li><a id="needitFont" style="font-size: 30px;">동네업체</a>
                	<ul class="sub">
                		<li><a href="/menu/business/list?menu=m5c1">물품</a></li>
						<li><a href="/menu/business/list?menu=m5c2">인력</a></li>
						<li><a href="/menu/business/list?menu=m5c3">공간</a></li>
					</ul>
                </li>
                
                <li><a id="needitFont" style="font-size: 30px;">주변지도</a></li>
            </ul>
		</nav>
	</div>
	<hr>
	
<div class="hd_bg"></div>
	
</header>
    