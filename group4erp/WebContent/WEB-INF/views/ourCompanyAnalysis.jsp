<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<script src = "/www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 현황</title>
<script type="text/javascript">

	$(document).ready(function() {

		$("[name=category]").change(function() {
			var cnt = $(this).filter(":checked").length;
			var cat_cd ='';

			if(cnt==1) {
				//change 이벤트가 발생한 체크박스의 형제들의 체크를 모두 풀기
				$(this).siblings().prop("checked", false);
				cat_cd = $(this).filter(":checked").val();
				
				goSearch(cat_cd);
			} 
		});
	});
		

	google.charts.load('current', {'packages' : ['corechart'] } );

	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawBarChart);
	google.charts.setOnLoadCallback(drawEmployeeCntChart);
	google.charts.setOnLoadCallback(drawHireOrResignChart);
	google.charts.setOnLoadCallback(drawCategoryChart);
	google.charts.setOnLoadCallback(drawCatInventoryChart);
	
	
	function drawCatInventoryChart() {
		
		var catInventory_chart_data = google.visualization.arrayToDataTable(${catInventory_chart_data});
		var catInventory_chart_options = {
				title: '현재 도서 보유 현황',
				width :700, 
				height: 300,
				animation: { //차트가 뿌려질때 실행될 애니메이션 효과
	                 startup: true,
	                 duration: 1000,
	                 easing: 'linear' 
	            }
			};
		
		var catInventory_chart = new google.visualization.BarChart(document.getElementById('catInventoryChart'));
			
		catInventory_chart.draw(catInventory_chart_data, catInventory_chart_options);
	}


	function drawHireOrResignChart() {

		var hireOrResign_chart_data = google.visualization.arrayToDataTable(${empHireOrResign_data});
		var hireOrResign_chart_options = {
			title: '직원 변동 현황',
			width :700, 
			height: 300
		};

		var hireOrResign_chart = new google.visualization.LineChart(document.getElementById('empHireOrResignChart'));
		 						
		hireOrResign_chart.draw(hireOrResign_chart_data, hireOrResign_chart_options);

	}


	function drawEmployeeCntChart() {
		var employee_chart_data = google.visualization.arrayToDataTable(${employee_chart_data});
		var employee_chart_options = {
			title: '직원 현황(직급별)',
			width :700, 
			height: 300,
			animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                startup: true,
                duration: 1000,
                easing: 'linear' 
           }
		};

		var employee_chart = new google.visualization.ColumnChart(document.getElementById('employeeChart'));

		employee_chart.draw(employee_chart_data, employee_chart_options);
	}

	function drawBarChart() {
		var category_reg_chart_data = google.visualization.arrayToDataTable(${bookCategory_reg_chart_data});
		var category_data_options = {
			title: '분야별 도서 계약 건수',
			width :700, 
			height: 300
			
		};

		var categoryReg_chart = new google.visualization.ColumnChart(document.getElementById('categoryRegChart'));

		categoryReg_chart.draw(category_reg_chart_data, category_data_options);
	
	}

	function drawCategoryChart() {
		var category_reg_chart_data = google.visualization.arrayToDataTable(${bookCategory_reg_chart_data});
		var category_data_options = {
			title: '분야별 도서 계약 건수',
			width :700, 
			height: 300
		};

		var categoryReg_chart = new google.visualization.ColumnChart(document.getElementById('categoryRegChart'));

		categoryReg_chart.draw(category_reg_chart_data, category_data_options);
	}


	function drawChart() {
		var monthlyBookReg_data = google.visualization.arrayToDataTable(${monthlyBook_reg_chart_data});
		//var data2 = google.visualization.arrayToDataTable(${corpOrder_chart_data});
		//var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});

		var monthlyBookReg_data_options = {	
			title: '월별 도서 계약 건수',
			width :700, 
			height: 300,
			animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                startup: true,
                duration: 1000,
                easing: 'linear' 
           }
		};

		var monthlyBookReg_chart = new google.visualization.LineChart(document.getElementById('monthlyBookRegChart'));

		monthlyBookReg_chart.draw(monthlyBookReg_data, monthlyBookReg_data_options);

	}

	function goSearch(cat_cd) {
		
		$("[name=cat_cd]").val(cat_cd);
		//alert($("[name=category]").filter(":checked").val());
		$.ajax({
			url : "/group4erp/viewCategoryChart.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $("[name=categoryBookChart]").serialize(),	//서버로 보낼 파라미터명과 파라미터값을 설정			
			success : function(data) {
				alert("성공!");
				if(data != null) {
					alert("성공!");
					google.charts.setOnLoadCallback(drawCateogoryChart);
					//drawBarChart(data);
					
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


/*google.charts.load('current', {'packages' : ['corechart'] } );

google.charts.setOnLoadCallback(drawLineChart);

function drawLineChart() {

	var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});
	var data4 = google.visualization.arrayToDataTable(${dailyCorpOrder_chart_data});

	var options3 = {
			title: '일반고객 주문 건수(일자별)',
			width: 600,
			height:300
	};

	var options4 = {
			title: '사업자고객 주문 건수(일자별)',
			width: 600,
			height:300
	};

	var chart3 = new google.visualization.LineChart(document.getElementById('dailyOrderChart'));
	var chart4 = new google.visualization.LineChart(document.getElementById('dailyCorpOrderChart'));

	chart3.draw(data3, options3);
	chart4.draw(data4, options4);
}*/

</script>
</head>
<body><center>
	<h1>[회사 현황]</h1>
	
	<form name="categoryBookChart" method="post" action="/group4erp/viewCategoryChart.do">
		<table class="ourCompanyTb" cellpadding="5" cellspacing="5" align="center">
		<tr>
			<td align="center">직원 현황(직급별)<br><div id="employeeChart" style="width: 700px; height: 300px;"> </div></td>
			<td align="center">총원 변동 현황(기간별)<br><div id="empHireOrResignChart" style="width: 700px; height: 300px;"> </div></td>
		</tr>
		
		<tr>
			<td align="center">월별도서계약건수<br><div id="monthlyBookRegChart" style="width: 700px; height: 300px;"> </div></td>
			<td align="center">판매도서 보유 현황<div id="catInventoryChart" style="width: 700px; height: 300px;"></div></td>
			
			<%--  <td align="center">종류별 도서 계약 건수<br>
				<c:forEach items="${bookCategoryList}" var="bookCategoryList" varStatus="loopTagStatus">
					<c:if test="${bookCategoryList.cat_cd eq 6}">
						<br>
					</c:if>
					<input type="checkbox" name="category" value='${bookCategoryList.cat_cd}' >${bookCategoryList.cat_name} &nbsp;
					
				</c:forEach>
				
			<div id="categoryRegChart" style="width: 700px; height: 300px;"> </div></td>--%>
		</tr>
	
	</table>
	<input type="hidden" name="cat_cd">
	</form>
	

</center>

</body>
</html>