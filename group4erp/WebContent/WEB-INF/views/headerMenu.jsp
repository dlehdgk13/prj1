<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<html>


<% 

	String emp_name = (String)session.getAttribute("emp_name"); 
	String emp_no = (String)session.getAttribute("emp_id");
	String mgr = (String)session.getAttribute("mgr"); 
	String dep_no = (String)session.getAttribute("dep_no"); 
	String mgr_emp_no = (String)session.getAttribute("mgr_emp_no"); 
	
 %>
 
<head>

<style>
	.subMenu:hover {
		box-shadow : 2px 2px 5px #999;	
	}
	


</style>

	<script>
		$(document).ready(function() {
			$("#subMenu1").hide();
			$("#subMenu2").hide();
			$("#subMenu3").hide();
			$("#subMenu4").hide();
			$("#subMenu5").hide();
			$("#subMenu6").hide();
			$("#subMenu7").hide();
			$("#subMenu8").hide();

			showTime();
			
			var tableObj = $("[name=menuList]");

			var trObj = tableObj.find("th");

		});


		function moveMainPage() {
			location.replace("/group4erp/goMainPage.do");
		}
			
	
		function viewMyWorkMenu() {
			hideSubMenu();
			$("#subMenu1").show();
			//$("#navigator").html('[업무관리]');
		}

		function viewInventoryMenu() {
			hideSubMenu();
			$("#subMenu2").show();
			//$("#navigator").html('[재고관리]');
		}
	

		function viewShippingMenu() {
			hideSubMenu();
			$("#subMenu3").show();
			//$("#navigator").html('[배송관리]');
		}


		function viewMarketingMenu() {
			hideSubMenu();
			$("#subMenu4").show();
			//alert("마케팅관리 기능 구현");
			//$("#navigator").html('[마케팅관리]');
			
		}


		function viewHRMenu() {
			hideSubMenu();
			$("#subMenu5").show();
			//alert("인사관리 기능 구현(admin 권한 보유자만 보이게 구현)");
			//location.replace("/z_spring/boardListForm.do");
			//$("#navigator").html('[인사관리]');
		}

		function viewAccoutingMenu() {
			hideSubMenu();
			$("#subMenu6").show();
			//$("#navigator").html('[회계관리]');
		}

		function viewBigDataMenu() {
			hideSubMenu();
			$("#subMenu7").show();
			//$("#navigator").html('[전략분석]');
		}

		function hideSubMenu() {
			$('#subMenu1').hide();
			$('#subMenu2').hide();
			$('#subMenu3').hide();
			$('#subMenu4').hide();
			$('#subMenu5').hide();
			$('#subMenu6').hide();
			$('#subMenu7').hide();
			$('#subMenu8').hide();
		}		

		<!-- 업무관리 서브메뉴 -->

		function myCareBookList() {
			location.href="/group4erp/goMyCareBookList.do";
			//alert("담당상품조회");
			$('#subMenu1').show();
		}

		function businessTripForm() {
			location.href="/group4erp/businessTripList.do";
		}
		
		function viewMyWorkTime() {
			location.href="/group4erp/goMyWorkTime.do";
			//alert("근태조회 구현 예정");
		}
		function dayoffJoin(){
			location.replace("/group4erp/goEmpDayOffjoin.do");
		}

		function viewApprovalList() {
			location.href="/group4erp/viewApprovalList.do";
		}

		// 재고관리 서브메뉴 -->

		function goBookList() {
			location.href="/group4erp/goBookList.do";
			//alert("도서정보리스트 구현 예정");
		}

		function goBookInvenList() {
			//alert("재고현황조회 기능 구현 예정");
			location.href="/group4erp/goBookInvenList.do";
		}
 
		function goShippingList() {
			//alert("출고현황조회 기능 구현");
			location.href="/group4erp/goReleaseList.do";
		}
/* 
		function goMyCareBookList() {
			alert("입고현황조회 기능 구현");
		}

		function goMyCareBookList() {
			alert("반품 현황 조회 기능 구현");
		}
*/
		//배송관리 서브메뉴 -->


		function goReturnBookList() {
			//alert("반품현황 조회기능 구현 예정");
			location.href="/group4erp/goReturnOrderList.do";
		}

		function goNowSaleList() {
			//alert("현재 판매 현황 조회");
			location.href="/group4erp/viewSalesInfoList.do";
		}

		function eventSchedulingList() {
			//alert("이벤트 행사 신청 & 결과 보고 기능 구현 예정");
			//location.replace("/group4erp/eventScheduling.do");
			location.href="/group4erp/viewEventList.do";
		}

		function adApplyList() {
			location.href="/group4erp/viewAdApplyList.do";
		}

		//인사관리 서브 메뉴-->
		function viewEmpList() {	//직원정보
			location.href="/group4erp/viewEmpList.do";
		}

		function viewSalaryList() {		//급여지급현황조회(인사부장 전용 메뉴)
			location.href="/group4erp/viewSalList.do";
		}

		//급여명세서 조회
		function viewSalarySpecList() {
			location.href="/group4erp/viewEmpSalInfo.do";
		}

		function viewEmpWorkStateList() {	//직원별 근무현황 조회
			location.href="/group4erp/viewEmpWorkStateList.do";
		}

		function viewEmpDayOffList() {	//직원별 휴가현황 조회
			location.href="/group4erp/viewEmpDayOffList.do";
		}
		
		//매출정보 조회
		function viewSalesReport() {
			location.href="/group4erp/viewSalesReport.do";
		}

		//어음정보 조회
		function viewPromiNoteList() {
			location.href="/group4erp/viewPromiNoteList.do";
		}

		//세금계산서 발급 내역 조회
		function viewTaxInvoiceList() {
			location.href="/group4erp/viewTaxInvoiceList.do";
		}

		//세금계산서 발급하기
		function viewTaxInvoiceForm() {
			location.href="/group4erp/viewTaxInvoiceForm.do";
		}

		//거래명세서 발급 내역 조회
		function viewSpecTransaction() {
			location.href="/group4erp/viewTranSpecIssueList.do";
		}

		function viewCorpList() {
			location.href="/group4erp/viewCorpList.do";
		}

		function viewTranLog() {
			location.href="/group4erp/viewTranSpecList.do";
		}
		

		//판매추이분석구현예정
		function viewSalesChangeReport() {
			alert("판매추이분석 리포트 구현 예정");
		}

		//판매추이분석구현예정
		function viewCusClaimReport() {
			alert("고객클레임처리분석 리포트 구현 예정");
		}

		//인기키워드분석
		function viewBestKeywdReport() {
			location.href="/group4erp/viewBestKeywdAnalysis.do";
			
		}

		function goMyIntoList(){
			location.href="/group4erp/goWarehousingList.do";
		}

		function viewOurCompanyReport() {
			location.href="/group4erp/viewOurCompanyReport.do";
		}

		function logout() {
			location.href="/group4erp/logout.do";
		}


		function showTime() {
			//현재 날짜를 관리하는 Date 객체 생성
			var today = new Date();
			//----------------------------------------
			//Date 객체에서 날짜 관련 각 데이터를 꺼내어 저장하는 변수 선언
			var amPm = "오후";
			var year = today.getFullYear();
			var month = today.getMonth()+1;
			var week = today.getDay();
			var date = today.getDate();
			var hour = today.getHours();
			var minute = today.getMinutes();
			var second = today.getSeconds();

			var week = ["일", "월", "화", "수", "목", "금", "토"][today.getDay()];
			//날짜 관련 각 데이터가 10 미만이면 앞에 0 붙이기
			//오전, 오후 여부 판단해서 저장하기
			
			if(month<10) {
				month = "0"+month;
			}

			if(date<10) {
				date = "0"+date;
			}

			if(hour<12) {
				amPm = "오전";
			}

			if(hour>12) {
				hour=hour-12;
			}

			if(hour<10) {
				hour="0"+hour;
			}

			if(minute<10) {
				minute = "0"+minute;
			}

			if(second<10) {
				second = "0" + second;
			}
			//id="nowTime"가 있는 태그영역 내부에 시간 문자열 삽입

			document.getElementById("nowTime").innerHTML = year+"년 "+month+"월 "+date+"일("+week+") "+amPm+" "+hour+"시 "+minute+"분 ";
			
		}

		function startTime() {
			showTime();		//1초 딜레이 되어 시간이 표시되는 현상을 제거하기 위해 showTime() 함수를 한 번 호출한다.
			//-----------------------------------
			//1초마다 showTime() 함수를 호출하기
			//-----------------------------------
			window.setInterval("showTime()", 1000);		//window.setInterval(function() { showTime(); }, 1000);
		}
		
	</script>
</head>
<body>
<center><nav class="cl-effect-7">
	<table class="menuList tab" name="menuList" border="0" cellspacing="0" cellpadding="0" width="100%" style="table-layout:fixed;">
		<tr style="border-bottom:1px solid black;">
			<td align="left"><input type="button" value="메인화면으로" onClick="moveMainPage();"></td>
			<td width="50">&nbsp;</td>
			<th width="100" style="cursor:pointer" onMouseOver="javascript:viewMyWorkMenu();" onClick="myCareBookList();"><span><a href="#">업무관리</a></span></th><td widht="50" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>	
			<th width="100" id="menu" style="cursor:pointer" onMouseOver="javascirpt:viewInventoryMenu();" onClick="goBookList();"><a href="#">재고현황</a></th><td widht="50" onMouseOver="hideSubMenu();" onClick="goBookList();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<!-- <th style="cursor:pointer" onMouseOver="javascirpt:viewShippingMenu();">배송관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
			<th width="100" id="menu" style="cursor:pointer" onMouseOver="javascirpt:viewMarketingMenu();" onClick="goNowSaleList();"><a href="#">마케팅관리</a></th><td widht="50" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th width="100" id="menu" style="cursor:pointer" onMouseOver="javascirpt:viewHRMenu();" onClick="viewEmpList();" ><a href="#">인사관리</a></th><td widht="50" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th width="100" id="menu" style="cursor:pointer" onMouseOver="javascirpt:viewAccoutingMenu();" onClick="viewTranLog();"><a href="#">회계관리</a></th><td widht="50" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th width="100" id="menu" style="cursor:pointer" onMouseOver="javascirpt:viewBigDataMenu();" onClick="viewBestKeywdReport();"><a href="#">전략분석</a></th><td widht="50" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<!-- <th style="cursor:pointer" onMouseOver="javascirpt:viewBuyerMenu();">거래처관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
			<td id="menu" align="left" colspan="2"><h5>${emp_name} ${jikup}님 <br>안녕하세요.^^</h5> <input type="button" value="로그아웃" onClick="logout();">
			</td>
			
		</tr>
		<tr style="border-top:1px solid black;">
			<td></td><td></td>
			<!-- <td colspan="16" width="500"> -->
			<td class="fontNormal" nowrap>&nbsp;<!-- &nbsp;지우지말것!! -->
				<span id="subMenu1"> <!-- 업무관리 -->
					<span class="subMenu" id="myCareBookList" style="cursor:pointer" onClick="myCareBookList();">담당 상품 조회&nbsp;&nbsp;&nbsp;</span>
					<!--<span id="myCareBookList " style="cursor:pointer" onClick="myCareBookList();">담당 상품 조회&nbsp;&nbsp;&nbsp;</span>  -->
					<span class="subMenu" id="businessTripForm" style="cursor:pointer" onClick="businessTripForm();">출장신청&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="viewMyWorkTime" style="cursor:pointer" onClick="viewMyWorkTime();">근태조회&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="viewMyWorkTime" style="cursor:pointer" onClick="viewApprovalList();">문서 결재&nbsp;&nbsp;&nbsp;</span>
					<!-- <span id="viewMyWorkTime" style="cursor:pointer" onClick="approvalDoc();">문서 결재&nbsp;&nbsp;&nbsp;</span> -->
					<span class="subMenu" id="empDayOffjoin" style="cursor:pointer" onClick="dayoffJoin();">휴가 신청&nbsp;&nbsp;&nbsp;</span>

				</span>
			</td>
			<td></td>
			<td class="fontNormal" nowrap>
				<span id="subMenu2">	<!-- 재고관리 -->
					<span class="subMenu" id="myCareBookList" style="cursor:pointer" onClick="goBookList();">도서정보조회&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="shippingList" style="cursor:pointer" onClick="goShippingList();">출고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="myIntoList" style="cursor:pointer" onClick="goMyIntoList();">입고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="returnBookList" style="cursor:pointer" onClick="goReturnBookList();">반품현황조회&nbsp;&nbsp;&nbsp;</span>
				</span>
			</td>
			<td></td>
				<!--<span id="subMenu3" >	 배송관리 
					<span id="orderList" style="cursor:pointer" onClick="goOrderList();">주문현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="shipScheduleList" style="cursor:pointer" onClick="goShipScheduleList();">배송스케쥴조회&nbsp;&nbsp;&nbsp;</span>
					<span id="goShipping" style="cursor:pointer" onClick="goShipping();">출고지시&nbsp;&nbsp;&nbsp;</span> 
					<span id="returnList" style="cursor:pointer" onClick="goReturnList();">반품접수&처리 현황&nbsp;&nbsp;&nbsp;</span>
				</span>-->
			<td class="fontNormal" nowrap>
				<span id="subMenu4">	<!-- 마케팅관리 -->
					<span class="subMenu" id="nowSaleList" style="cursor:pointer" onClick="goNowSaleList();">판매현황&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="eventSchedulingList" style="cursor:pointer" onClick="eventSchedulingList();">이벤트행사 현황&nbsp;&nbsp;&nbsp;</span>
					<!-- <span id="adOrder" style="cursor:pointer" onClick="adApplyList();">광고신청현황&nbsp;&nbsp;&nbsp;</span> -->	
				</span>
			</td>
			<td></td>
			<td class="fontNormal" nowrap>
				<span id="subMenu5">	<!-- 인사관리 -->
					<span class="subMenu" id="empList" style="cursor:pointer" onClick="viewEmpList();">직원정보&nbsp;</span>
					
						<c:if test="${dep_no eq 6 && mgr_emp_no eq '100001'}">
							<span id="salaryList" style="cursor:pointer" onClick="viewSalaryList();">급여지급현황&nbsp;</span>
						</c:if>
					
					<span class="subMenu" id="salaryList" style="cursor:pointer" onClick="viewSalarySpecList();">급여명세서 조회&nbsp;</span>		
					<span class="subMenu" id="empWorkState" style="cursor:pointer" onClick="viewEmpWorkStateList();">직원별 근무현황조회&nbsp;</span>
					<span class="subMenu" id="empDayOffList" style="cursor:pointer" onClick="viewEmpDayOffList();">직원별 휴가 현황&nbsp;</span>
				</span>
			</td>
			<td></td>
			<td class="fontNormal" nowrap>
				<span id="subMenu6">	<!-- 회계관리 -->
					<!-- <span id="salesInfoList" style="cursor:pointer" onClick="viewSalesReport();">매출정보&nbsp;&nbsp;&nbsp;</span> -->
					<!-- <span id="elecBill" style="cursor:pointer" onClick="viewPromiNoteList();">전자어음&nbsp;&nbsp;&nbsp;</span> -->
					<span class="subMenu" id="specTransaction" style="cursor:pointer" onClick="viewSpecTransaction();">거래명세서 발급 조회&nbsp;&nbsp;&nbsp;</span>
					<!-- <span id="taxInvoice" style="cursor:pointer" onClick="viewTaxInvoiceList();">세금계산서&nbsp;&nbsp;&nbsp;</span> -->
					<span class="subMenu"  id="viewTranLog" style="cursor:pointer" onClick="viewTranLog();">거래내역 조회&nbsp;&nbsp;&nbsp;</span>
					<span class="subMenu" id="updateClientList" style="cursor:pointer" onClick="viewCorpList();">거래처 등록/삭제&nbsp;&nbsp;&nbsp;</span>
				</span>
			</td>
			<td></td>
			<td class="fontNormal" nowrap>
				<span id="subMenu7">	<!-- 전략분석 -->
					<!-- <span id="salesChangeReport" style="cursor:pointer" onClick="viewSalesChangeReport();">매출추이분석&nbsp;&nbsp;&nbsp;</span> -->
					<!-- <span id="cusClaimReport" style="cursor:pointer" onClick="viewCusClaimReport();">고객 클레임 처리 상황&nbsp;&nbsp;&nbsp;</span> -->
					<span class="subMenu" id="bestKeywordReport" style="cursor:pointer" onClick="viewBestKeywdReport();">키워드 검색 자료 조회&nbsp;&nbsp;</span>
					<span class="subMenu" id="ourCompanyReport" style="cursor:pointer" onClick="viewOurCompanyReport();">회사 현황&nbsp;&nbsp;</span>					
				</span>
			</td>
				<!-- <span id="subMenu8">	거래처관리 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="updateClientList" style="cursor:pointer" onClick="updateClientList();">거래처 목록&nbsp;&nbsp;&nbsp;
					<span id="clientList" style="cursor:pointer" onClick="viewClientList();">고객사 조회&nbsp;&nbsp;&nbsp;
					<span id="supporterList" style="cursor:pointer" onClick="viewSupporterList();">협력사 조회&nbsp;&nbsp;&nbsp; 
						
				</span>-->			
			<td colspan="2"></td>		
		</tr>
		</nav>
	</table>
	</nav>
	<div id="navigationBar" align="left">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td align="left">현재 위치 : <span id="navigator">${navigator}</span></td> <td align="right"> <h5><span id="nowTime" align="right"></span> </h5></td>
			</tr>
		</table>
	</div>
</center>
</body>
</html>