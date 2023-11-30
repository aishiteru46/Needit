<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 찜목록 -->

<h1 class="listH1">찜 목록</h1>
<div id="basketListSection" class="tableScroll">
<table id="basketListTable" class="rentTable">
   <tr>
      <th>No.</th>
      <th>제목</th>
      <th>게시판</th>
      <th>작성자</th>
      <th>작성일</th>
   </tr>
   
<c:forEach items="${basketList }" var="basketList" begin="0" end="10">
   <tr>
      <td>${basketList.BOARD_NO }</td>
      <td>
         <c:choose>
               <c:when test="${basketList.MENU eq 1}">
                   <a href="/rent/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 2}">
                   <a href="/share/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 3}">
                   <a href="/please/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 4}">
                   <a href="/community/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
               <c:when test="${basketList.MENU eq 5}">
                   <a href="/business/view?boardNo=${basketList.BOARD_NO}">${basketList.TITLE }</a>
               </c:when>
           </c:choose>
        </td>
        
        <td>
             <c:choose>
              <c:when test="${basketList.MENU eq 1}">
                  대여해요
              </c:when>
              <c:when test="${basketList.MENU eq 2}">
                  나눔해요
              </c:when>
              <c:when test="${basketList.MENU eq 3}">
                  해주세요
              </c:when>
              <c:when test="${basketList.MENU eq 4}">
                  커뮤니티
              </c:when>
              <c:when test="${basketList.MENU eq 5}">
                  동네업체
              </c:when>
          </c:choose>
          </td>
        
        <td>${basketList.WRITER_NICK }</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${basketList.writeDate}"/></td>
   </tr>

</c:forEach>
</table>
</div><!-- .tableScroll -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />