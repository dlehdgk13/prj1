<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재할 서류 목록입니다.</title>
<script>

	$(document).ready(function() {
		
		headerSort("approvalResList", 0);
		headerSort("approvalReqList", 0);

		setTableTrBgColor(
				"approvalResList",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);

		setTableTrBgColor(
				"approvalReqList",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
		

	});


	function viewAppResDoc(document_no) {
		//alert("결재 문서 보기 구현 예정");
		//alert(document_no);
		$("[name=document_no]").val(document_no);

		document.approvalResListForm.submit();
		
	}
		
</script>
</head>
<body>
	<center>
		<h3>결재할 서류 목록 [ ${approvalResCnt} ]</h3><br>
		<form name="approvalResListForm" method="post" action="/group4erp/viewApprovalDoc.do" >
			<table class="approvalResList tab" name="approvalResList" cellpadding="5" cellspacing="5">
			<tr>
				<th>직급</th><th>사원</th><th>문서일련번호</th><th>결재요청시간</th><th>상태</th>
			</tr>
			<c:forEach items='${approvalResList}' var="approvalResList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewAppResDoc('${approvalResList.document_no}');" align="center">
					
					<%--<td>${approvalResList.approval_num}</td> --%>
					<td>${approvalResList.jikup}</td>
					<td>${approvalResList.emp_name}</td>
					<td>${approvalResList.document_no}</td>
					<td>${approvalResList.e_works_req_dt}</td>
					<td>${approvalResList.approval_state}</td>
				</tr>	
			</c:forEach>
		
		</table>
		<input type="hidden" name="document_no" value="${document_no}">
		</form>
		
		<c:if test="${approvalResList.size()==0}">
			<h5>결재할 사항이 없습니다.</h5>
		</c:if>
		
		<br><br><br>
		
		<span id="approvalReq"><h3>결재 요청한 서류 목록 [ ${approvalCnt} ]</h3></span>
		<table class="approvalReqList tab" name="approvalReqList" cellpadding="5" cellspacing="5">
			<tr>
				<th>순서</th><th>문서일련번호</th><th>결재요청시간</th><th>상태</th><th>비고</th>
			</tr>
			<c:forEach items='${approvalReqList}' var="approvalReqList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewDocument();">
					<td>${approvalReqList.e_works_no}</td>
					<td>${approvalReqList.document_no}</td>
					<td>${approvalReqList.e_works_req_dt}</td> 
					<td align="center">${approvalReqList.approval_state}</td> 
					<td>
						<c:if test="${approvalReqList.approval_state eq '대기중' }">
							<input type="button" value="삭제" onClick="deleteApproval('${approvalReqList.e_works_no}');">
						</c:if>					
					</td> 
				</tr>	
			</c:forEach>
		
		</table>
		<c:if test="${approvalReqList.size()==0}">
			<h5>결재를 요청한 내역이 없습니다.</h5>
		</c:if>
		<h5>'대기중'인 결재 문서는 수정 & 삭제가 가능합니다.<br>
		'심사중'인 결재 문건은 수정과 삭제가 불가하며, 부득이하게 취소하고자 할 경우에는 담당 부서장과 상의하시기 바랍니다.</h5>
	</center>
	
</body>
</html>