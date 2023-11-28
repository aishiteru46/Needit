<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Needit</title>
<link rel="icon" href="resources/img/favicon.png" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>



<script type="text/javascript">
var result = 0;
$(function() {
	
	 var sessionId = "${id}";
	 
	 if (sessionId) {

	   hasNew() //페이지 로드 시 'hashNew' 함수를 호출하여 새로운 알림을 확인
	   loadAlert()    
	   var urlEndPoint = "/alert/get?id=" + "${id}" //Sse세션 생성 시 접속한 세션의 id를 보내준다
	   var eventSource = new EventSource(urlEndPoint) //SSE를 위한 'EventSource'를 생성
	   console.log(urlEndPoint)
	   console.log('왜안돼?')
	   
	   eventSource.onmessage = function (event) { // sendNotification 발생시 생기는 메소드
	      console.log(event)
	       var data = JSON.parse(event.data) // sendNotification에서 보내준 data { hasNew : hasNew, alert : alert }
	       console.log(data)
	       
	       var hasNew = data.hasNew
	       var alert = data.alert
	      
	       console.log("hasNew :" + hasNew)
	       console.log("alert :" + alert)
			
	       $("#new-icon").show() // new 알림표시 표시
	       $("#new-alert").html(hasNew).show() // 새로온 알림 갯수 표시
	      
	      loadAlert() //알림을 로드하는 함수를 호출
	   }
	 }
	})// 제이쿼리 펑션 끝


	function hasNew() { // 새로운 알림 확인 함수
	   $.ajax({
	      type: "get"
	      , url: "/alert/new"
	      , data: {
	      }
	      , dataType: "json" // int타입인 hasNew를 받아옴
	      , success: function( res ) {
	         console.log("AJAX 성공")
	         console.log("hasNew() 실행")
	         
	         if( res.hasNew == 0 ) { //hasNew 값이 0이면 알람을 숨긴다
	            $("#new-alert").hide()
	            $("#new-icon").hide()
	         } else { // 0이 아니면 알림을 보여준다
	            $("#new-alert").text(res.hasNew).show()
	            $("#new-icon").show()
	         }
	         result = res.hasNew;
	        if(result == 0){
	        	 $("#badge").hide()
	         }else if(result == 99){
	        	 $("#badge").text("+99").show()
	         }else{
	        	 $("#badge").text(result).show()
	         }
	      }
	      , error: function() {
	         console.log("AJAX 실패")
	      }
	   })
	} // hasNew 함수 끝

	function loadAlert() { // 알림을 로드하는 함수
	    $.ajax({
	        type: "get"
	        , url: "/alert/jong"
	        , data: {}
	        , dataType: "html"
	        , success: function( res ) { // Alert객체를 받아넣어준 list JSP를 HTML 타입으로 불러온다
	           console.log("AJAX 성공")
				
	           
	         $("#alert").html(res)
	        }
	        , error: function() {
	           console.log("AJAX 실패")
	        }
	     })
	} // loadAlert 함수 끝


$(() => {
	   $("#title").focus()
	   
	   $("#content").summernote({
	      height: 300,
	      toolbar: [
	          ['fontname', ['fontname']],
	          ['fontsize', ['fontsize']],
	          ['style', ['bold', 'italic', 'underline', 'clear']],
	          ['color', ['forecolor','color']],
	          ['table', ['table']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['height', ['height']],
	          ['insert',['picture','link']],
	          ['view', ['fullscreen', 'help']]
	        ],
	      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	   })
	})
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
	

	 $('#dropdownBtn1').click(function () {
          // Toggle the visibility of the dropdown content
          $('.dropdown-content1').toggle();
          $('.dropdown-content2').hide();
          event.stopPropagation();
      });
	  $(document).click(function(event) {
	        var dropdownContent = $('.dropdown-content1');
	        if (!dropdownContent.is(event.target) && dropdownContent.has(event.target).length === 0) {
	            dropdownContent.hide();
	          
	        }
	    });	
	 $('#dropdownBtn2').click(function () {
          // Toggle the visibility of the dropdown content
          $('.dropdown-content2').toggle();
          $('.dropdown-content1').hide();
          event.stopPropagation();
      });
	  $(document).click(function(event) {
	        var dropdownContent = $('.dropdown-content2');
	        if (!dropdownContent.is(event.target) && dropdownContent.has(event.target).length === 0) {
	            dropdownContent.hide();
	            $('.dropdown-content1').hide();
	        }
	    });	
	
	  $("#logout_button").click(function(){
		    //alert("버튼 작동");
		    $.ajax({
		        type: "POST",
		        url: "/user/logout",
		        success: function(data){
		            // 현재 페이지 URL을 가져옴
		            var currentPageUrl = window.location.href;
		            console.log(currentPageUrl.indexOf("/profile/view"))
// 		            만약 현재 페이지가 마이페이지라면 메인 페이지로 리다이렉트
		            if (currentPageUrl.indexOf("/profile/view") !== -1) {
		                window.location.href = "/main";
		            } else {
		                // 다른 페이지에서는 이전 동작(기존에는 이전 페이지로 돌아가는 동작)
		                document.location.reload();
		            }
		        } 
		    }); // ajax 
		});
	  
});



</script>
<style type="text/css">
#needitFont {
	color: #ff533f;
}

a {
	text-decoration: none;
	color: #343a40;
}

li {
	list-style: none;
}

nav {
	list-style: none;
	padding: 0;
	display: flex;
}

nav li {
	width: 150px;
	margin-right: 20px;
}

.wrap {
	width: 1200px;
	margin: auto;
}

.container {
	max-width: 1200px;
	margin: auto;
	font-size: 20px;
	font-weight: bold;
}

#header {
	background: #fff;
	margin: 0;
	position: relative;
	text-align: center;
}

#header .container {
	justify-content: center;
	align-items: center;
}

#header .gnb {
	text-align: center;
}

#header .nav ul.gnb {
	margin-bottom: 0px;
	padding-left: 0px;
	display: flex;
}

#header .nav ul.gnb li {
	margin-bottom: 0px;
	color: #000;
	text-align: center;
	position: relative;
}

#header .nav ul.gnb li a {
	box-sizing: border-box;
	display: block;
	transition: .8s ease;
	text-transform: uppercase;
}

#header .nav ul.gnb li ul.sub {
	position: absolute;
	padding-left: 0px;
	opacity: 0;
	visibility: hidden;
	padding-top: 10px;
	z-index: 4;
	width: 100%
}

#header .nav ul.gnb li ul.sub li {
	position: relative;
}

#header .nav ul.gnb li ul.sub li a {
	padding: 10px;
	margin-top: 8px;
}

#header .nav ul.gnb:hover li ul.sub {
	visibility: visible;
	opacity: 1;
	transform: translateY(0px);
}

#header .nav ul.gnb li:hover {
	display: inline-block;
	margin-bottom: 0px;
}

#header .nav ul.gnb li a:hover {
	background-color: #f1f1f1;
}

#header.open .hd_bg {
	position: absolute;
	width: 100%;
	background: #fff;
	z-index: 1;
	transition: all .3s;
	border-top: 1px solid #dcdcdc;
	opacity: 95%;
	z-index: 3;
}

#header .nav ul.gnb li ul.sub li a {
	text-align: center
}

#header .nav .active {
	position: relative
}

#header .nav .active:hover:after {
	content: '';
	display: block;
	width: 100%;
	height: 2px;
	background: #000;
	position: absolute;
	left: 0;
	bottom: 0;
	background-color: #ccc
}

/* Style The Dropdown Button */
.dropbtn1 {
	border: none;
	cursor: pointer;
}

.dropbtn2 {
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
	z-index: 5;
}

.dropdown-content1 {
	margin-top: 15px;
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	width: 240px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	text-align: left;
	right: -50px;
	border-radius: 20px;
	z-index: 5;
	height: 350px;
}

.dropdown-content1:after {
	content: "";
	position: absolute;
	top: -10px;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 10px solid #f1f1f1;
}

.dropdown-content1 .alertData {
	/*     color: black; */
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content1 .alertData:hover {
	background-color: #ccc;
	position: relative;
	border-radius: 20px;
}

.dropdown-content2 {
	margin-top: 15px;
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	text-align: center;
	right: -50px;
	border-radius: 20px;
	z-index: 5;
}

.dropdown-content2:after {
	content: "";
	position: absolute;
	top: -10px;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 10px solid #f1f1f1;
}

.dropdown-content2 a {
	/*     color: black; */
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content2 a:hover {
	background-color: #ccc;
	position: relative;
	border-radius: 20px;
}

.dropdown-title {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	border-bottom: solid #f1f1f1;
	background-color: #ff533f;
	border-radius: 20px 20px 0px 0px;
}

.dropdown-title:after {
	z-index: 1;
	content: "";
	position: absolute;
	top: -10px;
	right: 60px;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 10px solid #ff533f;
}

.p-2 {
	margin-top: 30px;
	margin-bottom: 20px;
	padding: 0.5rem !important;
}

.header {
	z-index: 300;
}

.p-4 {
	display: flex;
	flex-wrap: nowrap;
	justify-content: center;
	align-items: center;
}

#new-icon-text {
	display: none;
	
}

.scrollbar { 
  height: 285px;
  overflow-y: scroll; /*  */
}

/* 스크롤바의 폭 너비 */
.scrollbar::-webkit-scrollbar {
    width: 10px;  
}

.scrollbar::-webkit-scrollbar-thumb {
    background: #ff533f; /* 스크롤바 색상 */
    border-radius: 10px; /* 스크롤바 둥근 테두리 */
}

.scrollbar::-webkit-scrollbar-track {
    background: #f1f1f1;  /*스크롤바 뒷 배경 색상*/
     border-radius: 10px;
}
#badge{
	width: 30px;
	border-radius: 10px;
	color: white;
	font-size: 12px;
	position: absolute;
	top: -5px;
	right: -10px;
	background-color: red;
	text-align:  center;
	font-weight: bold;
	te
}
</style>

</head>
<body>
<div class="wrap">

<div class="header">
	<div class="float-end" style="margin-bottom: -70px; margin-top: 30px; width: 90px; height: 40px; text-align: right; ">
		<%-- 비로그인 --%>
		<c:if test="${not isLogin }">
		
			<div class="dropdown">
				<img id="dropdownBtn2" src="/resources/img/mypageicon.png" class="dropbtn" style="height: 40px; width: 40px;">
					<div class="dropdown-content2">
						<a href=""  data-bs-toggle="modal" data-bs-target="#exampleModal"> 로그인 </a>
					</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content" style="display:contents;">
						<c:import url="/user/login" />
					</div>
				</div>
			</div>
			
		</c:if>
			
		<c:if test="${not empty isLogin and isLogin }">
		
		 <c:choose>
            <c:when test="${id eq 'admin'}">
                <!-- 사용자가 'admin' 역할을 가지고 있는 경우의 코드 -->
              
				<div class="dropdown">
					<img id="dropdownBtn2" src="/resources/img/mypageicon.png" class="dropbtn" style="height: 40px; width: 40px;">
						<div class="dropdown-content2">
							<div class="dropdown-title">${nick }</div>
							<a href="/admin">관리자 페이지</a>
			                <a href="/message/list">내 채팅</a>
			                <a href=""id="logout_button">로그아웃</a>
						</div>
				</div>
				
            </c:when>
            <c:otherwise>

           <div class="dropdown">
				<img id="dropdownBtn1" src="/resources/img/jong.png" class="dropbtn" style="height: 40px; width: 40px;">
				<span id="badge"></span>
					<div class="dropdown-content1 ">
						<div class="dropdown-title" style="text-align: center;">알림</div>
						<div class="scrollbar">
							<a id="new-icon">
								<label id="new-icon-text">NEW</label>
							</a>
							<a id="alert"></a> 
						</div>
					</div>
			</div>
			
			<div class="dropdown">
				<img id="dropdownBtn2" src="/resources/img/mypageicon.png" class="dropbtn" style="height: 40px; width: 40px;">
					<div class="dropdown-content2">
						<div class="dropdown-title">${nick }</div>
						<a href="/profile">마이페이지</a>
		                <a href="/message/list">내 채팅</a>
		                <a href="#">빌린거/빌려준거</a>
		                <a href="#">장바구니</a>
		                <a href="#">고객센터</a>
		                <a href=""id="logout_button">로그아웃</a>
					</div>
			</div>
            </c:otherwise>
        </c:choose>
			</c:if>
		</div>
	<div class="mx-auto p-4" style="width: 1200px;" >
		<div class="mx-auto p-2">
		<a class="logo" href="/main"><img src="/resources/img/needit..png" width="350" height="70"></a>
		</div>
	</div>
	
<header id="header" >
	
	<div class="container ">
	
		<nav class="nav justify-content-center">
            <ul class="gnb">
                <li><label id="needitFont" style="font-size: 28px;">대여해요</label>
                    <ul class="sub">
                        <li><a href="/rent/list?menu=1&cate=1">물품</a></li>
                        <li><a href="/rent/list?menu=1&cate=2">인력</a></li>
                        <li><a href="/rent/list?menu=1&cate=3">공간</a></li>
                    </ul>
                </li>
                
                <li><label id="needitFont" style="font-size: 28px;">나눔해요</label>
                     <ul class="sub">
                        <li><a href="/share/list?menu=2&cate=1">물품</a></li>
                        <li><a href="/share/list?menu=2&cate=2">인력</a></li>
                        <li><a href="/share/list?menu=2&cate=3">공간</a></li>
                    </ul>
                </li>
                
                <li><label id="needitFont" style="font-size: 28px;">해주세요</label>
                     <ul class="sub">
                    	<li><a href="/please/list?menu=3&cate=1">물품</a>
						<li><a href="/please/list?menu=3&cate=2">인력</a>
						<li><a href="/please/list?menu=3&cate=3">공간</a>
                    </ul>
                </li>
                
                <li><label id="needitFont" style="font-size: 28px;">커뮤니티</label>
                     <ul class="sub">
               			<li><a href="/community/list?menu=4&cate=1">공지사항</a>
						<li><a href="/community/list?menu=4&cate=2">우리동네 소식</a>
						<li><a href="/community/list?menu=4&cate=3">자유 게시판</a>
						<li><a href="/community/list?menu=4&cate=4">팁 게시판</a>
                    </ul>
                </li>
                
                <li><label id="needitFont" style="font-size: 28px;">동네업체</label>
                	<ul class="sub">
                		<li><a href="/menu/business/list?menu=5&cate=1">물품</a></li>
						<li><a href="/menu/business/list?menu=5&cate=2">인력</a></li>
						<li><a href="/menu/business/list?menu=5&cate=3">공간</a></li>
					</ul>
                </li>
                
                <li><a id="needitFont" href="/map" style="font-size: 28px;">주변지도</a></li>
            </ul>
		</nav>
	</div>
	<hr>
	
<div class="hd_bg"></div>
</header>
</div>
