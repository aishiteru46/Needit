<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.alert-open:hover {
	font-weight: bold;
	color: green;
}

.alert-list {
    position: fixed; 
    top: 0;
    left: -362px; 
    width: 362px; 
    height: 100%;
    border-radius: 0px;
    background-color: #F5E5B4; 
    color: #fff; 
    transition: left 0.4s; 
    z-index: -1;
 	visibility: hidden;
}

/* new 알람 */
#new-icon {
	color: white;
	text-align: center;
	font-size: 10px;
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 3px;
	width: 32px;
	height: 20px;
	margin-left: 38px;
	margin-top: 5px;
	position: inherit;
	display: inline-block;
	z-index: 2;
	display: none;
	vertical-align: middle;
}

#new-icon-text {
	vertical-align: middle;
	margin-top: 1px;
}


/* 빨간 동그라미 알람 */
/* 
#new-icon {
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 20px;
	width: 15px;
	height: 15px;
	margin-left: 23px;
	margin-top: 5px;
	position: fixed;
	display: inline-block;
	z-index: 2;
}
*/
#alertWrap {
	width: 40px;
	height: 40px;
	display: inline-block;
	float: left;
 	position: absolute; 
}

#new-alert {
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 20px;
	width: 20px;
	height: 20px;
  	margin-top: -45px;
  	margin-left: 333px;  
	position: fixed;
	display: inline-block;
	z-index: 2;
/* 	vertical-align: middle; */
  	display: none;  
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

$(function() {
	hasNew() //페이지 로드 시 'hashNew' 함수를 호출하여 새로운 알림을 확인
	
	var urlEndPoint = "/alert/get?id=" + "${id}" //Sse세션 생성 시 접속한 세션의 id를 보내준다
	var eventSource = new EventSource(urlEndPoint) //SSE를 위한 'EventSource'를 생성
	
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
			
			if( res.hasNew == 0 ) { //hasNew 값이 0이면 알람을 숨긴다
				$("#new-alert").hide()
				$("#new-icon").hide()
			} else { // 0이 아니면 알림을 보여준다
				$("#new-alert").text(res.hasNew).show()
				$("#new-icon").show()
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
        , url: "/alert/list"
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

</script>
</head>
<body>

<div id="alertWrap">
<div id="new-icon"><div id="new-icon-text">NEW</div></div>
<img alt="menu" class="menu-icon" src="/resources/img/menu_white.png" width="40" height="40">
<!--     <span class="visually-hidden">New alerts</span> -->
  
</div><!-- #alertWrap  -->

</body>
</html>