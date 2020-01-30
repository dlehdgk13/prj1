<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <meta http-equiv="Conpatible" content="no-cache"/>
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="${ctRootImg}/favicon.png" rel="icon">
  <link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${ctRootlib}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${ctRootlib}/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${ctRootcss}/style.css" rel="stylesheet">
  <link href="${ctRootcss}/style-responsive.css" rel="stylesheet">\
<html>
<head>
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
<title>
글 수정/삭제
</title>
<script>
	$(document).ready(function(){
		$("#datepicker5").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		$("#datepicker6").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		
		if(
			("${businessTripDTO.login_emp_id}"=="${businessTripDTO.mgr_no}")
				||
			("${businessTripDTO.login_dep_no}"==6)
				||
			("${businessTripDTO.login_jikup}"=="대표이사")
		  ){
				$(".approved").show();
			}else{
				$(".approved").hide();
			}
	});
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }


	            document.getElementById("destination2").value = addr;

	        }
	    }).open();
	}
function checkBusinessTripUpDelAppForm(upDelApp){
		
		//매개변수로 들어온 upDel에 "del"이 저장되어있으면 즉, 삭제 버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기
		if(upDelApp=='del'){
			
			$("[name=upDelApp]").val("del");
					
			//alert($('[name=boardUpDelForm]').serialize());		
			
			if(confirm("정말 삭제 하시겠습니까?")==false) return;
		
		}else if(upDelApp=='up'){
			$("[name=upDelApp]").val("up");
			if( is_empty('[name=destination]') ){
				alert("출장지를 입력해주세요.");
				$("[name=destination]").focus();
				return;
			}
			if( is_empty('[name=work_outside_reason]') ){
				alert("출장사유를 입력해주세요.");
				$("[name=work_outside_reason]").focus();
				return;
			}
			if( is_empty('[name=outside_start_time]') ){
				alert("출장날짜를 입력해주세요.");
				$("[name=outside_start_time]").focus();
				return;
			}
			if( is_empty('[name=outside_end_time]') ){
				alert("출장날짜를 입력해주세요.");
				$("[name=outside_end_time]").focus();
				return;
			} 
			var startDate = $( "[name=outside_start_time]" ).val();
		    var startDateArr = startDate.split('-');
		    var endDate = $( "[name=outside_end_time]" ).val();
		    var endDateArr = endDate.split('-');
		    var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
		    var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
		          
		    if(startDateCompare.getTime() > endDateCompare.getTime()) {
		              
		        alert("시작날짜와 종료날짜를 확인해 주세요.");
				$("[name=outside_start_time]").focus();
		         return;
		    }if(confirm("정말 수정하시겠습니까?")==false){return;}
		    
		}else if(upDelApp=='app'){
			$("[name=upDelApp]").val("app");
			if(confirm("정말 승인 하시겠습니까?")==false)
			 return;
		}
			
		    	
			

		
		 $.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/businessTripUpDelAppProc.do"
			//전송 방법 설정
			, type : "post"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=businessTripUpDel]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(businessTripUpDelAppCnt){
				if(upDelApp=='up'){
					if(businessTripUpDelAppCnt==1){
						alert("수정 성공!");
						location.replace('/group4erp/businessTripList.do')
					}else if(upCnt==-1){
						alert("게시물이 삭제되어 수정할 수 없습니다!");
					}else{
						alert("서버쪽 DB연동 실패!");
					}
				}else if(upDelApp=='del'){
					if(businessTripUpDelAppCnt==1){
						alert("삭제 성공!");
						location.replace('/group4erp/businessTripList.do')
					}else if(delCnt==-1){
						alert("이미 삭제된 게시물입니다!");
					}else{
						alert("서버쪽 DB연동 실패!");
					}
				}else if(upDelApp=='app'){
					if(businessTripUpDelAppCnt==1){
						alert("승인 완료");
						location.replace('/group4erp/businessTripList.do')
					}else if(businessTripUpDelAppCnt==-1){
						alert("이미 삭제된 게시물입니다!");
					}else if(businessTripUpDelAppCnt==-2){
						alert("이미 승인된 게시물입니다.");
					}else{
						alert("서버쪽 DB연동 실패!");
					}
				}
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
	}
		
</script>
</head>
<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="/group4erp/goMainTest.do" class="logo"><b>BOOKST<span>.ERP</span></b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <!-- notification dropdown end -->
          <li><!-- 
            <table>
               <tr>
                  <td align="left"> <font style="color:#D8E8E4;"><h4><span id="nowTime" align="right"></span> </h4></font></td>
               </tr>
            </table> -->
          </li>
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <!-- <li>
            <a class="goBackss" href="javascript:goBack();">뒤로 가기</a>
          </li> -->
          <li>
             <a class="logout" href="/group4erp/logout.do">Logout</a>
          </li>
        </ul>
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <!-- <li>
            <a class="goBackss" href="javascript:goBack();">뒤로 가기</a>
          </li> -->
          <li style="margin-top: 10px; margin-right: 20px;">
             <font style="color:#D8E8E4;"><h4><span id="nowTime" align="right"></span> </h4></font>
          </li>
        </ul>
      </div>
      
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered">
            <a href="profile.html"><img src="${ctRootImg}/ui-sam.jpg" class="img-circle" width="80"></a>
          </p>
          <h4 class="centered"><b><font style="color:lightgray">${emp_name} ${jikup}님</font></b></h4>
          <li class="mt">
            <a href="/group4erp/goMainTest.do">
              <i class="fa fa-dashboard"></i>
              <span>메인페이지</span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>업무 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/goMyCareBookList.do"><i class="fa fa-book"></i>담당 도서 조회</a>
              </li>
              <li>
                <a href="/group4erp/businessTripList.do"><i class="fa fa-briefcase"></i>출장 신청</a>
              </li>
              <li>
                <a href="/group4erp/goMyWorkTime.do"><i class="fa fa-list"></i>근태 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewApprovalList.do"><i class="fa fa-pencil"></i>문서 결재</a>
              </li>
              <li>
                <a href="/group4erp/goEmpDayOffjoin.do"><i class="fa fa-edit"></i>휴가 신청</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-shopping-cart"></i>
              <span>재고 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/goBookList.do"><i class="fa fa-info-circle"></i>도서정보조회</a>
              </li>
              <li>
                <a href="/group4erp/goReleaseList.do"><i class="fa fa-list"></i>출고현황조회</a>
              </li>
              <li>
                <a href="/group4erp/goWarehousingList.do"><i class="fa fa-list"></i>입고현황조회</a>
              </li>
              <li>
                <a href="/group4erp/goReturnOrderList.do"><i class="fa fa-list"></i>반품현황조회</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-calendar"></i>
              <span>마케팅 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewSalesInfoList.do"><i class="fa fa-money"></i>판매현황</a>
              </li>
              <li>
                <a href="/group4erp/viewEventList.do"><i class="fa fa-gift"></i>이벤트행사 현황</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-users"></i>
              <span>인사 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewEmpList.do"><i class="fa fa-info-circle"></i>직원정보</a>
              </li>
              <li>
                <a href="/group4erp/viewSalList.do"><i class="fa fa-file"></i>급여명세서 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewEmpWorkStateList.do"><i class="fa fa-list"></i>직원별 근무현황</a>
              </li>
              <li>
                <a href="/group4erp/viewEmpDayOffList.do"><i class="fa fa-list"></i>직원별 휴가 현황</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-krw"></i>
              <span>회계 관리</span>
              </a>
            <ul class="sub">
              <li class="active">
                <a href="/group4erp/viewTranSpecIssueList.do"><i class="fa fa-list"></i>거래명세서 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewTranSpecList.do"><i class="fa fa-file-text"></i>사업자 거래내역 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewCorpList.do"><i class="fa fa-link"></i>거래처 현황 조회</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class=" fa fa-bar-chart-o"></i>
              <span>전략 분석</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewBestKeywdAnalysis.do"><i class="fa fa-search"></i>키워드 검색 자료 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewOurCompanyReport.do"><i class="fa fa-building-o"></i>회사현황</a>
              </li>
            </ul>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> 출장 상세정보</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <p>정보에 대한 수정을 할수 있는 페이지 입니다.</p>
            <form name="businessTripUpDel" method="post" action="/group4erp/businessTripUpDelProc.do">
		<b>수정/삭제</b>
		<br>
		<table class="tbcss1" width="60%" border=1 bordercolor="#000000" align=center>
			<tr align=center>
				<th >사원 번호</th>
				<td >${businessTripDTO.emp_no}</td>
				<th >직급</th>
				<td >${businessTripDTO.jikup}</td>
			</tr>
			<tr align=center>
				<th width=60>사원명</th>
				<td >${businessTripDTO.emp_name}</td>
				<th width=60>부서명</th>
				<td >${businessTripDTO.dep_name}</td>
			</tr>
			<tr align=center>
				<th >담당자 명</th>
				<td>${businessTripDTO.mgr_name}</td>
				<th >결제 여부</th>
				<td>
					<c:choose>
								<c:when test="${businessTripDTO.travel_payment eq 'Y'}">
									승인
								</c:when>
								<c:when test="${businessTripDTO.travel_payment eq 'N'}">
									반려
								</c:when>
								<c:otherwise>
									대기중
								</c:otherwise>				
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>출장날짜</th>
				<td colspan=3>
					<input type="text" id="datepicker5" name="outside_start_time" value="${businessTripDTO.outside_start_time}" readonly>
					~
					<input type="text" id="datepicker6" name="outside_end_time" value="${businessTripDTO.outside_end_time}"  readonly>
				</td>
			</tr>
			<tr>
				<th >출장지</th>
				<td colspan=3>
					<input type="text" size="40" maxlength="50" id="destination2" name="destination" value="${businessTripDTO.destination}"> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					
				</td>
			</tr>
			<tr>
				<th >출장 사유</th>
				<td colspan=3>
					<textarea name="work_outside_reason" rows="13" cols="40" maxlength="500" >${businessTripDTO.work_outside_reason}
					</textarea>
				</td>
			</tr>
		</table>
		<table><tr heigth=4><td></td></table>
		<table>
			<tr heigth=4>
				<input type="hidden" name="work_outside_seq" value="${businessTripDTO.work_outside_seq}">	
				<input type="hidden" name="upDelApp" value="up">
				<td>
					<div class="approved" style="display:none">
							<input type="button" value="승인" onclick="checkBusinessTripUpDelAppForm('app')">
					</div>
				</td>
				<td>
					<input type="button" value="수정" onclick="checkBusinessTripUpDelAppForm('up')">
				</td>
				<td>
					<input type="button" value="삭제" onclick="checkBusinessTripUpDelAppForm('del')">
				</td>
				<td>
					<input type="button" value="목록보기" onclick="location.replace('/group4erp/businessTripList.do')">
				</td>
			</tr>
		</table>
	</form>
	<form name="businessTripList" method="post" action="/group4erp/businessTripList.do">
		<!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장 -->
		<!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야하기 때문 -->
		<input type="hidden" name="work_outside_seq" value="${businessTripDTO.work_outside_seq}">
		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
	</form>
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
			KOSMO 자바&빅데이터 과정 팀프로젝트
        </p>
        <div class="credits">
        <font style="font-size:12pt;">
        ⓒ Copyrights <strong>조충래, 김태현, 박현우, 이동하, 임남희, 최민지</strong>
         </font>
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
        </div>
        <a href="basic_table.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script src="${ctRootlib}/jquery-ui-1.9.2.custom.min.js"></script>
  <script src="${ctRootlib}/jquery.ui.touch-punch.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->

</body>

</html>
