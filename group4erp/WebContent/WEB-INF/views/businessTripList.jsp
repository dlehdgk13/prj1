<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>출장 신청 리스트</title>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

 input[type="date"]::-webkit-calendar-picker-indicator,
 input[type="date"]::-webkit-inner-spin-button {
     display: none;
     appearance: none;
 }
 
 input[type="date"]::-webkit-calendar-picker-indicator {
   color: rgba(0, 0, 0, 0); /* 숨긴다 */
   opacity: 1;
   display: block;
   background: url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png) no-repeat; /* 대체할 아이콘 */
   width: 20px;
   height: 20px;
   border-width: thin;
}
</style>
<script>
	$(document).ready(function(){

		setTableTrBgColor(
				"businessTripListTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
		

		$("#datepicker3").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		$("#datepicker4").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		
		
		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
		
		//alert("${businessTripSearchDTO.selectPageNo}");
		
		/* alert($("[name=getBusinessTripListSearchForm] [name=selectPageNo]").val());
		alert($("[name=getBusinessTripListSearchForm] [name=rowCntPerPage]").val()); */
		//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
		$(".pagingNumber").html(
				getPagingNumber(
				"${businessTripListAllCnt}"						//검색 결과 총 행 개수
				,"${businessTripSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
				,"${businessTripSearchDTO.rowCntPerPage}"			//페이지 당 출력행의 개수
				,"15"										//페이지 당 보여줄 페이지번호 개수
				,"goSearch();"								//페이지 번호 클릭 후 실행할 자스코드
			)
		);

		inputData('[name=rowCntPerPage]',"${businessTripSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${businessTripSearchDTO.selectPageNo}");
		inputData('#selectSearch',"${businessTripSearchDTO.searchKey}");
		inputData('#searchKeyword',"${businessTripSearchDTO.keyword}");
		inputData('#sort',"${businessTripSearchDTO.sort}");
		inputData('#datepicker3',"${businessTripSearchDTO.startTime}");
		inputData('#datepicker4',"${businessTripSearchDTO.endTime}");
		<c:forEach items="${businessTripSearchDTO.payment}" var="payment">
			inputData('[name=payment]',"${payment}");
		</c:forEach> 
		//alert("${businessTripSearchDTO.rowCntPerPage}");
});

	
	
	function goSearch(){
		//var keyword = '';
		var  keyword = $("#searchKeyword").val();
		var  searchKey = $("#selectSearch").val();
		var  outsideTime = $("#datepicker3").val();
		var  comebackTime = $("#datepicker4").val();
		/*
		if($("#selectBox").val()=="Y"){
			 keyword = $("#selectBox").val();
		}else if($("#selectBox").val()=="W"){
			keyword = $("#selectBox").val();
		}else if($("#selectBox").val()=="N"){
			keyword = $("#selectBox").val();
		}else{
			 keyword = $("#searchKeyword").val();
		}*/
		/* alert($("#selectBox").val()); */
		
		$("#searchKey").val(searchKey);
		$("#keyword").val(keyword);
		$("#startTime").val(outsideTime);
		$("#endTime").val(comebackTime);
		
		//$("#searchForm").submit()
		
		alert($('[name=getBusinessTripListSearchForm]').serialize());
		//return;

		document.getBusinessTripListSearchForm.submit();
	}
	function goAllSearch(){
		document.getBusinessTripListSearchForm.reset();
		//$("#searchForm").submit()
		$('[name=getBusinessTripListSearchForm] [name=rowCntPerPage]').val('10');
		$('[name=getBusinessTripListSearchForm] [name=selectPageNo]').val('1');
		$('[name=getBusinessTripListSearchForm] [name=sort]').val("outside_start_time desc");
		goSearch();
	}
	
	function goBusinessTripForm(){
		location.replace("/group4erp/businessTripForm.do");
	}

	function goBusinessTripContentsForm(work_outside_seq){
		var str = "work_outside_seq="+work_outside_seq+"&"+$('[name=getBusinessTripListSearchForm]').serialize();
		location.replace("/group4erp/businessTripContentsForm.do?"+str )
	}
/* 
	$(function(){
		$('#selectSearch').change(function(){
	        if( $('#selectSearch').val() =='travel_payment' ){
	        	$('#layer').show();
		       	$('#searchText').hide();
	        }
	        else if( $('#selectSearch').val() !='travel_payment' ){
		       	$('#searchText').show();
	        	$('#layer').hide();
	        } else{
	        	alert(4);
	        	$('#selectBox').hide();
	
	        }
	    });
	}); */
</script>

</head>
<body>
<center>
	<h1>[출장 리스트]</h1>
	<form name="getBusinessTripListSearchForm" method="post" action="/group4erp/businessTripList.do">
		
     <table class="searchTb tab" border="0" cellpadding="5">
     	<tr>
     		<td>[일자별]</td>
     		<td align="left">
				<input type="text" id="datepicker3" readonly>일 부터 <input type="text" id="datepicker4" readonly>일 까지
				&nbsp;&nbsp;&nbsp;
			</td>
     	</tr>
     	<tr>
     		<td>[결재상태별]</td>
     		<td align="left">
     			<input type="checkbox" name='payment' class="payment" value="Y">승인
         		<input type="checkbox" name='payment' class="payment" value="W">대기중
         		<input type="checkbox" name='payment' class="payment" value="N">반려
     		</td>
     	</tr>
     	<tr>
     		<td>[검색조건]</td>
     		<td align="left">
     					<select id = "selectSearch">
					<option>------</option>
					<option value="emp_name">성명</option>
					<option value="dep_name">부서</option>
					<option value="outside_start_time">출발 날짜</option>
					<option value="outside_end_time">복귀 날짜</option>
					<option value="travel_payment">결제 여부</option>
				</select>
				
				<span id="searchText">
					<input type="text" id="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();">		
				
&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goAllSearch();">
				</span>
     		
     		</td>
     	</tr>
     </table>   

				
				<!-- 
				<span id="layer" style="display:none">
					<select id="selectBox" name="selectBox">
						<option value="" selected="selected"></option>
						<option value="Y">승인</option>
						<option value="W">대기중</option>
						<option value="N">반려</option>	
					</select>
				</span> 
				 -->
				
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총 개수] : ${businessTripListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value=10>10</option>
	               <option value=15>15</option>
	               <option value=20>20</option>
	               <option value=25>25</option>
	               <option value=30>30</option>
	            </select> 행보기
      </table>
     
        <input type="hidden" name="searchKey" id="searchKey" >
		<input type="hidden" name="keyword" id="keyword">
		<input type="hidden" name="selectPageNo"> 
        <input type="hidden" name="startTime" id="startTime">
        <input type="hidden" name="endTime" id="endTime">
        <input type="hidden" name="sort" id="sort">
       <!--  <input type="text" name="payment" id="payment"> -->
        <!-- <input type="hidden" name="work_outside_seq" id="work_outside_seq"> -->
        
	</form>
	<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	
	<div id="blankArea"><br></div>
		<table class="businessTripListTable tab" name="businessTripListTable" cellpadding="5" cellspacing="5">		
			<thead>
				<tr>
					<th>번호</th>
					<th>성명</th>
					<th>직급</th>
					<th>부서명</th>
					<c:choose>
						<c:when test="${param.sort=='7 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('7 asc'); goSearch();">▼출발 날짜</th>
						</c:when>
						<c:when test="${param.sort=='7 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('7 desc'); goSearch();">▲출발 날짜</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('7 asc'); goSearch();">출발 날짜</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='8 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('8 asc'); goSearch();">▼복귀 예정 날짜</th>
						</c:when>
						<c:when test="${param.sort=='8 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('8 desc'); goSearch()">▲복귀 예정 날짜</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('8 asc'); goSearch();">복귀 예정 날짜</th>
						</c:otherwise>
					</c:choose>
					
					<th>담당자</th>
					
					<th>결재</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${businessTripList}" var="businessList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="goBusinessTripContentsForm(${businessList.work_outside_seq});">
					<%-- <td align=center>${businessList.RNUM}</td>	 --%>
					<td align=center>${businessTripListAllCnt - businessList.RNUM + 1}</td>	
					<td align=center>
						${businessList.emp_name}
						<%-- <a href="javascript:alert('${businessList.work_outside_seq}')"> 
							<c:out value="${businessList.emp_name}"/>
						</a> --%>
					</td>
					<td align=center>${businessList.jikup}</td>
					<td align=center>${businessList.dep_name}</td>
					<td align=center>${businessList.outside_start_time}</td>
					<td align=center>${businessList.outside_end_time}</td>
					<td align=center>
						<c:choose>
							<c:when test="${businessList.mgr_name ne ' '}">
								${businessList.mgr_name}
							</c:when>
							<c:otherwise>
									-
							</c:otherwise>				
						</c:choose>
					</td>
					<td>
					<c:choose>
							<c:when test="${businessList.travel_payment eq 'Y'}">
								승인
							</c:when>
							<c:when test="${businessList.travel_payment eq 'N'}">
								반려
							</c:when>
							<c:otherwise>
								대기중
							</c:otherwise>				
						</c:choose>
					</td>
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="출장 신청" onClick="goBusinessTripForm();">	
		<br><br>
		
		
<c:if test=" ${boardListAllCnt==0}">
   		검색 결과가 없습니다
   		
</c:if>

</center>

</body>
</html>