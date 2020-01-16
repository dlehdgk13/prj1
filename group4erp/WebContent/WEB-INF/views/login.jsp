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
body{
  background: #34495F;
  color:white;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  /* background-image: radial-gradient(circle at 0% 0%, #373b52, #252736 51%, #1d1e26); */
}
.input { border-style: none; background: transparent; outline: none; }
button { padding: 0; background: none; border: none; outline: none; }
/* $input-background: rgba(57, 63, 84, 0.8); */
$input-background: rgba(0, 0, 0, 0.8);
$input-text-inactive: #7881A1;
$input-text-active: white;/* #BFD2FF; */ 

.webflow-style-input {
  position: relative;
  display: flex;
  flex-direction: row;
  width: 100%;
  max-width: 400px;
  margin: 0 auto;
  border-radius: 2px;
  padding: 1.4rem 2rem 1.6rem;
  background: $input-background;
  &:after {
    content: "";
    position: absolute;
    left: 0px;
    right: 0px;
    bottom: 0px;
    z-index: 999;
    height: 1.5px;
    border-bottom-left-radius: 2px;
    border-bottom-right-radius: 2px;
    background-position: 0% 0%;
    background: linear-gradient(to right, #B294FF, #57E6E6, #FEFFB8, #57E6E6, #B294FF, #57E6E6);
    background-size: 500% auto;
    animation: gradient 3s linear infinite;
  }
}

.webflow-style-input input {
  flex-grow: 1;
  color: $input-text-active;
  font-size: 12pt;
  line-height: 2rem;
  vertical-align: middle;
  &::-webkit-input-placeholder {
    color:white; /* $input-text-inactive; */
  }
}

/* .webflow-style-input button {
  color:  $input-text-inactive;
  font-size: 12pt;
  line-height: 2.4rem;
  vertical-align: middle;
  transition: color .25s;
  &:hover {
    color: $input-text-active;
  }
} */
.button {
    width:15%;
    height:35%;
    /* background-color: #F0C40F; */
    background-color: white;
    border: 1px;
    /* color:#fff; */
    /* color: gray; */
    color: black;
    padding: 1px 0;
    text-align: center;
    vertical-align: text-top;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 5;
    line-height:2.5;
    cursor: pointer;
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
   
   $('a').click(function(){
      
      $(".checkID").show( 1000 );
      
      x = event.clientX+10;
      y = event.clientY+10;
      
      $(".checkID").css(
         {"top":y,"left":x}
      );
      
      
   });
   
   
   $('[name=searchbtu]').click(function(){
      
      $(".checkID").hide();
      
      alert("승인 여부 구현중");
      //return;
      
      $.ajax({
         
         url : "/group4erp/checkApprovalProc.do"
         , type : "post"
         , data : $('[name=checkIDProc1]').serialize()
         , success : function(check){
            if(check.checkApproval=='미승인'){
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
   
</script>
<!-- style="display:none" -->
</head>
<body>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a><img src="/group4erp/resources/image/paper.png" width="2.5%" height="5%" style="cursor:pointer;"><br>신입사원 승인 여부 확인하기</a></div>
<!--<a style="cursor:pointer;">[승인 여부]</a> <div align="left"><a><img src="/group4erp/resources/image/paper.png" width="3%" height="6%" style="cursor:pointer;"><br>[신입사원 승인 여부 확인하기]</a></div> -->
<center>
<form name="login_form" method="post" action="/group4erp/loginProc.do">
   <table width="90%">
      <tr>
         <td>
            <center><img src="/group4erp/resources/image/IZ books logo.png" align="center" height="29%"></center><!-- width="30%" -->
            <center><b style="font-size:15pt; color:lightgray;">전사적자원관리시스템</b></center>
         </td>

      <tr>
         <td>
            <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
            <br><br><br><br>
            <!-- <div align="center"><a><img src="/group4erp/resources/image/paper.png" width="3%" height="5%" style="cursor:pointer;"><br>신입사원 승인 여부 확인하기</a></div> -->
<!--             <div align="left"><a><img src="/group4erp/resources/image/paper.png" width="5%" height="7%" style="cursor:pointer;"><br><font style="color:pink;">신입사원 승인 여부 확인하기</font></a></div> -->
            <br><br>
            <table align="center" class="tab" width="30%" border="1" cellpadding=5 cellspacing=5> <!-- width="20%" -->
               <tr>
                  <td width="20%"><img src="/group4erp/resources/image/user.png" height="7%"><!-- <font style="font-size:15pt;">사원번호</font> --></td>
                  <td>
                     <div class="webflow-style-input">
                     <input type="text" name="emp_id" size="32%" class="input" placeholder="사원번호를 입력해주세요.">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td><img src="/group4erp/resources/image/password.png" height="7%"><!-- <font style="font-size:15pt;">비밀번호</font> --></td>
                  <td>
                     <div class="webflow-style-input">
                     <input type="password" name="emp_pwd" class="input" placeholder="비밀번호를 입력해주세요.">
                     </div>
                  </td>
               </tr>   
            </table>
            <br><br>
            <center>
            <input type="button" value="로그인" name="loginBtn" class="button" style=" vertical-align:top;" onClick="checkLoginInfo();">
            <input type="button" value="신규사원등록" class="button" style=" vertical-align:top;" onClick="insertNewEmp();">
            <br><br>
            
            </center>
         </td>
   </table>
</form>


<div class="checkID" >
   <form name="checkIDProc1">
   <table>
      <tr>
         <th>주민등록번호<td><input type="text" name="jumin_num" size="20">
   </table>
   <!-- onclick="goCheckApproval();" -->
   <input type="button" value="검색" name="searchbtu" >&nbsp;
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

<!-- <input type="button" name="joinBtn" value="사원등록" onClick="joinMembership();">&nbsp;
<input type="button" name="deleteBtn" value="사원삭제" onClick="deleteMembership();"> -->
<!-- <input type="button" name="checkIDbtu" value="승인여부"> -->
<br>
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