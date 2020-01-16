<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.checkID{
	background-color:#D4D4D4;
	position:absolute;
}
.aprroval{
	background-color:#D4D4D4;
	position:absolute;
}
.noAprroval{
	background-color:#D4D4D4;
	position:absolute;
}
.noneAprroval{
	background-color:#D4D4D4;
	position:absolute;
}
</style>
<title>YES4조 전사적자원관리 시스템 </title>
<script>
var x = 0;
var y = 0;

$(document).ready( function() {
	
	$(".checkID").hide();
	$(".aprroval").hide();
	$(".noAprroval").hide();
	$(".noneAprroval").hide();
	
	$('a').click(function(){
		
		$(".checkID").show( 1000 );
		
		x = event.clientX+10;
		y = event.clientY+10;
		
		$(".checkID").css(
			{"top":y,"left":x}
		);
		
		
	});
	
	/*
	$('[name=searchbtu]').click(function(){
		
		$(".checkID").hide();
		
		alert("승인 여부 구현중");
		//return;
		
		$.ajax({
			
			url : "/group4erp/checkApprovalProc.do"
			, type : "post"
			, data : $('[name=checkIDProc1]').serialize()
			, success : function(check){
				if(check.worktime_cd==6){
					$(".noAprroval").show( 1000 );
					$(".noAprroval").css( {"top":y,"left":x} );
				}else{
					$('#approvalID td:eq(0)').text(check.emp_no);
					$('#approvalID td:eq(1)').text(check.emp_pwd);
					
					$(".aprroval").show( 1000 );
					$(".aprroval").css( {"top":y,"left":x} );
				}
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
		
		
	});
	*/
});

	function checkLoginInfo() {
		$.ajax({
			
			url : "/group4erp/loginProc.do"
			, type : "post"
			, data : $('[name=login_form]').serialize()
			, success : function(loginCnt){
				
				if(loginCnt==1){
					//alert("회원 로그인 성공!");
					location.replace("/group4erp/goMainPage.do");
				}
				else if(loginCnt==-1){
					alert("일치하는 아이디가 없습니다.");
				}
				else if(loginCnt==-2){
					alert("비밀번호가 일치하지 않습니다.");
				}	
				else{
					alert("회원 로그인 실패! 관리자에게 문의 바람.");
				}
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
				
		
	}

	/*function joinMembership(){
		location.replace("/group4erp/joininsert.do");
	}
	
	function deleteMembership(){
		location.replace("/group4erp/godelete.do");
	}*/


	function goCEOLogin(str){
		
		$('[name=emp_pwd]').val(1111);
		
		if( str=='대표이사' ){
			$('[name=emp_id]').val(100001);
			checkLoginInfo();
		}
		if( str=='기획부장' ){
			$('[name=emp_id]').val(200003);
			checkLoginInfo();
		}
		if( str=='영업부장' ){
			$('[name=emp_id]').val(300004);
			checkLoginInfo();
		}
		if( str=='마케팅부장' ){
			$('[name=emp_id]').val(400005);
			checkLoginInfo();
		}
		if( str=='사업부장' ){
			$('[name=emp_id]').val(500003);
			checkLoginInfo();
		}
		if( str=='인사부장' ){
			$('[name=emp_id]').val(600001);
			checkLoginInfo();
		}
	}

	
	function goCheckApproval(){
		$(".checkID").hide();
		
		alert("승인 여부 구현중");
		//return;
		
		$.ajax({
			
			url : "/group4erp/checkApprovalProc.do"
			, type : "post"
			, data : $('[name=checkIDProc1]').serialize()
			, success : function(check){
				if(check.worktime_cd==6){
					$(".noAprroval").show( 1000 );
					$(".noAprroval").css( {"top":y,"left":x} );
				}else if(check.worktime_cd==null){
					$(".noneAprroval").show( 1000 );
					$(".noneAprroval").css( {"top":y,"left":x} );
				}
				else {
					$('#approvalID td:eq(0)').text(check.emp_no);
					$('#approvalID td:eq(1)').text(check.emp_pwd);
					
					$(".aprroval").show( 1000 );
					$(".aprroval").css( {"top":y,"left":x} );
				}
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
	}
	
	function insertNewEmp() {
		//alert("신규 사원 추가 기능 구현");
		location.href="/group4erp/viewNewEmpJoin.do"
	}

	
	function goClose1(){
		$(".checkID").hide(1000);
	}
	function goClose2(){
		$(".aprroval").hide(1000);
	}
	function goClose3(){
		$(".noAprroval").hide(1000);
	}
	function goClose4(){
		$(".noneAprroval").hide(1000);
	}
	
	function goClient(){
		location.href="/group4erp/goClientLogin.do";
	}
	
</script>
<!-- style="display:none" -->
</head>
<body>
<center><br>
<form name="login_form" method="post" action="/group4erp/loginProc.do">
	<b>IZ Books.co 전사적자원관리시스템</b><br><br><br><br>
	<table class="tab" cellpadding=5 cellspacing=5>
		<tr>
			<td>사원번호</td><td><input type="text" name="emp_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="emp_pwd"></td>
		</tr>	
	</table>
</form>

<div class="checkID" >
	<form name="checkIDProc1">
	<table>
		<tr>
			<th>주민등록번호<td><input type="text" name="jumin_num" size="20">
	</table>
	<!-- onclick="goCheckApproval();" -->
	<input type="button" value="검색" name="searchbtu" onclick="goCheckApproval();">&nbsp;
	<input type="button" value="닫기" onclick="goClose1();">
	</form>
</div>

<div class="aprroval" >
	<form name="checkIDProc2">
	<table id="approvalID">
		<tr>
			<th>사번 :<td>
		<tr>
			<th>비밀번호 :<td>
	</table>
	<input type="button" value="닫기" onclick="goClose2();">
	</form>
</div>
<div class="noAprroval" >
	<form name="checkIDProc3">
	<table id="noApprovalID">
		<tr>
			<th>승인되지 않은 주민등록번호 입니다!
	</table>
	<input type="button" value="닫기" onclick="goClose3();">
	</form>
</div>
<div class="noneAprroval" >
	<form name="checkIDProc4">
	<table id="noneApprovalID">
		<tr>
			<th>등록되지 않은 주민등록번호 입니다!
	</table>
	<input type="button" value="닫기" onclick="goClose4();">
	</form>
</div>

<input type="button" name="loginBtn" value="로그인" onClick="checkLoginInfo();">&nbsp;
<input type="button" value="신규사원등록" onClick="insertNewEmp();">
<!-- <input type="button" name="joinBtn" value="사원등록" onClick="joinMembership();">&nbsp;
<input type="button" name="deleteBtn" value="사원삭제" onClick="deleteMembership();"> -->
<!-- <input type="button" name="checkIDbtu" value="승인여부"> -->
<a style="cursor:pointer;">[승인 여부]</a>
<br>
<br>
<br>

<tr><input type="button" value="고객주문페이지" onclick="goClient();">

<br>
<br>
<br>
<br>
<br>
<br>
<input type="button" value="대표이사" name="easyLogin" onclick="goCEOLogin('대표이사');">&nbsp;
<input type="button" value="기획부장" name="easyLogin" onclick="goCEOLogin('기획부장');">&nbsp;
<input type="button" value="영업부장" name="easyLogin" onclick="goCEOLogin('영업부장');">&nbsp;
<input type="button" value="마케팅부장" name="easyLogin" onclick="goCEOLogin('마케팅부장');">&nbsp;
<input type="button" value="사업부장" name="easyLogin" onclick="goCEOLogin('사업부장');">&nbsp;
<input type="button" value="인사부장" name="easyLogin" onclick="goCEOLogin('인사부장');">&nbsp;

</body>
</html>