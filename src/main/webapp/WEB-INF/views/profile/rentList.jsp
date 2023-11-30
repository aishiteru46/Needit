<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

/* 썸네일 미리보기 */
#thumbnail_container{
   width: 350px;
    height: 350px;
    float: left;
    position: absolute;
    margin-top: 67px;
    border-radius: 300px;
    background-size: cover;
    overflow: hidden;
}
/* 프로필 사진 */
#profileImg{
   width: 350px;
    height: 350px;
    background-size: cover;
    object-fit: cover;
}
/* 프로필사진, 닉네임, 사진등록 삭제 */
#profileImgContainer{ 
   width: 400px; 
    float: left; 
    margin-top: 67px;
/*     display: inline-block; */
}
/* 프로필 등록 삭제 버튼 배치 */
#profileImgUpdate{
   margin-left: 96px;
   margin-top: 6px;
}
/* 프로필 사진 크기 */
#profileImage{
   width: 350px;
   border-radius: 310px;
}
/* 유저 정보 */
#userContent{
    width: 775px;
    height: 332px;
/*     display: inline-block; */
    float: left;
}
.userInfo thead{
   width: 200px;
    background-color: azure;
}
.userInfo tbody td{
   width: 575px;
   vertical-align: middle;
     display: table-cell;
}
.userInfo th{
   height: 48px;
}
.userInfo td{
   height: 48px;
}
/* 유저 정보 테이블 둥글게 */
#userContent table{
   border-radius: 10px;
}
/* 회원등급 사진 */
#userGrade{
   display: inline-block;
}
#userGrade img{
   width: 20px;
   height: 30px;
   display: inline-block;
   vertical-align: top;
}
/* 자기소개 너비 */
#introduce{
   width: 1134px;
    clear: both;
    margin: 0 auto;
}
/* 자기소개 id */
#introId{
   margin-bottom: 10px;
   border: 1px solid #ccc;
}
/* 자기소개칸 둥글게 */
#introId, #introText{
    border-radius: 10px;
}
/* 목록들 제목 h1 */
.listH1{
    margin-left: 16px;
}
/* 테이블 th 색상 */
.rentTable th{
   background-color: rgb(255,83,63);
   color: white;
}
/* 목록 테이블 둥글게 */
.rentTable{
   border-radius: 5px;
   width: 99%;
}
.userInfo td{
   border-bottom: 1px solid #cccccc40;
}
/* 목록들 스크롤 */
.tableScroll{
   overflow-x: hidden;
    overflow-y: scroll;
    height: 200px;
    width: 1139px;
    margin-left: 20px;
    display: inline-block;
}
/* 사진 수정 버튼 */
#fileEdit{
    border: 1px solid rgb(255,83,63);
    border-radius: 5px;
    background-color: rgb(255,83,63);
    color: white;
    width: 46px;
    height: 31px;
    text-align: center;
    font-size: 15px;
    font-weight: normal;
    padding: 3px;
    float: left;
    margin-top: -36px;
    margin-left: 162px;
}

/* 유저 정보 */
/* .userInfo th{ */
/*    background-color: rgb(255,83,63); */
/* } */

/* 유저 정보 테이블 모양 세로 정렬 */
#userContent thead{
   float: left;
}
#userContent thead tr, thead tr th{
   display: block;
}
#userContent tbody{
   display: block;
   overflow-x: hidden;
   white-space: nowrap; 
}
#userContent tbody tr{
   display: inline-block;
}
#userContent tbody tr td{
   display: block;
}
/* 등급 크기 */
#userContent tbody tr td img{
   width: 25px;
    height: 28px;
    vertical-align: top;
}
.userInfo th div, .userInfo td div{
   margin-top: 7px;
}
/* 취소 승인 버튼 */
.agrBtn{
   font-size: 16px;
   font-weight: bold;
    width: 99%;
    height: 34px;
    margin-left: 1px;
    border-radius: 5px;
}
.rentDate{
   width: 287px;
}
.rentTable tr th:first-child {
   border-top-left-radius: 5px;
}
.rentTable tr th:last-child {
   border-top-right-radius: 5px;
   border: none;
}
.rentTable th{
   border-right: 1px solid #ccc;
}
.rentTable td{
   border-bottom: 1px solid #ccc;
   font-weight: normal;
}

/* 업체 마크 */
#userContent svg{
   display: inline-block;
   margin-left: 5px;
   margin-top: -11px;
   color: rgb(255,83,63);
}
/* 업체 링크 */
#businessUrl{
   position: absolute;
    margin-top: -69px;
    margin-left: 400px;
    margin-bottom: 24px;
    font-size: 18px;
    width: 776px;
    height: 50px;
    background-color: #ccc;
    color: black;
    border-radius: 5px;
    vertical-align: middle;
}

/* 업체 마크 */
#userContent svg{
   display: inline-block;
   margin-left: 5px;
   margin-top: -11px;
   color: rgb(255,83,63);
}
/* 업체 링크 */
#businessUrl{
   position: absolute;
    margin-top: -69px;
    margin-left: 400px;
    margin-bottom: 24px;
    font-size: 18px;
    width: 776px;
    height: 50px;
    background-color: #ccc;
    color: black;
    border-radius: 5px;
    vertical-align: middle;
}
/* 목록들 보기 버튼 */
.listWatchBtn{
	width: 260px;
    height: 39px;
    border-radius: 5px;
    margin-bottom: 6px;
    margin-left: 19px;
    font-size: 16px;
    font-weight: bold;
    background-color: darkgrey;
    color: white;
    border: none;
}
</style>

<h1 class="listH1">빌려줄 예약 목록</h1>
<div class="tableScroll">
<table class="rentTable">
   <tr>
      <th>게시글 번호</th>
      <th>예약 번호</th>
      <th>예약자</th>
      <th>예약 날짜</th>
      <th>예약 시작 시간</th>
      <th>예약 끝 시간</th>
      <th>결제 상태</th>
      <th>승인 처리</th>
      <th>취소</th>
      
   </tr>
<c:forEach items="${myList }" var="list" begin="0" end="10">
   <tr>
      <td>${list.BOARD_NO }</td>
      <td>${list.RENT_NO }</td>
      <td>${list.RENTER_ID }</td>
      <td class="rentDate">${list.RENT_DATE }</td>
      <c:choose>
       <c:when test="${list.START_TIME % 2 == 1}">
              <c:set var="hour" value="${(list.START_TIME ) / 2}" />
              <c:set var="minute" value="00" />
          </c:when>
          <c:when test="${list.START_TIME % 2 == 0}">
              <c:set var="hour" value="${list.START_TIME / 2}" />
              <c:set var="minute" value="30" />
          </c:when>
      </c:choose>

      <!-- 시작 시간 출력 -->
      <td>${hour}:${minute}</td>
      
      <c:choose>
          <c:when test="${list.END_TIME % 2 == 1}">
              <c:set var="endHour" value="${(list.END_TIME + 1) / 2 - 1}" />
              <c:set var="endMinute" value="00" />
          </c:when>
          <c:when test="${list.END_TIME % 2 == 0}">
              <c:set var="endHour" value="${list.END_TIME / 2}" />
              <c:set var="endMinute" value="30" />
          </c:when>
      </c:choose>
   
      <!-- 종료 시간 출력 -->
      <td>${endHour}:${endMinute}</td>
      <c:choose>
            <c:when test="${list.PAYMENT_TYPE eq 1}">
                <td><button disabled="disabled" class="agrBtn">결제됨</button></td>
            </c:when>
            <c:when test="${list.PAYMENT_TYPE eq 0}">
                <td><button disabled="disabled" class="agrBtn">직거래</button></td>
            </c:when>
        </c:choose>
      <c:if test="${list.RENT_STATUS eq 1 }">
         <td><button id="confirmBtn" class="agrBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">승인</button></td>
      </c:if>
      <c:if test="${list.RENT_STATUS eq 0 || list.RENT_STATUS eq 2 }">
         <td><button disabled="disabled" class="agrBtn">승인 완료</button></td>
      </c:if>

      <!-- 취소 빈칸 채우기 -->
      <c:if test="${list.RENT_STATUS eq 1 }">
         <td><button class="cancelBtn" data-no="${list.RENT_NO }" data-uid="${list.MERCHANT_UID }" data-board_no="${list.BOARD_NO }">취소</button></td>
      </c:if>
      <c:if test="${list.RENT_STATUS eq 0 }">
         <td><button disabled="disabled" class="agrBtn">취소 완료</button></td>
      </c:if>
    
   </tr>
   
</c:forEach>
</table><!-- .rentTable -->
</div><!-- .tableScroll -->

<%-- <small class="float-end" style=" margin-right: 8px; margin-top: -10px; margin-bottom: 20px;">total : ${paging.totalCount }</small> --%>

<%-- <c:import url="/WEB-INF/views/layout/paginationRent.jsp" /> --%>
      
<hr>


<h1 class="listH1">빌린 예약 목록</h1>
<div class="tableScroll">
<table class="rentTable">
   <tr>
      <th>게시글 번호</th>
      <th>예약 번호</th>
      <th>주문번호</th>
      <th>예약 날짜</th>
      <th>예약 시작 시간</th>
      <th>예약 끝 시간</th>
      <th>결제 상태</th>
      <th>승인 처리</th>
      <th>취소</th>
   </tr>
<c:forEach items="${list }" var="list" begin="0" end="10">
   <tr>
      <td>${list.BOARD_NO }</td>
      <td>${list.RENT_NO }</td>
      <td>${list.MERCHANT_UID }</td>
      <td>${list.RENT_DATE }</td>

      <c:choose>
       <c:when test="${list.START_TIME % 2 == 1}">
              <c:set var="hour" value="${(list.START_TIME + 1) / 2}" />
              <c:set var="minute" value="00" />
          </c:when>
          <c:when test="${list.START_TIME % 2 == 0}">
              <c:set var="hour" value="${(list.START_TIME / 2) - 1}" />
              <c:set var="minute" value="30" />
          </c:when>
      </c:choose>

      <!-- 시작 시간 출력 -->
      <td>${hour}:${minute}</td>
      
      <c:choose>
          <c:when test="${list.END_TIME % 2 == 1}">
              <c:set var="endHour" value="${(list.END_TIME + 1) / 2 - 1}" />
              <c:set var="endMinute" value="00" />
          </c:when>
          <c:when test="${list.END_TIME % 2 == 0}">
              <c:set var="endHour" value="${list.END_TIME / 2}" />
              <c:set var="endMinute" value="30" />
          </c:when>
      </c:choose>
   
      <!-- 종료 시간 출력 -->
      <td>${endHour}:${endMinute}</td>
      
      <c:choose>
            <c:when test="${list.PAYMENT_TYPE eq 1}">
                <td><button disabled="disabled" class="agrBtn">결제됨</button></td>
            </c:when>
            <c:when test="${list.PAYMENT_TYPE eq 0}">
                <td><button disabled="disabled" class="agrBtn">직거래</button></td>
            </c:when>
        </c:choose>
      
      <c:if test="${list.RENT_STATUS eq 1 }">
         <td><button id="confirmBtn" class="agrBtn" data-rent_no="${list.RENT_NO }" data-board_no="${list.BOARD_NO }">승인</button></td>
      </c:if>
      <c:if test="${list.RENT_STATUS eq 0 || list.RENT_STATUS eq 2 }">
         <td><button disabled="disabled" class="agrBtn">승인 완료</button></td>
      </c:if>


      <!-- 취소 빈칸 채우기 -->
      <c:if test="${list.RENT_STATUS eq 1 }">
         <td><button class="cancelBtn" data-no="${list.RENT_NO }" data-uid="${list.MERCHANT_UID }" data-board_no="${list.BOARD_NO }">취소</button></td>
      </c:if>
      <c:if test="${list.RENT_STATUS eq 0 }">
         <td><button disabled="disabled" class="agrBtn">취소 완료</button></td>
      </c:if>
   </tr>
</c:forEach>
</table>
</div><!-- .tableScroll -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />