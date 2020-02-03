<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  
  
  
  function drawChart() {

    var data = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perBookCat}" var="bookcat" varStatus="loopTagStatus">
	  		,['${bookcat.cat_name}', ${bookcat.perNum}]
  	    </c:forEach>
    ]);
    var data2 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perCorpArea}" var="corparea" varStatus="loopTagStatus">
	  		,['${corparea.business_area_name}', ${corparea.perCorp}]
  	    </c:forEach>
    ]);
    var data3 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	,['온라인', ${perLine.on_line}]
    	,['오프라인', ${perLine.off_line}]
    ]);
    var data4 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	,['회원', ${perMember.memberY}]
    	,['비회원', ${perMember.memberN}]
    ]);
    var data5 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	,['비휴직', ${perLeave.leaveF}]
    	,['휴직', ${perLeave.leaveT}]
    ]);
    var data6 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perOnlineOrder}" var="onlineorder" varStatus="loopTagStatus">
  			,['${onlineorder.cat_name_online}', ${onlineorder.peronlineorder}]
	    </c:forEach>
    ]);
    
    var options = {
      title: '분야 별'
    };
    var options2 = {
      title: '거래처 분야 비율'
    };
    var options3 = {
      title: '온/오프라인 주문 비율'
    };
    var options4 = {
      title: '회원/비회원 주문 비율'
    };
    var options5 = {
      title: '휴직자 비율'
    };
    var options6 = {
      title: '온라인 주문 분야 비율'
    };
    
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
    var chart3 = new google.visualization.PieChart(document.getElementById('piechart3'));
    var chart4 = new google.visualization.PieChart(document.getElementById('piechart4'));
    var chart5 = new google.visualization.PieChart(document.getElementById('piechart5'));
    var chart6 = new google.visualization.PieChart(document.getElementById('piechart6'));
    
    chart.draw(data, options);
    chart2.draw(data2, options2);
    chart3.draw(data3, options3);
    chart4.draw(data4, options4);
    chart5.draw(data5, options5);
    chart6.draw(data6, options6);
  }
  
  
  
  /*
  ['Task', 'Hours per Day'],
  ['Work',     11],
  ['Eat',      2],
  ['Commute',  2],
  ['Watch TV', 2],
  ['Sleep',    7]
  */
  
  
</script>

</head>
<body>
<center>

<br>
<table>
<tr>
<td>
<div id="piechart" style="width: 900px; height: 500px;"></div>
<td>
<div id="piechart2" style="width: 900px; height: 500px;"></div>

<tr>
<td>
<div id="piechart3" style="width: 900px; height: 500px;"></div>
<td>
<div id="piechart4" style="width: 900px; height: 500px;"></div>

<tr>
<td colspan=2>
<div id="piechart5" style="width: 900px; height: 500px;"></div>
<tr>
<td>
<div id="piechart6" style="width: 900px; height: 500px;"></div>
</table>
<input type="button" name="joinBtn" value="저장" onClick="checkLoginInfo();">&nbsp;



</body>
</html>