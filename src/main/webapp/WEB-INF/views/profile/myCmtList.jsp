<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

/* Webkit 브라우저를 위한 스타일 */
.tableScroll::-webkit-scrollbar { width: 12px; }
.tableScroll::-webkit-scrollbar-track { background: #f1f1f1; border-radius: 10px; }
.tableScroll::-webkit-scrollbar-thumb { background-color: transparent; border-radius: 10px;background: #ff533f; }

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
/* 	background-color: rgb(255,83,63); */
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
	text-align: center;
}
.rentTable td{
	border-bottom: 1px solid #ccc;
	font-weight: normal;
}
</style>

</head>
<body>


   <table id="commentTable" class="rentTable">
   <tr>
      <th>No.</th>
      <th>댓글</th>
      <th>게시판</th>
      <th>작성일</th>
   </tr>
   
<c:forEach items="${comment }" var="comment" begin="0" end="10">
   <tr>
      <td>${comment.CMT_NO }</td>
      <td>
         <c:choose>
               <c:when test="${comment.MENU eq 1}">
                   <a href="/rent/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 2}">
                   <a href="/share/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 3}">
                   <a href="/please/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 4}">
                   <a href="/community/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 5}">
                   <a href="/business/view?boardNo=${comment.BOARD_NO}">${comment.CONTENT }</a>
               </c:when>
               
           </c:choose>
        </td>
        
        <td>
             <c:choose>
              <c:when test="${comment.MENU eq 1}">
                  대여해요
              </c:when>
              <c:when test="${comment.MENU eq 2}">
                  나눔해요
              </c:when>
              <c:when test="${comment.MENU eq 3}">
                  해주세요
              </c:when>
              <c:when test="${comment.MENU eq 4}">
                  커뮤니티
              </c:when>
              <c:when test="${comment.MENU eq 5}">
                  동네업체
              </c:when>
          </c:choose>
          </td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}"/></td>
   </tr>

</c:forEach>
</table>



</body>
</html>