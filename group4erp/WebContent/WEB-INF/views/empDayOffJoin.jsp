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
<title>휴가 신청 </title>

<style>
.tbcss1, .tbcss1 th,.tbcss1 td{ 
         border-collapse: collapse;
         border:1px solid #A2A2A2; 
         padding: 5;
         font-size: 9pt;
         font-family: tahoma, 굴림, 돋움, verdana
}
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

	getMonth();
	getYearMonth();

	
	
	$('[name=dayoff_cd]').change(function(){
		var dayval = $('[name=dayoff_cd]').val();

		if(dayval==05){
			
			$('[name=empDayOffJoinForm] td:eq(1)').children().hide()
			
			$('[name=empDayOffJoinForm] td:eq(1) #start_dayoff').show()
			
			$("[name=end_dayoff]").val('');
			
			/*
			 $("#start_dayoff").datepicker({ 
		         dateFormat: 'yy-mm-dd'
		        ,defaultDate : 'today'
		        ,minDate : 'today'
		        
		        ,onClose: function( selectedDate ) {   
		         //$("#dateTill").datepicker({minDate:selectedDate});
		           $("#end_dayoff").datepicker( "option", "minDate", selectedDate );
			      } 
				 
				,beforeShowDay:$.datepicker.noWeekends 
			});
			*/
		}else{
			
			$('[name=empDayOffJoinForm] td:eq(1)').children().show()
			
		}
		
	});
	
	 
	
	
	
	
	
	
	
	 $("#start_dayoff").datepicker({ 
	         dateFormat: 'yy-mm-dd'
	        ,defaultDate : 'today'
	        ,minDate : 'today'
	        ,onClose: function( selectedDate ) {   
	         //$("#dateTill").datepicker({minDate:selectedDate});
	           $("#end_dayoff").datepicker( "option", "minDate", selectedDate );
	      }       
	      ,onSelect: function() { 
	         var dateObject = $(this).datepicker('getDate');
	         dateS = $("[name=start_dayoff]").val();
	         dateE = $("[name=end_dayoff]").val();
	         remainD = $("[name=remain_dayoff]").val();
	         var dayval = $('[name=dayoff_cd]').val();
	           
	         var realDy = finalDayoff(dateS, dateE); 
	         //alert("realDy => "+realDy);

	         if(dayval==3 || dayval==4 || dayval==6){
	        	 $("[name=using_dayoff]").val(realDy);
	     		return;
	     	}
	         
	         if(realDy > remainD){
	            alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
	            return;
	         }
	         if(realDy > 5){
	            alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
	            return;
	         } 
	
	         $("[name=using_dayoff]").val(realDy);
	         //alert("updatedata => " + updatedata);
	       }
	       ,beforeShowDay:$.datepicker.noWeekends 
		});

		$("#end_dayoff").datepicker({ 
	        dateFormat: 'yy-mm-dd'
	        ,defaultDate : 'today'
	        ,minDate : 'today'
	        /*,onClose: function( selectedDate ) {
	             //$("#dateFrom").datepicker({maxDate:selectedDate});
	            $("#start_dayoff").datepicker( "option", "minDate", selectedDate );
	         }*/
	      	,onSelect: function() { 
	           var dateObject = $(this).datepicker('getDate');
	         dateS = $("[name=start_dayoff]").val();
	         dateE = $("[name=end_dayoff]").val();
	         remainD = $("[name=remain_dayoff]").val();
	         var dayval = $('[name=dayoff_cd]').val();
	           
	         var realDy = finalDayoff(dateS, dateE); 
	         //alert("realDy => "+realDy);
	         
	         if(dayval==3 || dayval==4 || dayval==6){
	        	 $("[name=using_dayoff]").val(realDy);
	     		return;
	     	}
	         
	          if(realDy > remainD){
	            alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
	            $("[name=end_dayoff]").val("");
	            return;
	         }
	         if(realDy > 5){
	            alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
	            $("[name=end_dayoff]").val("");
	            return;
	         } 
	
	         $("[name=using_dayoff]").val(realDy);
	         //alert("updatedata => " + updatedata);
	           //alert($(this).val()); 
	       } 
	       ,beforeShowDay:$.datepicker.noWeekends

		});
	
});

	function empDayOffJoin(){
		
		//alert(realDy);
		//alert($('[name=empDayOffJoinForm]').serialize());
		//alert("휴가 신청 기능 구현중");
		
		//alert($('[name=empDayOffJoinForm]').serialize());
		//return;

		//날짜 차이 구하기
		/*
		var strDate1 = $('[name=start_dayoff]').val();
		var strDate2 = $('[name=end_dayoff]').val();
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var startDay = new Date(arr1[0], arr1[1], arr1[2]);
		var endDay = new Date(arr2[0], arr2[1], arr2[2]);

		
		var diff = endDay - startDay;
		var currDay = 24 * 60 * 60 * 1000;

		var usingDay = parseInt(diff/currDay);
		
		$('[name=using_dayoff]').val(usingDay+1);
		*/
		
		if( $('[name=dayoff_cd]').val()==05 ){
			$('#end_dayoff').val($('#start_dayoff').val());
			$('[name=using_dayoff]').val(1);
			$('[name=harf_dayoff]').val(0.5);
		}
		
		if( $('[name=harf_dayoff]').val()==null || $('[name=harf_dayoff]').val().length<=0 ){
			$('[name=harf_dayoff]').val(1);
		}
		
		/*
		alert($('[name=empDayOffJoinForm]').serialize());
		return;
		*/
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goDayOffProc.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=empDayOffJoinForm]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					alert("휴가 신청 성공");
					location.replace("/group4erp/viewEmpDayOffList.do")
				}else if(insertCnt==0){
					alert("휴가 신청 실패");
				}else if(insertCnt==-2){
					alert("휴가 정보 수정 실패");
				}else if(insertCnt==-3){
					alert("중복 신청 금지! 휴가는 한달에 한번만 나갈수 있습니다");
				}else alert("서버 오류!");
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
		
	}


	var cd = null;
	var dateS = null;
	var dateE = null;
	var empNo = null;
	var remainD = null;
	var realDy = null;
	var updatedata = null;

	var holidays = [
	   [2020,01,01,'신정'],
	      [2020,1,24,'설날휴일'],
	      [2020,1,25,'설날'],
	      [2020,1,26,'설날휴일'],
	      [2020,1,27,'대체휴일'],
	      [2020,3,1,'3.1절'],
	      [2020,4,15,'국회의원선거'],
	      [2020,4,30,'부처님오신날'],
	      [2020,5,5,'어린이날'],
	      [2020,6,6,'현충일'],
	      [2020,8,15,'광복절'],
	      [2020,9,30,'추석연휴'],
	      [2020,10,1,'추석'],
	      [2020,10,2,'추석연휴'],
	      [2020,10,3,'개천절'],
	      [2020,10,9,'한글날'],
	      [2020,12,25,'크리스마스']
	]

	function dateObj(date){
	   var dyarr = [];
	   for( var i=0; i<date.length; i++ ){
	      var pushdy = new Date(date[i][0],date[i][1]-1,date[i][2]);
	      dyarr.push(pushdy);
	   }

	   if(dyarr.length > 0){
	      return dyarr;
	   }
	   else{
	      alert('데이터가 날짜로 변경되지 않았습니다.');
	      return;
	   }
	}

	function finalDayoff(dateS, dateE){
	   //alert("remainD => " + remainD);
	        var cnt = 0;
	        var arrS = dateS.split("-");
	        var arrE = dateE.split("-");
	        var startD = new Date(arrS[0], arrS[1]-1, arrS[2]);
	        var endD = new Date(arrE[0], arrE[1]-1, arrE[2]);
	        var count = (endD.getTime() - startD.getTime())/1000/(60*60*24);

	        var hldys = dateObj(holidays);
	        //alert((parseInt(arrS[2],10)+1));
	        
	        var applyhldys = [];
	        
	      for(var i=0; i <= count; i++){
	         applyhldys.push(new Date(arrS[0],arrS[1]-1,(parseInt(arrS[2],10))+i));
	      if( (applyhldys[i].getDay() == 0) || (applyhldys[i].getDay() == 6) ){
	         cnt++;
	         //alert( applyhldys[i] + " || " + applyhldys[i].getDay());
	      }
	      else{
	         for(var k=0; k < hldys.length; k++){
	            if( (applyhldys[i].getTime() == hldys[k].getTime()) ){
	               cnt++;
	               //alert( "This is hldys[k]" + hldys[k]);
	            }
	         }
	      }

	         
	            //alert( applyhldys[i] );

	       } 
	       //alert("This is cnt =>" + cnt);
	       realDy = count-cnt+1;
	       //alert("This is realDy =>" + realDy);
	       return realDy;
	}
	
	function getYearMonth(){
		var today = new Date();

		var YearM = "1. " + today.getFullYear() + "년 " + (today.getMonth()+1) + "월 휴가 신청 입니다";

		document.getElementById('YM').innerHTML=YearM;
		
		//return document.getElementById('YM').innerHTML=YearM;
	}
	
	function getMonth(){
		var today = new Date();
		
		var notMonth = today.getMonth()+1;
		
		if(notMonth<10){
			realMonth = "0"+notMonth;
		}
		
		var month = "[" + realMonth + "월 휴가 신청]";
		
		document.getElementById('M').innerHTML=month;
	}
	
	function goAllReset(){
		$('[name=empDayOffJoinForm] td:eq(1)').children().show()
		document.empDayOffJoinForm.reset();
	}

	function goAllSerach(){
		document.empDayOffJoinForm.reset();
		document.empDayOffJoinForm.submit();
	}
	
</script>

</head>
<body>
<cneter>

<b><span id="M"> </span></b>
	<br>
	<table name="noticeTable">
		<tr>
			<td><span id="YM"> </span>
		<tr>
			<td>2. 올해 ${emp_name}님의 남은 연가는 ${remain.remain_dayoff}일 입니다.
		<tr>
			<td>3. 이번달 휴가 신청자는 ${empDayoffTot}명 입니다.(휴가자 포함)
		<tr>
			<td>4. 한달에 나갈수 있는 휴가 일수는 4일이 최대이며
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;4일 초과시 부서장의 승인이 있어야합니다.
	</table>
	<br>
<form name="empDayOffJoinForm" method="post" action="/group4erp/empDayOffJoinProc.do">
	<input type="hidden" name="emp_no" class="emp_no" value='${emp_nos}'>
	<table cellpadding=5 class="tbcss1">
		<tr>
			<th bgcolor=#DBDBDB>휴가 종류
			<td>
				<select name="dayoff_cd">
					<option value="">---------
					<option value="01">연차
					<option value="02">월차
					<option value="03">생리
					<option value="04">출산
					<option value="05">반차
					<option value="06">보상
		<tr>
		<th bgcolor=#DBDBDB >휴가 기간
			<td>
				<input type="text" id="start_dayoff" name="start_dayoff" size="20" maxlength=20>&nbsp;<font> ~ </font>&nbsp;
				<input type="text" id="end_dayoff" name="end_dayoff" size="20" maxlength=20>
				<input type="hidden" name="using_dayoff" class="using_dayoff">
				<input type="hidden" name="remain_dayoff" class="remain_dayoff" value="${remain.remain_dayoff}">
				<input type="hidden" name="harf_dayoff" >
	</table>
</form>

	<input type="button" value=" 신청 " onclick="empDayOffJoin();">&nbsp;&nbsp;
	<input type="button" value=" 모두검색 " onclick="goAllSerach();">&nbsp;&nbsp;
	<input type="button" value="초기화" onclick="goAllReset();">



</body>
</html>