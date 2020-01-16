<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>책 등록 화면</title>
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
	
	$("#datepicker").datepicker({
		dateFormat: 'yy-mm-dd'
	    ,onSelect: function() { 
	    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
	        var dateObject = $(this).datepicker('getDate');

	    }
	});
	
});

	function bookSignUp(){
		//alert("등록 기능 구현중");
		//alert($('[name=newSignUpBookProc]').serialize());
		
		if( is_empty('[name=isbn13]') ){
			alert("책 번호를 입력해주세요.");
			$("[name=isbn13]").focus();
			return;
		}
		if( is_empty('[name=book_name]') ){
			alert("책 제목을 입력해주세요.");
			$("[name=book_name]").focus();
			return;
		}
		if( is_empty('[name=cat_cd]') ){
			alert("카테고리를 선택해주세요.");
			$("[name=cat_cd]").focus();
			return;
		}
		if( is_empty('[name=book_price]') ){
			alert("책 가격을 입력해주세요.");
			$("[name=book_price]").focus();
			return;
		}
		if( is_empty('[name=book_pages]') ){
			alert("페이지 수를 입력해주세요.");
			$("[name=book_pages]").focus();
			return;
		}
		if( is_empty('[name=writer]') ){
			alert("저자를 입력해주세요.");
			$("[name=writer]").focus();
			return;
		}
		if( is_empty('[name=publisher]') ){
			alert("출판사를 입력해주세요.");
			$("[name=publisher]").focus();
			return;
		}
		if( is_empty('[name=size_cd]') ){
			alert("판형을 선택해주세요.");
			$("[name=size_cd]").focus();
			return;
		}
		if( is_empty('[name=is_print]') ){
			alert("판매여부를 선택해주세요.");
			$("[name=is_print]").focus();
			return;
		}
		if( is_empty('[name=emp_name]') ){
			alert("도서 담당직원의 이름을 입력해주세요.");
			$("[name=emp_name]").focus();
			return;
		}
		if( is_empty('[name=datepicker]') ){
			alert("출판일을 입력해주세요.");
			$("[name=datepicker]").focus();
			return;
		}
		if( is_empty('[name=editor]') ){
			alert("출판사 담당직원 이름을 입력해주세요.");
			$("[name=editor]").focus();
			return;
		}
		
		var incomisbn13 = $('[name=isbn13]').val();
		if(incomisbn13.indexOf('-')>0){
			var isbn13 = incomisbn13.split('-').join('');
			$('[name=isbn13]').val(isbn13);
		}
		
		if( is_valid_pattern("[name=isbn13]", /^[0-9]{13}$/)==false ){
			alert("ISBN13의 형식이 틀렸습니다. 다시 입력해주세요");
			return;
		}
		
		var checkPirce = $('[name=book_price]').val();
		if(isNaN(checkPirce)==true){
			alert("책 가격은 숫자만 기입해주세요");
			return;
		}
		
		var checkPages = $('[name=book_pages]').val();
		if(isNaN(checkPages)==true){
			alert("페이지 수는 숫자만 기입해주세요");
			return;
		}
		
		if(confirm("정말 저장하시겠습니까?")==false){return;}
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goSignUpBookProc.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=newSignUpBookProc]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					alert("책 등록 성공");
					location.replace("/group4erp/goBookList.do")
				}else if(insertCnt==0){
					alert("등록 실패");
				}else if(insertCnt==-2){
					alert("재고 등록 실패");
				}else alert("서버 오류!");
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
	}
	
	function goBack(){
		history.go(-1);
	}

</script>

</head>
<body>
<cneter>
	<b>[서적 등록]</b>
   <form name="newSignUpBookProc" method="post" action="/group4erp/goSignUpBookProc.do">
         <table cellpadding=5 class="tbcss1">
            <tr>
               <th bgcolor=#DBDBDB >ISBN13
               <td><input type="text" name="isbn13" class="isbn13" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >책 이름
               <td><input type="text" name="book_name" class="book_name" size="20" maxlength=50>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>카테고리
               <td><input type="radio" name="cat_cd" value="01">소설
                  <input type="radio" name="cat_cd" value="02">사회
                  <input type="radio" name="cat_cd" value="03">과학
                  <input type="radio" name="cat_cd" value="04">IT
                  <input type="radio" name="cat_cd" value="05">예술
                  <input type="radio" name="cat_cd" value="06">종교
                  <input type="radio" name="cat_cd" value="07">만화
                  <input type="radio" name="cat_cd" value="08">여행
                  <input type="radio" name="cat_cd" value="09">에세이
                  <input type="radio" name="cat_cd" value="10">요리
                  <input type="radio" name="cat_cd" value="11">수험서
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >가격
               <td><input type="text" name="book_price" class="book_price" size="20" maxlength=20>원
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >페이지 수
               <td><input type="text" name="book_pages" class="book_pages" size="20" maxlength=20>쪽
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >저자
               <td><input type="text" name="writer" class="writer" size="10" maxlength=30>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>출판사
               <td><input type="text" name="publisher">
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >판형
               <td><input type="radio" name="size_cd" value="01">신국판
                  <input type="radio" name="size_cd" value="02">국판
                  <input type="radio" name="size_cd" value="03">46판
                  <input type="radio" name="size_cd" value="04">46배판
                  <input type="radio" name="size_cd" value="05">크라운판
                  <input type="radio" name="size_cd" value="06">국배판
                  <input type="radio" name="size_cd" value="07">타블로이드
                  <input type="radio" name="size_cd" value="08">기타
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>판매여부
               <td><input type="radio" name="is_print" value='y'>판매
				   <input type="radio" name="is_print" value='n'>절판
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>담당 직원
               <td><input type="text" name="emp_name" class="emp_name" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>출간일
               <td><input type="text" id="datepicker" name="datepicker" size="15">
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>출판사 담당 직원
               <td><input type="text" name="editor" class="editor" size="10" maxlength=20>
            </tr>
         </table>
         <input type="button" value=" 등록 " onClick="bookSignUp();">&nbsp;
         <input type="button" value="초기화" onclick="reset();">
         <a href="javascript:goBack();">[뒤로 가기]</a>
         
   </form>



</body>
</html>