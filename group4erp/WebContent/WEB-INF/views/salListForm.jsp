<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여지급내역(직원별)</title>
<script>

	$(document).ready(function(){
	
		headerSort("salListTable", 0);

		setTableTrBgColor(
				"salListTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
			);
			
		
	
		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
		
		$(".pagingNumber").html(
				getPagingNumber(
					"${emp_tot_cnt}"						//검색 결과 총 행 개수
					,"${salListSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${salListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);
	
		inputData('[name=rowCntPerPage]',"${salListSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${salListSearchDTO.selectPageNo}");
	});

	function goSearch() {
		document.empSalSearchForm.submit();
	}

	function goSearchAll() {
		document.empSalSearchForm.reset();

		$('[name=empSalSearchForm] [name=selectPageNo]').val("1");
		$('[name=empSalSearchForm] [name=rowCntPerPage]').val("15");
		
		goSearch();
	}

	function viewEmpSalInfo(emp_no) {
		
		inputData('[name=emp_no]', emp_no);
		document.salListForm.submit();
	}

	function goApproval() {
		alert("결재");
	}

	function goChart() {
		location.replace("/group4erp/viewEmpAvgSalChart.do");
	}

	function goPayCheck() {
		
		$.ajax({
			url : "/group4erp/goPayCheckProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('[name=payListForm]').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정
			
			success : function(data) {
				if(data>=1) {
					alert("급여 지급 성공!");
					
					location.replace("/group4erp/viewSalList.do");
				} else if(data==-1) {	
					alert("급여 지급에 문제가 생겼습니다!");
					
					location.replace("/group4erp/viewSalList.do");

				} else {
					alert("서버쪽 DB 연동 실패!");
				}
			}

			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}	
		});

	}

</script>

</head>
<body><center>
	<h1>[${timeDTO.now_year}년도&nbsp;${timeDTO.now_month}월분 급여대장]</h1>
	
	지급일 : ${timeDTO.now_year}년 ${timeDTO.now_month}월 5일	
	
	<form name="empSalSearchForm" method="post" action="/group4erp/viewSalList.do">
	<table class="tab">
		<tr>
			<td>[검색어]</td><td><input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();"></td>
		</tr>
	</table>

	 <table border=0>
	 	<tr>
	    	<td align=right>
	        [총원] : ${emp_tot_cnt} 명&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기
			</td>
		</tr>
      </table>
     <input type="hidden" name="selectPageNo">
    </form>
      
	<!-- 국민연금(4.5%), 건강보험(3.23%), 고용보험(0.8%) -->
		&nbsp;&nbsp;<h6>단위 [원]</h6>
	<form name="payListForm" method="post" action="/group4erp/goPayCheck.do">
		<table class="salListTable tab" name="salListTable" cellpadding="5" cellspacing="5" width="80%">			
			<tr align="center">
				<th rowspan="2">직책 </th><th rowspan="2">성명</th><th colspan="3">지급내역</th><th colspan="5">공제내역</th><th rowspan="2">실수령액</th>
			</tr>
			
			<tr align="center">
				<!-- 지급내역 목록 -->
				<td>기본급 </td> <td>식대 </td><td>보너스</td><td>합계</td>
				<!-- 공제내역 목록-->
				<td>고용보험</td><td>건강보험</td><td>국민연금</td><td>합계</td>
			</tr>
			
			<c:forEach items='${empSalList}' var="empSal" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewEmpSalInfo(${empSal.emp_no});" align="center">
				
					<td><input type="hidden" name="jikup" value="${empSal.jikup}">${empSal.jikup}</td>
					<td><input type="hidden" name="emp_name" value="${empSal.emp_name}">${empSal.emp_name}</td>
					<td><input type="hidden" name="month_sal" value="${empSal.month_sal}">${empSal.month_sal}</td>
					<td><input type="hidden" name="mess_allowance" value="${empSal.mess_allowance}">${empSal.mess_allowance}</td> 
					<td><input type="hidden" name="bus_trip_bonus" value="${empSal.bus_trip_bonus}">${empSal.bus_trip_bonus}</td> 
					<td><input type="hidden" name="sum_payable" value="${empSal.sum_payable}">${empSal.sum_payable}</td>
					
					<td><input type="hidden" name="emp_insurance" value="${empSal.emp_insurance}">${empSal.emp_insurance}</td>
					<td><input type="hidden" name="health" value="${empSal.health}">${empSal.health}</td>
					<td><input type="hidden" name="pension" value="${empSal.pension}">${empSal.pension}</td> 
					<td><input type="hidden" name="deduct" value="${empSal.deduct}">${empSal.deduct} </td> 
					<td><input type="hidden" name="real_sal" value="${empSal.real_sal}">${empSal.real_sal}</td>
				</tr>
			</c:forEach>
	
		</table><br><br>
		
		<!-- <input type="button" value="결재" onClick="goApproval();"> -->
		<input type="button" value="급여 지급" onClick="goPayCheck();">
		<input type="button" value="차트보기" onClick="goChart();">
	</form>
		
		<br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div><br>
				
		
		
		<form name="salListForm" method="post" action="/group4erp/viewEmpSalInfo.do">
			<input type="hidden" name="emp_no" value=''>
		</form>
			
</center>

</body>
</html>