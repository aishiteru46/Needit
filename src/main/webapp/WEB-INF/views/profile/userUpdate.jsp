<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<c:import url="/WEB-INF/views/layout/header.jsp" />   

<script>


function sample5_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        var addr = data.address; // 최종 주소 변수

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("sample5_address").value = addr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
        });
    }
}).open();
}

// $(document).ready(function() {
// 	//ID 중복 확인
// 	//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
// 	$("#id").on("focusout focusin", function() {
		
// 		var id = $("#id").val();
		
// 		if(id == '' || id.length == 0) {
			
// 			$("#label1").css("color", "red").css("display", "block").text("공백은 ID로 사용할 수 없습니다.");
// 			return false;
// 		}
		
//     	//Ajax로 전송
//     	$.ajax({
//     		url : '/user/idCheck',
//     		data : {
//     			id : id
//     		},
//     		type : 'POST',
//     		dataType : 'json',
//     		success : function(result) {
//     			if (result != true) {
//     				$("#label1").css("display", "block")
//     				$("#label1").css("color", "green").text("사용 가능한 ID 입니다.");
//     			} else{
//     				$("#label1").css("display", "block")
//     				$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
//     			}
//     		}
//     	}); //End Ajax
// 	});
// })

$(document).ready(function() {
	//닉네임 중복확인
	$("#nick").on("focusout focusin", function() {
		
		var nick = $("#nick").val();
		
		if(nick == '' || nick.length == 0) {
			
			$("#label3").css("color", "red").css("display", "block").text("공백은 사용할 수 없습니다.");
			return false;
		}
		
    	//Ajax로 전송
    	$.ajax({
    		url : '/user/nickCheck',
    		data : {
    			nick : nick
    		},
    		type : 'POST',
    		dataType : 'json',
    		success : function(result) {
    			if (result != true) {
    				$("#label3").css("display", "block")
    				$("#label3").css("color", "green").text("사용 가능한 닉네임 입니다.");
    			} else{
    				$("#label3").css("display", "block")
    				$("#label3").css("color", "red").text("사용 불가능한 닉네임 입니다.");
    			}
    		}
    	}); //End Ajax
	});
})

$(document).ready(function() {
    // 비밀번호 일치 여부 확인
    $("#pw2").on("keyup", function() {
        var password1 = $("#pw1").val();
        var password2 = $(this).val();

        if (password1 === password2) {
            $("#label2").css("display", "block").css("color", "green").text("비밀번호가 일치합니다!");
        } else {
            $("#label2").css("display", "block").css("color", "red").text("비밀번호가 일치하지 않습니다.");
        }
    });
});
</script>    

<body>

<div class="container position-relativ ">
<div class="col-7 mx-auto my-5 ">
<form action="./infoupdate" method="post"  class="card shadow-lg position-absolute top-50 start-50 translate-middle form-signin" >
<img class="mb-3 mx-auto d-block" src="../resources/img/needit..png" width="300" height="70" >
<div class="clearfix"></div>

<div class="form-floating">
	<div class="row">
  		<div class="col">
  			<label class="fs-3 fw-bold">아이디</label>
   	 		<input type="text" class="form-control form-control-lg mb-3" name="id" id="id" value="${id }" readonly="readonly">
   	 		<span id="label1"></span>
  			<label class="fs-3 fw-bold">변경할 비밀번호</label>
    		<input type="password" class="form-control form-control-lg mb-3" id="pw1" name="pw" placeholder="비밀번호를 입력해주세요" required="required">
  			<label class="fs-3 fw-bold">비밀번호 확인</label>
    		<input type="password" class="form-control form-control-lg mb-3" id="pw2" placeholder="비밀번호를 입력해주세요" required="required">
    		<span id="label2"></span>
  			
    
  		</div>
  		<div class="col">
    		<label class="fs-3 fw-bold">성별</label>
    		<select name="gender"  class="form-select form-select-lg mb-3" >
			    <option value="E">기타</option>
	    		<option value="M">남자</option>
			   	<option value="F">여자</option>
			</select>
  			
  			<label class="fs-3 fw-bold">닉네임</label>
    		<input type="text" class="form-control form-control-lg mb-3" id="nick" name="nick" placeholder="닉네임을 입력해주세요" value="${nick }" required="required">
  			<span id="label3"></span>
  			
  		</div>
  		<div>
  			
   	 		
  			<label class="fs-3 fw-bold">주소  <input class="btn mb-2 " id="needit"type="button" onclick="sample5_execDaumPostcode()" value="우편번호 찾기"></label>
    		<input type="text" class="form-control form-control-lg mb-3" name="addr1" placeholder="주소를 입력해주세요" id="sample5_address"  value="${addr1 }" required="required">
    		<input type="text" class="form-control form-control-lg mb-3" name="addr2" placeholder="상세주소 입력"  value="${addr2 }" >
    		
  		</div>
	</div>
</div>


	<div>
	<button id="needit"class=" col-12 btn btn-danger btn-lg">회원정보 수정</button>
	
	</div>
</form>
</div>
<div class="col-6 mx-auto">

</div>
</div><%--컨테이너 --%>


</body>




<c:import url="/WEB-INF/views/layout/footer.jsp" />