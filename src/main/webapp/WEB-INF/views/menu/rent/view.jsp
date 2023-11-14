<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5f231240cb73d46a6f0aa5b0d4c5e1&libraries=services"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">

#map-container {
    overflow: hidden;
    height: 0;
    transition: height 0.3s ease;
}

#map-container.expanded {
    height: 350px; /* Set the height as per your requirement */
}

#map {
	margin: 0 auto;
}

.file {
    color: blue;
}
</style>

<script type="text/javascript">

// 댓글목록 불러오기
function loadComments() {
	$.ajax({
			type: "GET"
         	, url: "/menu/rent/comment/list"
         	, data: { 
         		boardNo : ${board.boardNo }
         	}
         	, success: function(res) {
         		console.log("댓글창 반응 성공")
         		console.log(res)

                // 댓글 목록을 가져와서 HTML로 렌더링
                var commentListHtml = "";
         		
         		const id = '${id}'
                for (var i = 0; i < res.commentList.length; i++) {
                	
                    commentListHtml += '<tr data-cmtNo="' + res.commentList[i].cmtNo + '">';
                    commentListHtml += '<td>' + res.commentList[i].cmtNo + '</td>';
                    commentListHtml += '<td>' + res.commentList[i].writerNick + '</td>';
                    commentListHtml += '<td class="text-start">' + res.commentList[i].content + '</td>';
                    commentListHtml += '<td>' + formatDate(new Date(res.commentList[i].writeDate)) + '</td>';
                    commentListHtml += '<td>';
                    if( id && id == res.commentList[i].writerId ) {
	                    commentListHtml += '	<button class="btn btn-danger btn-xs" onclick="deleteComment(' + res.commentList[i].cmtNo + ');">삭제</button>';
                    }
                    commentListHtml += '</td>';
                    commentListHtml += '</tr>';
                    
                }
				
                // 렌더링된 HTML을 해당 <tbody>에 추가
                $("#commentList tbody").html(commentListHtml);
         		
	         }
	         , error: function() {
    	        console.log("댓글창 반응 실패")
	         }
	
	})	
	
	function formatDate(date) {
	    var curDate = new Date();
	    var writeDate = new Date(date);
	
	    var isSameDay = curDate.toDateString() === writeDate.toDateString();
	
	    var year = writeDate.getFullYear().toString().slice(-2); // 년도의 뒤 2자리를 가져옴
	    var month = ('0' + (writeDate.getMonth() + 1)).slice(-2);
	    var day = ('0' + writeDate.getDate()).slice(-2);
	    var hours = ('0' + writeDate.getHours()).slice(-2);
	    var minutes = ('0' + writeDate.getMinutes()).slice(-2);
	    var seconds = ('0' + date.getSeconds()).slice(-2);
	
	    if (isSameDay) {
	        return hours + ':' + minutes + ':' + seconds;
	        
	    } else {
	        return year + '.' + month + '.' + day + ' ' + hours + ':' + minutes;
	    }
	}

}// loadComments() End.

function deleteComment( cmtNo ) {
	console.log("댓글 삭제 버튼 동작! : ", cmtNo )
	
		$.ajax({
			type: "GET"
	     	, url: "/menu/rent/comment/delete"
	     	, data: { 
	     		boardNo : ${board.boardNo },
	     		cmtNo : cmtNo
	     	}
	     	, success: function() {
	     		console.log("댓글삭제 성공")
	     		
	     		//댓글창 재 로드
	     		loadComments()
	         }
	         , error: function() {
		        console.log("댓글삭제 실패")
	         }
		})
	
}// deleteComment() End.

$(()=>{
	
	//댓글 리스트 조회
	loadComments()
	
	//댓글 입력 요청
	$("#btnCommInsert").click(function(){
		console.log("댓글 입력 버튼 동작!")
		
		$.ajax({
			type: "POST"
         	, url: "/menu/rent/comment"
         	, data: { 
         		boardNo : ${board.boardNo },
         		writerId : "${id }",
         		writerNick : "${nick }",
         		menu : "${param.menu }",
         		content : $("#commentContent").val()
         	}
         	, success: function( res ) {
         		console.log("AJAX 성공")
         		
               	// 댓글 입력 성공 시, 댓글 창 비우고 포커스를 주기
               	$("#commentContent").val(""); // 댓글 창 비우기
               	$("#commentContent").focus(); // 댓글 창에 포커스 주기	         		
         		
	         	loadComments() // 페이지 로딩 시 댓글 목록 불러오기
	         }
	         , error: function() {
    	        console.log("AJAX 실패")
	         }
	
		})
		
	})
	
	//추천 버튼 변경
	if(${isLike}) {
		console.log('추천 이미 함')
		$("#btnLike")
			.addClass("btn-warning")
			.html('추천 취소');
	} else {
		console.log('추천 아직 안함')
		$("#btnLike")
			.addClass("btn-primary")
			.html('추천');
	}// 추천 버튼 End.
	
	//추천, 취소 요청Ajax
	$("#btnLike").click(()=>{
		$.ajax({
			type: "GET"
			, url: "/menu/rent/like"
			, data: {  
				boardNo : ${board.boardNo }
			}
			, dataType: "JSON"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnLike")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnLike")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#like").html(data.cnt);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	}); //$("#btnLike").click() End.
	
}); //jQuery Function End.
</script>

<script type="text/javascript">

//Kakao Map API
$(()=>{
	
	// 지도 객체 설정
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	// 지도 객체 생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var location = '${board.location}';
	console.log("게시글 위치", location);
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch( location, function(result, status) {
	
	 // 정상적으로 검색이 완료됐으면 
	  if (status === kakao.maps.services.Status.OK) {
	
	// 주소를 담을 변수
	     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	//이건 마커 따로 만들어둬서 돼서 핵심 XXXX
	     // 결과값으로 받은 위치를 마커로 표시합니다
	     var marker = new kakao.maps.Marker({
	         map: map,
	         position: coords
	     });
	
	//이건 인포윈도우로 따로 만들어둬서 돼서 핵심 XXXX
	     // 인포윈도우로 장소에 대한 설명을 표시합니다
	     var infowindow = new kakao.maps.InfoWindow({
	         content: '<div style="width:150px;text-align:center;padding:6px 0;">대여가능 위치</div>'
	     });
	     infowindow.open(map, marker);
	
	// map객체의 setCenter 메소드가 좌표로 이동 시켜주는 메소드 *** 
	     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	     map.setCenter(coords);
	 } 
	});    	
}); //Kakao Map API End.
</script>

<div class="container">

<table class="table table-bordered">

<colgroup>
	<col style="width: 15%;">
	<col style="width: 35%;">
	<col style="width: 15%;">
	<col style="width: 35%;">
</colgroup>

<tr>
	<td class="table-info">글번호</td><td>${board.boardNo }</td>
	<td class="table-info">추천수</td><td id="like">${cntLike }</td>
</tr>
<tr>
	<td class="table-info">아이디</td><td>${board.writerId }</td>
	<td class="table-info">닉네임</td><td>${board.writerNick }</td>
</tr>
<tr>
	<td class="table-info">조회수</td><td>${board.hit }</td>
	<td class="table-info">작성일</td>
	<td>
	<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
	<fmt:formatDate var="writeDate" value="${board.writeDate }" pattern="yyyyMMdd" />
	<c:choose>
		<c:when test="${writeDate lt curDate }">
			<fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${board.writeDate }" pattern="HH:mm" />
		</c:otherwise>
	</c:choose>		
	</td>
</tr>
<tr>
	<td class="table-info">제목</td><td colspan="3">${board.title }</td>
</tr>
<tr>
	<td class="table-info">첨부파일</td>
	<td colspan="3">
		<c:forEach var="file" items="${fileTb }">
		<a class="file bi bi-paperclip" href="./download?fileNo=${file.fileNo }">${file.originName }</a><br>
		</c:forEach>
	</td>
</tr>
<tr>
	<td class="table-info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">
		<div class="content">
		${board.content }
		</div>
	</td>
</tr>
</table>

<%-- 게시글 위치 --%>
<div id="map" style="width:350px; height:350px;"></div><br>

<%-- 추천버튼 --%>
<div style="text-align: center;">
		<button class="btn" id="btnLike"></button>
</div><br>

<%-- 목록,수정,삭제 --%>
<div class="text-center">
	<a class="btn btn-success" href="/menu/rent/list?menu=m1c1">목록</a>
	
	<c:if test="${id eq board.writerId }">
		<a href="./update?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
		<a href="./delete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>
	</c:if>
</div><br>

</div> <!-- .container -->

<div>
	
	<%-- 로그인 상태 --%>
	<c:if test="${isLogin }">
		<div class="row text-center justify-content-around align-items-center">
			<div class="col col-2">
				<input type="text" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
			</div>
			<div class="col col-9">
				<textarea class="form-control" id="commentContent" style="resize: none; height: 15px;"></textarea>
			</div>
			<button id="btnCommInsert" class="btn btn-primary col-1">작성</button>
		</div>	<!-- 댓글 조회, 작성 End. -->
	</c:if><br>

	<%-- 비로그인 상태 --%>
	<c:if test="${not isLogin }">
		<div class="row text-center justify-content-around align-items-center">
			<div class="col col-2">
				<input type="text" class="form-control" id="commentWriter" value="unknown" readonly="readonly"/>
			</div>
			<div class="col col-9">
				<textarea class="form-control" id="commentContent" style="resize: none; height: 15px;" readonly="readonly" placeholder="로그인 후 댓글 작성 가능"></textarea>
			</div>
				<a class="btn btn-danger col-1" href="/user/login?boardNo=${board.boardNo }&menu=${board.menu}&type=rent">로그인</a>
		</div>
	</c:if><br>

	<%-- 댓글 목록 --%>
	<div id="commentList">

		<!-- 댓글 리스트 -->
		<table class="table table-condensed text-center">
		<colgroup>
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 50%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>
		<tr>
			<th>번호</th>
			<th>닉네임</th>
			<th>댓글</th>
			<th>작성일</th>
			<th></th>
		</tr>
		</thead>
		<tbody id="commentBody">
		</table>
	</div><!-- 댓글 목록 End. -->
	
</div><!-- 댓글 End. -->

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

