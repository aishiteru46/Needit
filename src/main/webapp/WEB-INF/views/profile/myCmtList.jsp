<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                   <a href="/rent/view?boardNo=${comment.BOARD_NO}" class="comment-link">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 2}">
                   <a href="/share/view?boardNo=${comment.BOARD_NO}" class="comment-link">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 3}">
                   <a href="/please/view?boardNo=${comment.BOARD_NO}" class="comment-link">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 4}">
                   <a href="/community/view?boardNo=${comment.BOARD_NO}" class="comment-link">${comment.CONTENT }</a>
               </c:when>
               <c:when test="${comment.MENU eq 5}">
                   <a href="/business/view?boardNo=${comment.BOARD_NO}" class="comment-link">${comment.CONTENT }</a>
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

