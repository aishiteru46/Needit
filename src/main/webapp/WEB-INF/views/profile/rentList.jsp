<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

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