<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5f231240cb73d46a6f0aa5b0d4c5e1&libraries=services"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<%-- Header --%>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<%-- Style --%>
<style type="text/css">
#map-container {
    overflow: hidden;
    height: 0;
    transition: height 0.3s ease;
}

#map-container.expanded {
    height: 350px;
}

#map {
	margin: 0 auto;
}

#del {
	border: none;
	border-radius: 10px;
}
#cmtReportBtn {
    border: none;
    font-size: 10px;
    width: 32px;
    height: 20px;
    background-color: red;
    border-radius: 5px;
    color: white;
}
.file {
    color: blue;
}
.cmtWriter {
	display: inline-block;
    text-align: center;
    width: 42px;
    border-radius: 10px;
    color: white; 
    background-color: rgb(255,83,63);
    font-size: 11px;
    margin-left: 4px;
}
h5 {
	font-size: 15px;

}
h6 {
    font-weight: bolder;
}
.bi-suit-heart-fill::before {
    color: red;
    content: "\f59d";
}
.bi-suit-heart::before {
    color: red;
    content: "\f59e";
}
#likeNo {
	display:inline;
	color: blue;
}

.table td {
	vertical-align: middle;
}
.comment-nickname {
    cursor: pointer; /* 커서 모양 변경 */
}
.comment-nickname:hover {
    color: orange; /* 마우스 오버 시 텍스트 색상 변경 */
}
</style>

<%-- 추천, 댓글, 대여상태 --%>
<script type="text/javascript">
//댓글 신고
function cmtReport(cmtNo) {
    var reportOptions = document.getElementById('reportSelect_' + cmtNo);
    if (reportOptions.style.display === 'none') {
        reportOptions.style.display = 'block';
    } else {
        reportOptions.style.display = 'none';
    }
}

//클릭 이벤트 바인딩을 loadComments 함수 밖으로 이동
$(document).on("click", ".comment-nickname", function () {
    // 현재 클릭된 댓글의 번호를 가져옴
    var cmtNo = $(this).closest('.media').find('.cmt-no').text();

    console.log("작동");
    // 새 창에서 댓글 프로필 페이지로 이동
    window.open('/profile/yourProfileCmt?cmtNo=' + cmtNo, '_blank');
});

// 댓글목록 불러오기
function loadComments() {
	$.ajax({
	    type: "GET",
	    url: "/share/comment/list",
	    data: {
	        boardNo: ${view.boardNo}
	    },
	    success: function (res) {
	        console.log("댓글창 반응 성공 : ", res);
	        
	        // 댓글 목록을 가져와서 HTML로 렌더링
	        var commentListHtml = "";
	
	        const id = '${id}' //세션 아이디
	        const nick = '${nick}' //세션 닉네임
	        
	        if( res.commentList != null && res.commentList.length > 0 ){
	        	console.log("댓글 있음")
		        for (var i = 0; i < res.commentList.length; i++) {
	
		            var boardMaster = "${view.writerNick }" //게시글 작성자
		            var commentWriter = res.commentList[i].WRITER_NICK//댓글 작성자
		            
		            console.log('댓글싸가지업슨ㄴ새끼', res)
		            console.log('댓글싸가지업슨ㄴ새dsdsdsadw끼', nick)
		            console.log('댓글싸가지업슨ㄴ새끼', res)
		            console.log('댓글싸가지업슨ㄴ새qwdqswdaszcascsacs끼', commentWriter)
		            console.log('댓글싸가지업슨썸넨일일일끼', res.commentList[i].THUNBNAIL_NAME)
		            
		            commentListHtml += '<hr>'; 
		            commentListHtml += '<div class="media mb-4">';
                    commentListHtml += '  <span class="cmt-no" style="display: none;">' + res.commentList[i].CMT_NO + '</span>'; // 추가 부분
		            //프로필사진 유무 처리
		            if( res.commentList[i].THUMBNAIL_NAME != null || res.commentList[i].THUMBNAIL_NAME > 0 ){
		            commentListHtml += '  <img style="border: 0.5px solid #ccc; width: 70px; height: 70px;" class="d-flex mr-3 rounded-circle" src="/upload/' + encodeURIComponent(res.commentList[i].THUMBNAIL_NAME) + '">';
		            } else {
			            commentListHtml += '  <img style="border: 0.5px solid #ccc; width: 70px; height: 70px;" class="d-flex mr-3 rounded-circle" src="/resources/img/defaultProfile.png">';
		            }
		            commentListHtml += '  <div class="media-body" style="margin-bottom: -30px;">';
		            //댓글 작성자 구분 처리                                                                                    
		            if (commentWriter === boardMaster && commentWriter === nick) { 
		                commentListHtml += '    <h6 class="comment-nickname">' + res.commentList[i].WRITER_NICK + '<div class="cmtWriter" style="color: white; background-color: #52C728;">내댓글</div>' + '</h6>';
		            } else if (commentWriter === nick) {
		                commentListHtml += '    <h6 class="comment-nickname">' + res.commentList[i].WRITER_NICK + '<div class="cmtWriter" style="color: white; background-color: #52C728;">내댓글</div>' + '</h6>';
		            } else if (commentWriter === boardMaster) {
		                commentListHtml += '    <h6 class="comment-nickname">' + res.commentList[i].WRITER_NICK + '<div class="cmtWriter">작성자</div>' + '</h6>';
		            } else {
		                commentListHtml += '    <h6 class="comment-nickname">' + res.commentList[i].WRITER_NICK + '</h6>';
		            }
		            //댓글내용
		            commentListHtml += '    <h5 class="text-start">' + res.commentList[i].CONTENT + '</h5>';
		            //댓글작성 일자
		            commentListHtml += '    <p style="font-size: 13px; display: inline-block;">' + formatDate(new Date(res.commentList[i].writeDate)) + '</p>';
		            //본인 댓글 삭제가능 처리
		            if (id && id == res.commentList[i].WRITER_ID) {
		                commentListHtml += '    <button id="del" onclick="deleteComment(' + res.commentList[i].CMT_NO + ');">';
		                commentListHtml += '	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">';
		                commentListHtml += '	<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>';
		                commentListHtml += '	</svg>'
		                commentListHtml += '    </button>';
		            }
		            //댓글신고 버튼
		            if (id != null) {
		            commentListHtml += '	<button id="cmtReportBtn" onclick="cmtReport(' + res.commentList[i].CMT_NO + ');">'; 
		            commentListHtml += '신고하기';
		            commentListHtml += '	</button>';
		            commentListHtml += '<div id="reportSelect_' + res.commentList[i].CMT_NO + '" class="report-options" style="display:none;">';
		            commentListHtml += '  <input type="radio" name="reportType" value="광고">광고</input>';
		            commentListHtml += '  <input type="radio" name="reportType" value="욕설">욕설</input><br>';
		            commentListHtml += '  <input type="radio" name="reportType" value="비방">비방</input>';
		            commentListHtml += '  <input type="radio" name="reportType" value="음란">음란</input><br>';
		            commentListHtml += '  <input type="radio" name="reportType" value="불법">불법</input><br>';
		            commentListHtml += '  <button id="submitCmt" onclick="submitReport(' + res.commentList[i].CMT_NO + ');">제출</button>';
		            commentListHtml += '</div>';
		            }
		            commentListHtml += '</div>';
		            commentListHtml += '  </div>';
		            commentListHtml += '</div>';
		        }
		        // 렌더링된 HTML을 추가
		        $("#commentList").html(commentListHtml);
		        
	        } else {
	        	console.log("댓글 없음")
	            commentListHtml += '<hr>'; 
	            commentListHtml += '<div class="media mb-4">';
	            commentListHtml += '  <div class="media-body" style="margin-bottom: -30px;">';
	            commentListHtml += '    <p style="text-align: center; color: rgb(255,83,63); margin-bottom: 100px;">작성된 댓글이 없습니다.</p>';
	            commentListHtml += '  </div>';
	            commentListHtml += '</div>';
	        }
	        // 렌더링된 HTML을 추가
	        $("#commentList").html(commentListHtml);
	    },
	    error: function () {
	        console.log("댓글창 반응 실패");
	    }
	
	});	
	
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
	     	, url: "/share/comment/delete"
	     	, data: { 
	     		boardNo : ${view.boardNo },
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
         	, url: "/share/comment/insert"
         	, data: { 
         		boardNo : ${view.boardNo },
         		writerId : "${id }",
         		writerNick : "${nick }",
         		menu : "${param.menu }",
         		cate : "${param.cate }",
         		content : $("#commentContent").val()
         	}
         	, success: function( res ) {
         		console.log("댓글입력 AJAX성공")
         		
               	// 댓글 입력 성공 시, 댓글 창 비우고 포커스를 주기
               	$("#commentContent").val(""); // 댓글 창 비우기
               	$("#commentContent").focus(); // 댓글 창에 포커스 주기	         		
         		
	         	loadComments() // 페이지 로딩 시 댓글 목록 불러오기
	         }
	         , error: function() {
    	        console.log("댓글입력 AJAX실패")
	         }
	
		})
		
		$.post( "/alert/sendnotification", { 
				id: "${view.writerId}"
		        , sender: "${id }"
		        , content: 4
		        , menu: ${param.menu}
				, boardNo: ${view.boardNo}
		}); // $.post 끝
		
	})
	
	//추천 버튼 변경
	if(${isLike}) {
		console.log('추천 이미 함')
		$("#btnLike")
			.addClass("bi bi-suit-heart-fill")
			.html('좋아요 취소');
	} else {
		console.log('추천 아직 안함')
		$("#btnLike")
			.addClass("bi bi-suit-heart")
			.html('좋아요');
	}// 추천 버튼 End.
	
	//추천, 취소 요청Ajax
	$("#btnLike").click(()=>{
		$.ajax({
			type: "GET"
			, url: "/share/like"
			, data: {  
				boardNo : ${view.boardNo }
			}
			, dataType: "JSON"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnLike")
					.removeClass("bi bi-suit-heart")
					.addClass("bi bi-suit-heart-fill")
					.html('좋아요 취소');
					sendNofiLike()
				
				} else { //추천 취소 성공
					$("#btnLike")
					.removeClass("bi bi-suit-heart-fill")
					.addClass("bi bi-suit-heart")
					.html('좋아요');
				
				}
				
				//추천수 적용
				$("#like")
				.html('<div id="likeNo">' + data.cnt + '</div>명이 이 게시글을 좋아합니다.');
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	}); //$("#btnLike").click() End.
	
	$("#selfRent").click(function () {
		alert("작성자 본인은 대여신청이 불가합니다.");
	});
	
}); //jQuery Function End.

function sendNofiLike() {
	$.post( "/alert/sendnotification", { 
		id: "${view.writerId}"
        , sender: "${id }"
        , content: 6
        , menu: "${param.menu}" 
		, boardNo: "${view.boardNo}"
	}); // $.post 끝
}
</script>

<%-- Kakao Map API --%>
<script type="text/javascript">
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
	
	var location = '${view.location}';
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
	         content: '<div style="width:150px;text-align:center;padding:6px 0;">대여가능 위치<br><div style="font-size: 10px;">${view.location}<div></div>'
	     });
	     infowindow.open(map, marker);
	
	// map객체의 setCenter 메소드가 좌표로 이동 시켜주는 메소드 *** 
	     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	     map.setCenter(coords);
	 } 
	});    	
}); //Kakao Map API End.
</script>

<%-- Body --%>
<div class="container">

<!-- view페이지에서 신고버튼 -->
<button type="button" style="width: 30px; height: 30px; float: right;" id="report" class="btn" data-bs-toggle="modal" data-bs-target="#reportModal">
<div style="width: 25px; height: 25px; margin: -13px -10px;">⚠</div>
</button>

<c:if test="${isLogin }">
	<a class="btn btn-primary" href="/message/list?boardNo=${param.boardNo }&menu=${view.menu}&cate=${view.cate}&receiverId=${view.writerId}">채팅하기</a>
</c:if>
<c:if test="${not isLogin }">
	<a class="btn btn-primary" href=""  data-bs-toggle="modal" data-bs-target="#exampleModal">채팅하기</a>
</c:if>

<table class="table table-bordered">

<colgroup>
	<col style="width: 15%;">
	<col style="width: 35%;">
	<col style="width: 15%;">
	<col style="width: 35%;">
</colgroup>

<tr>
	<td class="table-info">글번호</td><td>${view.boardNo }</td>
	<td class="table-info">
		<c:if test="${isLogin }">
		<div style="text-align: center;">
			<div class="btn" id="btnLike"></div>
		</div>
		</c:if>		
		<c:if test="${not isLogin }">
		<div style="text-align: center;">
			<a href=""  data-bs-toggle="modal" data-bs-target="#exampleModal"><div class="btn" id="btnLike"></div></a>
		</div>
		</c:if>		
	</td><td id="like"><div id="likeNo">${cntLike }</div>명이 이 게시글을 좋아합니다.</td>
</tr>
<tr>
	<td class="table-info">닉네임</td><td><a href="/profile/yourProfile?boardNo=${view.boardNo }">${view.writerNick }</a></td>
	<td class="table-info">가격</td><td><fmt:formatNumber value="${view.price }" pattern="#,###" />0원</td>
</tr>

<tr>
	<td class="table-info">조회수</td><td>${view.hit }</td>
	<td class="table-info">작성일</td>
	<td>
	<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
	<fmt:formatDate var="writeDate" value="${view.writeDate }" pattern="yyyyMMdd" />
	<c:choose>
		<c:when test="${writeDate lt curDate }">
			<fmt:formatDate value="${view.writeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${view.writeDate }" pattern="HH:mm" />
		</c:otherwise>
	</c:choose>		
	</td>
</tr>
<tr>
	<td class="table-info">제목</td><td>${view.title }</td>
	<td class="table-info">대여하기</td>
	<td>
		<!-- Button trigger modal -대여 -->
		<c:if test="${isLogin and (id ne view.writerId) }">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#rentModal" >대여하고싶어요</button>
		</c:if>
		<c:if test="${not isLogin }">
			<a class="btn btn-danger" href=""  data-bs-toggle="modal" data-bs-target="#exampleModal">대여하고싶어요</a>
		</c:if>
		<c:if test="${id eq view.writerId }">
			<button class="btn btn-primary" id="selfRent" >대여하고싶어요</button>
		</c:if>
		<%-- Modal.대여 --%>
		<c:import url="./rent.jsp"/>
	</td>
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
		${view.content }
		</div>
	</td>
</tr>
</table>

<%-- 게시글 위치 --%>
<div id="map" style="width:350px; height:350px;"></div><br>

<%-- 추천버튼 --%>
<%-- <c:if test="${isLogin }"> --%>
<!-- <div style="text-align: center;"> -->
<!-- 	<div class="btn" id="btnLike"></div> -->
<!-- </div><br> -->
<%-- </c:if> --%

<%-- 목록,수정,삭제 --%>
<div class="text-center">
	<a class="btn btn-success" href="/rent/list?menu=1&cate=1">목록</a>
	
	<c:if test="${id eq view.writerId }">
		<a href="/share/update?boardNo=${view.boardNo }" class="btn btn-primary">수정</a>
		<a href="/share/delete?boardNo=${view.boardNo }" class="btn btn-danger">삭제</a>
	</c:if>
</div><br>

</div> <!-- .container -->

<%-- 댓글 영역 --%>
<div class="comment_container">
	
	<%-- 로그인 상태 --%>
	<c:if test="${isLogin }">
		<%-- 댓글작성 --%>
		<div class="row text-center justify-content-around align-items-center">
			<div class="col col-2">
				<input style="background-color: white;" type="text" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
			</div>
			<div class="col col-9">
				<textarea class="form-control" id="commentContent" style="resize: none; height: 15px;"></textarea>
			</div>
			<button id="btnCommInsert" class="btn btn-primary col-1">작성</button>
		</div>
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
<%-- 				<a class="btn btn-danger col-1" href="/user/login?boardNo=${board.boardNo }&menu=${board.menu}&cate=${board.cate }&type=rent">로그인</a> --%>
				<a class="btn btn-danger col-1" href=""  data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</a>
		</div>
	</c:if><br>

	<%-- 댓글 목록 --%>
	<div id="commentList"></div>
	
</div><!-- .comment_container End. -->
	
<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
