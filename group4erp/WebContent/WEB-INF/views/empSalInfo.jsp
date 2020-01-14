<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여명세서(직원별)</title>
<script>
	$(document).ready(function() {

		headerSort("empSalInfo", 0);

		setTableTrBgColor(
				"empSalInfo",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
	
		$('[name=rowCntPerPage]').change(function(){
			inputData('[name=rowCntPerPage]',  $('[name=outerBorder] [name=rowCntPerPage]').val());
			goSearch();
		});

		$(".pagingNumber").html(
				getPagingNumber(
					"${myPayCheckCnt}"						//검색 결과 총 행 개수
					,"${salListSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${salListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);

		//검색 후 입력양식에 넣었던 검색 조건들 세팅하기
		$('[name=empSalForm] [name=rowCntPerPage]').val("${salListSearchDTO.rowCntPerPage}");
		$('[name=empSalForm] [name=selectPageNo]').val("${salListSearchDTO.selectPageNo}");

		//$('[name=rowCntPerPage]').val($('[name=empSalForm] [name=rowCntPerPage]').val());
		//$('[name=selectPageNo]').val($('[name=empSalForm] [name=selectPageNo]').val());
		
		inputData('[name=rowCntPerPage]',  $('[name=empSalForm] [name=rowCntPerPage]').val());
		inputData('[name=selectPageNo]',  $('[name=empSalForm] [name=selectPageNo]').val());
		//inputData("[name=sort]", "${salListSearchDTO.sort}");
	});
	
	
	function goSearch() {
		
		document.empSalForm.submit();
	}

	function goSearchAll() {
		document.empSalForm.reset();

		$('[name=empSalForm] [name=selectPageNo]').val("1");
		$('[name=empSalForm] [name=rowCntPerPage]').val("15");
		goSearch();
	}
		
</script>
</head>
<body><center>
	
	<h1>[급여 지급 내역]</h1><br>
	직책 : ${jikup}	&nbsp;&nbsp; 성명 :${emp_name}  <br>
	<form name="empSalForm" method="post" action="/group4erp/viewEmpSalInfo.do">

		<div>&nbsp; <span class="pagingNumber"></span>&nbsp;</div>
		<table>
			<tr height=10>
				<td></td>
			</tr>
		</table>
			
		<input type="hidden" name="selectPageNo">
		<input type="hidden" name="rowCntPerPage">

		
	</form>
	
	<table name="outerBorder" cellpadding="5" cellspacing="5">
		<tr>			
			<td align="right">
	        [전체] : ${myPayCheckCnt}개&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기 
	    	</td>
		</tr>
		
		<tr>
			<td>
				<table class="empSalInfo tab" name="empSalInfo" cellpadding="5" cellspacing="5">
					<tr align="center">
						<th rowspan="2">지급일 </th><th colspan="3">지급내역</th><th colspan="5">공제내역</th><th rowspan="2">실수령액</th>
					</tr>
					<tr align="center">
						<!-- 지급내역 목록 -->
						<td>기본급 </td> <td>식대 </td><td>보너스</td><td>합계</td>
						<!-- 공제내역 목록-->
						<td>고용보험</td><td>건강보험</td><td>국민연금</td><td>합계</td>
					</tr>
					<c:forEach items='${myPayCheckList}' var="myPayCheckList" varStatus="loopTagStatus">
						<tr align="center">	
							<td>${myPayCheckList.salary_dt}</td>
							<td>${myPayCheckList.month_sal}</td>
							<td>${myPayCheckList.mess_allowance}</td>
							<td>
								<c:if test="${myPayCheckList.bus_trip_bonus eq null}">
									0
								</c:if>
					
								<c:if test="${!(myPayCheckList.bus_trip_bonus eq null)}">
									${myPayCheckList.bus_trip_bonus}
								</c:if>
							</td>
							<td>${myPayCheckList.sum_payable}</td>
				
							<td>${myPayCheckList.emp_insurance}</td>
							<td>${myPayCheckList.health}</td>
							<td>${myPayCheckList.pension}</td> 
							<td>${myPayCheckList.deduct} </td>
							<td>${myPayCheckList.real_sal}</td>
						</tr>
		
					 </c:forEach>
				</table>
			
			</td>
		
		</tr>
	
	</table>
	
	<h5>귀하의 노고에 감사드립니다.</h5>
	<input type="button" value="뒤로 가기" onClick="javascript:history.go(-1);">
</center>

</body>
</html>