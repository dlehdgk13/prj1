<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>YES4조 전사적자원관리 시스템 </title>
<!-- Favicons -->
<link href="${ctRootImg}/favicon.png" rel="icon">
<link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="${ctRootlib}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="${ctRootlib}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctRootlib}/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="${ctRootlib}/bootstrap-daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="${ctRootlib}/bootstrap-fileupload/bootstrap-fileupload.css" />
<!-- Custom styles for this template -->
<link href="${ctRootcss}/style.css" rel="stylesheet">
<link href="${ctRootcss}/style-responsive.css" rel="stylesheet">
 <style>
      .tbcss1, .tbcss1 th,.tbcss1 td{ 
               border-collapse: collapse;
               border:1px solid #A2A2A2; 
               padding: 5;
               font-size: 9pt;
               font-family: tahoma, 굴림, 돋움, verdana
      }
    .fileBox .fileName {display:inline-block;width:190px;height:20px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
   .fileBox .btn_file {display:inline-block;border:1px solid #000;width:100px;height:20px;font-size:0.8em;line-height:20px;text-align:center;vertical-align:middle; background-color:black; color:white;}
   .fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);}
   </style>
<script>

   $(document).ready(function(){
      var uploadFile = $('.fileBox .uploadBtn');
      uploadFile.on('change', function(){
         if(window.FileReader){
            var filename = $(this)[0].files[0].name;
         } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
         }
         $(this).siblings('.fileName').val(filename);
      });
      
      $('[name=emp_gender_M]').click(function(){
    	 $('[name=emp_gender]').val('남'); 
      });
      $('[name=emp_gender_W]').click(function(){
     	 $('[name=emp_gender]').val('여'); 
       });
   });


   

   function goJoinMember(){

         //alert($('[name=newEmpForm]').serialize());
         //return;
      
         if( is_empty('[name=emp_name]') ){
             alert("이름을 입력해주세요.");
             $("[name=emp_name]").focus();
             return;
          }
          if( is_empty('[name=emp_eng_name]') ){
             alert("영문이름을 입력해주세요.");
             $("[name=emp_eng_name]").focus();
             return;
          }
          /* if( is_empty('[name=dep_no]') ){
             alert("부서를 선택해주세요.");
             $("[name=dep_no]").focus();
             return;
          }
          if( is_empty('[name=jikup_cd]') ){
             alert("직급을 선택해주세요.");
             $("[name=jikup_cd]").focus();
             return;
          }
          if( is_empty('[name=salary]') ){
             alert("연봉을 입력해주세요.");
             $("[name=salary]").focus();
             return;
          } */
          if( is_empty('[name=jumin_num_f]') ){
             alert("주민번호 앞자리를 입력해주세요.");
             $("[name=jumin_num_f]").focus();
             return;
          }
          if( is_empty('[name=jumin_num_b]') ){
             alert("주민번호 뒷자리를 입력해주세요.");
             $("[name=jumin_num_b]").focus();
             return;
          }
          if( is_empty('[name=emp_gender]') ){
             alert("성별을 선택해주세요.");
             $("[name=emp_gender]").focus();
             return;
          }
          if( is_empty('[name=phone]') ){
             alert("휴대전화를 입력해주세요.");
             $("[name=phone]").focus();
             return;
          }
          if( is_empty('[name=emp_email]') ){
             alert("이메일을 입력해주세요.");
             $("[name=emp_email]").focus();
             return;
          }
          /* if( is_empty('[name=emp_email_office]') ){
             alert("회사 이메일을 입력해주세요.");
             $("[name=emp_email_office]").focus();
             return;
          } */

          if( is_empty('[name=emp_addr]') ){
             alert("주소를 입력해주세요.");
             $("[name=emp_addr]").focus();
             return;
          }
          /* if( is_empty('[name=worktime_cd]') ){
             alert("근무 형태를 선택해주세요.");
             $("[name=worktime_cd]").focus();
             return;
          } */
          if( is_empty('[name=emp_pwd]') ){
             alert("비밀번호를 입력해주세요.");
             $("[name=emp_pwd]").focus();
             return;
          }
          
          
          var juminb = $('[name=jumin_num_b]').val();
          var gender = 0;
          /*
          $("[name=emp_gender]").each(function(){
             var thisGender = $(this);
             if(thisGender.is(":checked")){
                gender = thisGender;   
             }
          });
          */
          gender = $('[name=emp_gender]');
          if(juminb.indexOf(1)==0 || juminb.indexOf(3)==0){
             if(gender.val()=='여'){
                alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
                return;
             }
          }else if(juminb.indexOf(2)==0 || juminb.indexOf(4)==0){
             if(gender.val()=='남'){
                alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
                return;
             }
          }else if(juminb.indexOf(5)==0 || juminb.indexOf(6)==0 || juminb.indexOf(7)==0 || juminb.indexOf(8)==0 || juminb.indexOf(9)==0){
             alert("일치하지 않는 주민등록번호 입니다.");
             return;
          }
          var juminf = $('[name=jumin_num_f]').val();
          var jumin = []
          jumin.push(juminf);
          jumin.push(juminb);
          var jumin_num = jumin.join('');
          $('[name=jumin_num]').val(jumin_num);
          
          var phone = $('[name=phone]').val();
          
          if(phone.indexOf('-')>0){
             phone = phone.split('-').join('');
          }
          
          
          if( is_valid_pattern("[name=phone]", /^[0-9]{10,11}$/)==false ){
             alert("전화번호 형식이 틀렸습니다. 다시 입력해주세요");
             return;
          }
          if( is_valid_email("[name=emp_email]")==false ){
             alert("이메일 형식을 벗어납니다.");
             return;
          }
          if( is_valid_pattern("[name=emp_pwd]", /^[0-9]{4}$/)==false ){
             alert("암호는 숫자 4개를 입력해주세요");
             return;
          }
          
          if(confirm("정말 저장하시겠습니까?")==false){return;}
                  
      
         
/*          $.ajax({
            //호출할 서버쪽 URL주소 설정
            url : "/group4erp/newEmpInfoProc.do"
            //전송 방법 설정
            , type : "post"
            //서버로 보낼 파라미터명과 파라미터값을 설정
            , data : $('[name=newEmpForm]').serialize()
            //서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
            //매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
            , success : function(insertCnt){
               if(insertCnt==1){
                  alert("사원 등록 성공");
                  location.replace("/group4erp/viewEmpList.do")
               }else if(insertCnt==0){
                  alert("등록 실패");
               }else alert("서버쪽 DB연동 실패!");
            }
            //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
            , error : function(){
               alert("서버 접속 실패");
            }
         }); */

		
         alert("start");
         var form = $('[name=newEmpForm]')[0];
           var formData = new FormData(form);
           formData.append("uploadBtn", $("#uploadBtn")[0].files[0]);
           $.ajax({
               url: "/group4erp/newEmpInfoProc.do",
                       processData: false,
                       contentType: false,
                       data: formData,
                       type: 'POST',
                       success: function(result){
                           alert("사원 등록이 완료되었습니다.");
                           location.replace("/group4erp/loginForm.do");

                       }
                      //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
                  , error : function(){
                     alert("서버 접속 실패");
                  }
           });

   }

   function sample6_execDaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
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

            document.getElementById("emp_addr").value = addr;

         }
      }).open();
   }

   function goLogin(){
      location.replace("/group4erp/loginForm.do");
   }
   

</script>

</head>
<body><center>
<!--
<b>[직원 등록]</b>
<table><tr height=5><td></td></tr></table>
   <form name="newEmpForm" method="post" action="/group4erp/newEmpInfoProc.do" enctype="multipart/form-data">
         <table cellpadding=5 class="tbcss1">
            <tr>
               <th bgcolor=#DBDBDB >사원명
               <td><input type="text" name="emp_name" class="emp_name" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >사원영문명
               <td><input type="text" name="emp_eng_name" class="emp_eng_name" size="20" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >주민번호

               <td><input type="text" name="jumin_num_f" class="jumin_num" size="13" maxlength=6>&nbsp;-&nbsp;
                  <input type="text" name="jumin_num_b" class="jumin_num" size="14" maxlength=7>
                  <input type="hidden" name="jumin_num">

            </tr>
            <tr>
               <th bgcolor=#DBDBDB>성별
               <td><input type="radio" name="emp_gender" value="남">남자   
                  <input type="radio" name="emp_gender" value="여">여자
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >전화번호
               <td><input type="text" name="phone" class="phone" size="20" maxlength=20>
                  <font color="gray"> *&nbsp;'&nbsp;-&nbsp;'&nbsp;제외하고 입력</font>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>이메일
               <td><input type="text" name="emp_email" class="emp_email" size="35" maxlength=40>
            </tr>

            <tr>

               <th bgcolor=#DBDBDB>직원주소</th>
               <td>
                     <input type="text" size="60" id="emp_addr" name="emp_addr" readOnly> 
                     <input type="button"onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                  </td>
            </tr>
            <tr>

               <th bgcolor=#DBDBDB>증명사진</th>
               <td>
                     <div class="fileBox" align="left">   <!-- style="position:absolute;left:22%; -->
                     <!-- 
                  <input align="left" type="text" class="fileName" readonly="readonly">
                  <label style="cursor:pointer" for="uploadBtn" class="btn_file" align="left">사진</label>
                  <input type="file" id="uploadBtn" class="uploadBtn" name="uploadBtn">
               </div>
                  </td>
            </tr>
         <tr>
               <th bgcolor=#DBDBDB>비밀번호
               <td><input type="password" name="emp_pwd" class="emp_pwd" size="7">
            </tr>
         </table>
         <br>
         <input type="button" value=" 등록 " onclick="goJoinMember();">
         <input type="button" value=" 닫기 " onclick="goLogin();">
   </form>
   
   
  --> 
   
   
   
   
   
 <table align="center" width="100%" border="1">
    <tr>
       <td width="15%"></td>
       <td align="center" width="70%">
          <div style="width:80%; text-align:center">

        <h3><i class="fa fa-user"></i>신규사원등록</h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div align="center" class="row mt">
          <div class="col-md-12">
            <h4 class="title">정확한 정보를 기재해주십시오.</h4>
            <div id="message"></div>
            <form name="newEmpForm" class="contact-form php-mail-form" role="form" action="contactform/contactform.php" method="POST" enctype="multipart/form-data">

              <div class="form-group">
                <input type="text" name="emp_name" class="form-control" id="contact-name" placeholder="사원명">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="emp_eng_name" class="form-control" id="contact-name" placeholder="사원영문명">
                <div class="validate"></div>
              </div>
               <div class="input-group input-large">
                      <input type="text" class="form-control dpd1" name="jumin_num_f" placeholder="주민등록번호 앞자리" maxlength=6>
                      <span style="border:0px;" class="input-group-addon">-</span>
                      <input type="password" class="form-control dpd2" name="jumin_num_b" placeholder="주민등록번호 뒷자리" maxlength=7>
                      <input type="hidden" name="jumin_num">
              </div>
              <br>
              <div style="text-align:left; backgound-color:white; width:100%;broder:1px solid black">
                 <div class="input-group input-large" style="align:left">
                    
                      <!-- 성별<input type="radio" name="email" class="form-control" id="contact-email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
                       -->
                      <span style="border:0px; background-color:#eaeaea; color:#797979" class="input-group-addon">성별 </span>
                      <button type="button" name="emp_gender_M" class="btn btn-default" style="width:50%; color:#797979">남자
                      </button>
                      <button type="button" name="emp_gender_W" class="btn btn-default" style="width:50%;  color:#797979">여자
                         <input type="hidden" name="emp_gender">
                      </button>
                   </div>
                <div class="validate"></div>
              </div>
              <br>
              <div class="form-group">
                <input type="text" name="phone" class="form-control" placeholder="전화번호">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="emp_email" class="form-control" placeholder="이메일">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="emp_pwd" class="form-control" placeholder="비밀번호">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" size="60" id="emp_addr" name="emp_addr" readOnly> 
                     <input type="button"onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                <div class="validate"></div>
              </div>
               <div class="form-group">
                 <div class="controls col-md-9">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select file</span>
                      	<input type="file" class="default" />
                      </span>
                      <span class="fileupload-preview" style="margin-left:5px;"></span>
                      <a href="advanced_form_components.html#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                    </div>
                  </div>
                </div>
 
              <div class="loading"></div>
              <div class="error-message"></div>
              <div class="sent-message">Your message has been sent. Thank you!</div>

              <div class="form-send">
                <button type="button" onclick="goJoinMember();" class="btn btn-large btn-primary">Send Message</button>
              </div>

            </form>
          </div>
          </div>
        <!-- /row -->
          
          
          <div class="col-md-12">
            <h4 class="title">Contact Details</h4>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
            <ul class="contact_details">
              <li><i class="fa fa-envelope-o"></i> info@yoursite.com</li>
              <li><i class="fa fa-phone-square"></i> +34 5565 6555</li>
              <li><i class="fa fa-home"></i> Some Fine Address, 887, Madrid, Spain.</li>
            </ul>
            <!-- contact_details -->
          </div>
        
  </div>
       </td>
       <td width="15%"></td>
    </tr>
 
 </table> 
   
   
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  <script src="${ctRootlib}/jquery-ui-1.9.2.custom.min.js"></script>
  <!--custom switch-->
  <script src="${ctRootlib}/bootstrap-switch.js"></script>
  <!--custom tagsinput-->
  <script src="${ctRootlib}/jquery.tagsinput.js"></script>

  <!--Contactform Validation-->
  <script src="${ctRootlib}/php-mail-form/validate.js"></script>
    
</body>
</html>