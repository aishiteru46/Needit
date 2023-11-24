<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script type="text/javascript">
// URL에서 소셜 ID 추출
const urlParams = new URLSearchParams(window.location.search);
console.log(urlParams.get('id'));
const socialId = urlParams.get('socialId');

// 소셜 ID를 인풋 테그에 설정
// document.getElementById('socialId').value = socialId;

//네이버
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "If3wwgFKrS1NdGdbpSB4", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8088/user/social", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			var socialId = naverLogin.user.id;
			console.log(naverLogin.user.id); 
    		
			document.getElementById('socialId').value = socialId;
			
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}

















</script>
<body>
<form id=socialForm action="/user/social" method="post">

<input type="text" id="socialId" >

</form>

<script type="text/javascript">
document.getElementById('socialForm').submit();
</script>
</body>
</html>