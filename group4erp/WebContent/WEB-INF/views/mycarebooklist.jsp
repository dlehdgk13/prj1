<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당 상품 조회</title>
<script>

	//goSearchMyWorkList();

	$(document).ready(function(){	

		//goSearchMyWorkList();
		
		$('[name=rowCntPerPage]').change(function(){
			goSearchMyWorkList();
		});
		
		$(".pagingNumber").html(
				getPagingNumber(
					"${myWorkListAllCnt}"						//검색 결과 총 행 개수
					,"${myWorkSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${myWorkSearchDTO.rowCntPerPage}"			//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearchMyWorkList();"								//페이지 번호 클릭 후 실행할 자스코드
				)
			);
		inputData("[name=selectPageNo]", "${myWorkSearchDTO.selectPageNo}");
		inputData("[name=rowCntPerPage]", "${myWorkSearchDTO.rowCntPerPage}");
		inputData("[name=search_keyword]", "${myWorkSearchDTO.search_keyword}");
/* 
		<c:forEach items="${myWorkSearchDTO.category}" var="category">
			inputData("[name=category]", "${category}");
		</c:forEach>
		 */
		inputData("[name=searchCategory]", "${myWorkSearchDTO.searchCategory}");
	});
	
	function goSearchMyWorkList(){
		if( is_empty('[name=mycarebooklist] [name=search_keyword]') ){
			$('[name=search_keyword]').val("");
		}
		
		//키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
		
		var search_keyword = $('[name=mycarebooklist] [name=search_keyword]').val();
		search_keyword = $.trim(search_keyword);
		
		$('[name=search_keyword]').val(search_keyword);

		//document.mycarebooklist.submit();
		
		$.ajax({
			url : "/group4erp/goMyCareBookList.do"
			, type : "post"
		  , data : document.mycarebooklist.submit()
		});
		
	}
	
	function goAllSearchMyWorkList(){
		
		//name=boardListForm을 가진 form 태그 내부의 모든 입력양식에 value값을 비우거나 체크를 푼다.
		document.mycarebooklist.reset();
		
		$('[name=mycarebooklist] [name=rowCntPerPage]').val('10');
		$('[name=mycarebooklist] [name=selectPageNo]').val('1');
		goSearchMyWorkList();
	}

	function booKInvenFill(isbn) {

		alert("도서 발주 기능 구현중 "+isbn +"/"+td);
	}
</script>

</head>
<body>
	<center>
	<h1>담당 상품 조회</h1>
	<form name="mycarebooklist" method="post" action="/group4erp/goMyCareBookList.do"><div class="table_layout">
	<input type="hidden" name="emp_no" value="<%=(String)session.getAttribute("emp_id") %>">
		<table class="tab" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tr bgcolor="gray">
			<th width=50>구분<th>내용
			
			<%-- 
			<tr>
			<th bgcolor="gray">분야
			<td align=center>
			<c:forEach items="${requestScope.categoryList}" var="categoryList" varStatus="loopTagStatus">
				<input type="checkbox" name="category" value="${categoryList.cat_cd}">${categoryList.cat_name}
			</c:forEach>
			<tr>
			<th bgcolor="gray">판형
			<td align=center>
			<c:forEach items="${requestScope.bookSize}" var="bookSize" varStatus="loopTagStatus">
				<input type="checkbox" name="category_name" value="${bookSize.size_cd}">${bookSize.size_name}
			</c:forEach>
			<tr>
			<th bgcolor="gray">지역
			<td align=center>
			<c:forEach items="${requestScope.branchList}" var="branchList" varStatus="loopTagStatus">
				<input type="checkbox" name="category_name" value="${branchList.branch_cd}">${branchList.branch_name}
			</c:forEach>
			<tr>
			<th bgcolor="gray">출판사
			<td align=center>
				<select name="publisher">
					<option value="">
					<c:forEach items="${requestScope.publisherList}" var="publisherList" varStatus="loopTagStatus">
						<option value="${publisherList.publisher}">${publisherList.publisher}
					</c:forEach>
				<!-- 
					<option value="출판사1">출판사1
					<option value="출판사2">출판사2
					<option value="출판사3">출판사3
					<option value="출판사4">출판사4
					<option value="출판사5">출판사5
					 --> --%>
			<tr>
			<th bgcolor="gray">절판 상황
			<td align=left>
				<input type="radio" name="is_not_print" value="절판">절판
				<input type="radio" name="is_not_print" value="판매중">판매중
			
			<tr>
			<th bgcolor="gray">키워드
			<td>
				<select name="searchCategory">
					<option value="전체">전체
					<option value="책번호">책번호
					<option value="책이름">책이름
					<option value="카테고리">카테고리
					<option value="보유지점">보유지점
				</select>
				<input type="text" name="search_keyword" size=40>
		</table>
		</div>
		<br>
		<input type="button" value="  검색  " onclick="goSearchMyWorkList();">&nbsp;&nbsp;
		<input type="button" value="모두검색" onclick="goAllSearchMyWorkList();">
		<table border=0 width=700>
			<tr>
				<td align=right>
					총 개수 : ${myWorkListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="rowCntPerPage">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
						<option value="30">30</option>
					</select> 행보기
		</table>
		<table class="mycarebookTable tab" border=0 cellspacing=5 cellpadding=5 >
			<tr bgcolor="gray">
				<th>책번호<th>책 이름<th>카테고리<th>가격<th>수량<th>보유지점<th>비고
			<tr>
				
			<c:forEach items="${requestScope.MyCareBookList}" var="MyCareBookList" varStatus="loopTagStatus">
			<tr>	
				<td align=center>${MyCareBookList.ISBN13}
				<td align=center>${MyCareBookList.book_name}
				<td align=center>${MyCareBookList.cat_name}
				
				<%-- <td align=center>${MyCareBookList.publisher} --%>
				
				<td align=center>${MyCareBookList.book_price}
				<td align=center>${MyCareBookList.ISBN_cnt}
				<td align=center>${MyCareBookList.branch_name}
				<td align=center>
					<c:if test="${MyCareBookList.ISBN_cnt < 100}">
						<input type="button" value="발주" onClick="booKInvenFill('${MyCareBookList.ISBN13}');" >
					</c:if>
					<c:if test="${MyCareBookList.ISBN_cnt >= 100}">
						--
					</c:if>
				</td>
				<%-- <td align=center>${MyCareBookList.emp_no} --%>
			</tr>		
			</c:forEach>
		</table>
		<br>
        <input type="hidden" name="selectPageNo">
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	</form>
	
</body>
</html>