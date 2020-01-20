<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 문서 보기</title>
</head>
<body><center>
<h1>[결재 바랍니다]</h1>

   <!-- 이벤트 행사 신청 결재 -->
   <c:if test="${approvalDoc.equals('EV') }">   
      <%@ include file="/WEB-INF/views/approvalDocEvent.jsp" %>
   </c:if>
      
   <c:if test="${approvalDoc.equals('DO') }">   <!-- 휴가 결재 -->
      <%@ include file="/WEB-INF/views/approvalDocDayOff.jsp" %>
   </c:if>
      
   <c:if test="${approvalDoc.equals('BT') }"> <!-- 출장신청 결재 -->
      <%@ include file="/WEB-INF/views/approvalDocBusinessTrip.jsp" %>
   </c:if>
      
   <c:if test="${approvalDoc.equals('PC') }"> <!-- 급여대장 결재 -->
      <%--<%@ include file="/WEB-INF/views/approvalDocPayCheck.jsp" %>--%>
   </c:if>

</center>

</body>
</html>