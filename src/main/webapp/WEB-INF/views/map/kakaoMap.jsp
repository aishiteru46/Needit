<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <title>니딧 지도 테스트</title>
<style type="text/css">
   /* 전체 박스를 감싸는 DIV 오버레이 설정 */
   .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
   
   /* 전체 박스를 감싸는 DIV의 전체 설정 */
   .wrap * {padding: 0; margin: 0;}
   
   /* 전체 박스 DIV 오버레이 설정 */
   .wrap .info {width: 286px; height: 120px; border-radius: 5px; border-bottom: 2px solid #ccc; border-right: 1px solid #ccc; overflow: hidden; background: #fff;}
   
   /* 박스의 그림자 설정 */
   .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
   
   /* 주소 부분 오버레이 설정 */
   .info .address {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}

   /* 'X'표시 오버레이 설정 */
   .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
   
   /* 'X'표시에 마우스를 올렸을 때 설정 */
   .info .close:hover {cursor: pointer;}
   
   /* 이미지, desc 를 포함하는 DIV 오버레이 설정 */
   .info .body {position: relative;overflow: hidden;}
   
   /* 제목, 가격, 링크 부분을 감싸는 desc DIV 스타일 설정 */
   .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
   
   /* 제목 스타일 설정 */
   .desc .title {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
   
   /* 가격 스타일 설정 */
   .desc .price {font-size: 11px;color: #888;margin-top: -2px;}
   
   /* 썸네일 부분 오버레이 설정 */
   .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}

   /* 제목, 가격, 링크 부분 오버레이 설정 */
   .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
   
   /* 하이퍼링크 스타일 설정 */
   .info .link {color: #5085BB;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5f231240cb73d46a6f0aa5b0d4c5e1&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

var map;
var geocoder = new kakao.maps.services.Geocoder();

$(function () {
   var mapContainer = $('#map')[0]; // 지도를 표시할 div
   
   // 기본 맵 세팅 --------------------------------------------------------------------------
   if (navigator.geolocation) { // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
      
      navigator.geolocation.getCurrentPosition(function(position) {   // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         
         var lat = position.coords.latitude; // 위도
         var lon = position.coords.longitude; // 아래도 는 아니고 경도
         
         // 현재 내 위치로 설정
         var mapOption = { center: new kakao.maps.LatLng(lat, lon), level: 3 }; // 맵 기본 옵션 설정 [center : 중심 좌표 설정, level : 확대 레벨 ]
         
         initMap( $('#map')[0], mapOption )
      }); // function(position) 끝
      
   } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
      
      // 기본 주소 => 학원 좌표
      var mapOption = { center: new kakao.maps.LatLng(37.499181, 127.032789), level: 3 };
      alert('현재 위치가 아닙니다!!!')
      
      initMap( $('#map')[0], mapOption )
      
   }// if (navigator.geolocation) 끝
   
   // ajax로 DB에서 객체(Json) 불러오기
   $(document).ready(function(){
      $.ajax({
         type: "get" // 보내는 데이터가 없기 때문에 get으로 불러오기만 해도됨
         , url: "/map/list" // 맵에 띄울 정보 받아올 mapping
         , data: {}  // 한번에 다 받아 오는거라 데이터 필요없음
         , dataType: "json"
         , async: "false" // 비동기식 호출 => 응답이 모두 완료 된 후 로직 실행
         , success: function( res ){
            console.log("AJAX 성공")
            console.log("받아온 객체 : ", res)
            
            //제이쿼리 배열 관리 메소드 - each()
            // each() 메서드는 매개 변수로 받은 것을 사용해 for in 반복문과 같이 배열이나 객체의 요소를 검사할 수 있는 메서드
             // $.each(object, function(index, item){});
            $.each(res.location, (idx, val) => {
               var number = Number(val.price); // 가격 저장 변수
               var formattedNumber = number.toLocaleString(); // 가격 format 변수
   
               geocoder.addressSearch( val.address, ( result, status ) => { // 주소-좌표 변환 객체
                  
                  // 정상적으로 검색이 완료됐으면
                  if (status === kakao.maps.services.Status.OK) {
                     var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x) // 마커 생성 위치
                        
                     var marker = new kakao.maps.Marker({ // KAKAO 마커 생성 객체
                        map: map,
                        position: markerPosition
                     }) // 마커 생성 끝
                     
                     // 오버레이 DIV 설정
                     var $wrap = $('<div class="wrap">')
                     
                     // 모든 정보를 감싸는 DIV
                     var $info = $('<div class="info">')
                     
                     // 마커의 위치가 들어갈 부분
                     var $address = $('<div class="address">').text(val.address)
                     
                     // 'X' 닫기 버튼 들어갈 부분 + click fucntion 들어감
                     var $close = $('<div class="close" title="닫기" />').click(closeOverlay)
                     
                     // .img와 .desc를 감싸는 DIV
                     var $body = $('<div class="body">')
                     
                     // 썸네일 들어가는 부분
                     var $img = $('<div class="img">')
                     var $imgContent = $('<img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">')
                     
                     // 글제목, 가격, 링크 들어가는 부분을 감싸는 DIV
                     var $desc = $('<div class="desc">') 
                     
                     // 글 제목이 들어갈 부분
                     var $title = $('<div class="title">').text(val.content)
                     
                     // 가격이 들어갈 부분
                     var $price = $('<div class="price">').text(formattedNumber)
                     
                     // 글 링크 추가 부분
                     var $homelink = $('<div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>')
                     
                     $wrap.append($info);
                     $info.append($address).append($body);
                     $address.append($close);
                     $body.append($img).append($desc)
                     $img.append($imgContent)
                     $desc.append($title).append($price).append($homelink)
   
                     var overlay = new kakao.maps.CustomOverlay({ // KAKAO 커스텀 오버레이 생성 객체
                        content: $wrap[0], 
                        map: map,
                        position: marker.getPosition()
                     }); // overlay 생성 끝
                     overlay.setMap(null) // 지도에 오버레이 안뜨게 설정
                     
                     function closeOverlay(content) { // 지도를 닫는 펑션
                        console.log('Closing overlay for content:', content);
                        overlay.setMap(null); 
                     } // closeOverlay 끝
                     
                     kakao.maps.event.addListener(marker, 'click', function(e) { // 마커를 눌렀을 때 지도가 뜨는 펑션
                        overlay.setMap(map) 
                     }) // click 이벤트 끝
                  } // 검색 if문 끝
               }) // geocoder 끝
            })// $.each() 끝

         }// success 끝
         , error: function(){
            console.log("AJAX 실패")
         }
      })
   })// ajax끝
   
   $("#myLoc").on( 'click', function() { moveCenter() }); // #mtLoc 클릭 이벤트 끝 - 내 위치로 이동 펑션
   
}); // jQuery펑션 끝

function initMap( mapContainer, mapOption ) { // map 생성 함수
   map = new kakao.maps.Map( mapContainer, mapOption ); // 지도 생성
   
   var zoomControl = new kakao.maps.ZoomControl(); // 줌컨트롤 객체 생성
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 줌컨트롤 추가 및 배치 위치 설정
} // initMap() 끝

function moveCenter(){ // 현재 내 위치로 이동합니다
   if (navigator.geolocation) { // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      navigator.geolocation.getCurrentPosition(function(position) {   // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         
      lat = position.coords.latitude; 
      lon = position.coords.longitude; 
                     
      center = new kakao.maps.LatLng(lat, lon)
      
      map.setCenter( center )
      
      }); // function(position) 끝
      
   } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
      // 기본 주소 => 학원 좌표
      center = new kakao.maps.LatLng(37.499181, 127.032789)
      map.setCenter( center )
   
   }// if (navigator.geolocation) 끝
} // moveCenter() 끝

</script>   
<script type="text/javascript">

</script>
   
</head>
<body>

<!-- 지도를 담을 DIV  -->
<div id="map" style="width:100%;height:350px;"></div>

<!-- 임시로 넣어놓은 우편번호 API -->
<div id="searchPostcode">
   <input type="text" id="postcode" placeholder="우편번호">
   <input type="button" onclick="daumPostcode()" value="우편번호 찾기"><br>
   <input type="text" id="address" placeholder="주소"><br>
   <span id="guide" style="color:#999;display:none"></span>
   <input type="text" id="detailAddress" placeholder="상세주소">
   <button id="enter">입력</button>
</div>

<button id="myLoc">내위치</button>

<div id="res"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   var themeObj = {
         searchBgColor: "#FF533F", //검색창 배경색
         queryTextColor: "#FFFFFF" //검색창 글자색
      };

   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
   function daumPostcode() {
      new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#postcode').val(data.zonecode);
            $('#address').val(addr);
            // 상세주소 필드로 포커스를 이동한다.
            $('#sample6_detailAddress').focus();
         },
      theme: {
            searchBgColor: "#FF533F", //검색창 배경색
            queryTextColor: "#FFFFFF" //검색창 글자색
         }
      }).open();
   }
</script>

</body>


</html>