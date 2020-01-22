<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출장 신청 결재</title>

<script>

	function responseBTripApproval() {
		//alert("결재 시작");
		
		var approvalYn = $(".BTripApprovalDoc").find("[name=approvalYn]:checked").val();
		var e_work_comment = $(".BTripApprovalDoc [name=documentTable]").find("[name=e_work_comment]").val();
		
		
		if( (approvalYn==6) && (e_work_comment=="") ){
			alert("반려 시 사유를 기입해주세요.");

			return;		
		}
	
		$.ajax({
			url : "/group4erp/updateBTripApprovalProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('.BTripApprovalDoc').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정	
			success : function(upCnt) {
				if(upCnt==1) {
					alert("출장 결재 성공!");
				
					location.replace("/group4erp/viewApprovalList.do");
				} else if(delCnt==0) {	
					alert("출장 결재 로직 실패!");
				
				location.replace("/group4erp/viewApprovalList.do");

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
	<form class="BTripApprovalDoc" method="post">
		<table cellpadding="5" cellspacing="5" width="700" align="center">
		
		<tr>
			<td align="right" ><table name="jikup" border="1" cellpadding="5" cellspacing="0"><tr><td width="90" align="center">기안자 </td><td  width="90" align="center">부서장</td><td width="90" align="center">대표이사 </td> </tr>
														<tr><td align="center">${myBTripApplyInfo.emp_name} </td><td align="center">
																											<% String mgr_no = (String)session.getAttribute("mgr_emp_no"); 
																													String emp = (String)session.getAttribute("emp_id");
																													System.out.println("mgr_no==="+mgr_no);
																													String ceo_no = (String)session.getAttribute("ceo_no");
																													System.out.println("ceo_no==="+ceo_no);
																												if(mgr_no != null) { %>
																													<input type="radio" name="approvalYn" value="7">승인 &nbsp;
																													<input type="radio" name="approvalYn" value="6">반려 &nbsp;
																													<input type="hidden" name="mgr_emp" value='<%=emp %>'>
																												<% } else if(mgr_no==null && ceo_no!=null) { %>
																													
																													
																													<label>${myDayOffApplyInfo.mgr_name}</label>
																												
																												<% } %>
														
																											</td>
																											
																											
																											<td>
																												<% if(mgr_no == null) { %>
																											
																													<input type="radio" name="approvalYn" value="5">승인 &nbsp;
																													<input type="radio" name="approvalYn" value="6">반려 &nbsp; 
																												<% } %>
																											</td></tr></table>											
		</tr>
			
		<tr>
			<table class="documentTable tab" name="documentTable" cellpadding=5" cellspacing="5" width="600">		
				<tr>
					<td width="100">신청번호</td><td colspan="3">${myBTripApplyInfo.work_outside_seq}
															<input type="hidden" name="document_no" value="${myBTripApplyInfo.work_outside_seq}">
					</td>
				</tr>
				<tr>
					<td width="100">기안자</td><td widht="200">직급 : ${myBTripApplyInfo.jikup}&nbsp;  </td><td width="200" >성명 : ${myBTripApplyInfo.emp_name}  </td>
				</tr>
				<!-- <tr>
					<td width="100">신청 휴가</td ><td colspan="3">${myDayOffApplyInfo.dayoff_category}</td>
				</tr>	 -->		
				<tr>
					<td>출장 기간</td><td colspan="2">${myBTripApplyInfo.outside_start_time} ~ ${myBTripApplyInfo.outside_end_time} </td>
				</tr>
				<tr>
					<td>목적지</td><td colspan="2">${myBTripApplyInfo.destination}</td>
				</tr>
				<tr>
					<td>사유</td><td colspan="2">${myBTripApplyInfo.work_outside_reason}</td>
				</tr>
				<tr>
					<td width="100">메모</td><td colspan="3"><textarea name="e_work_comment" cols="40" rows="10" placeholder="반려할 시 사유를 기입해주세요."></textarea></td>
				</tr>	
			</table><br>
			<h4>위와 같이 출장을 신청하오니 검토 부탁드립니다.</h4>	
			<input type="button" value="결재" onClick="responseBTripApproval();"> &nbsp;
			<input type="reset" value="초기화">
		</tr>	
	</table><br>
	

	</form>
	
</center>

</body>
</html>