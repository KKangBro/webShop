<%@page import="com.shinhan.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/commonfiles.jsp"/>
<title>직원 목록</title>
<style>
	@font-face {
	    font-family: 'EF_watermelonSalad';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_watermelonSalad.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'ChosunCentennial';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/ChosunCentennial.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'SUIT-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	html {
		scroll-behavior: smooth;
	}
	
	* {
		font-family: 'EF_watermelonSalad';
		letter-spacing: 0.2em;
	}
	
	body {
		background-color: lightgray;
	}
	
	h1 {
		text-align: center;
		padding-top: 30px;
		margin: 0px auto 5px;
	}
	
	#container {
		width: 90%;
		margin: 20px auto;
	}
	
	.session-div {
		/* display: none; */
		font-size: 10px;
		margin-bottom: 5px;
	}
	
	
	
	#btn-div {
		display: inline-block;
	}
	
	#btn1, #btn2 {
		float: left;
		margin-right: 5px;
	}
	
	.dropdown {
		display: inline-block;
	}
	
	#jobs {
		background-color: transparent;
		color: #0d6efd;
	}
	
	#jobs:hover {
		background-color: #0d6efd;
		color: white;
	}
	
	#insertBtn {
		float: right;
	}
	
	table {
		width: 100%;
		margin-top: 10px;
		background-color: #f0f0f0;
	}
	
	th {
		background-color: lightblue;
		font-family: 'SUIT-Regular';
		text-align: center;
		padding: 8px;
		line-height: 2em;
		position: sticky;
		top: 0;
	}
	
	tbody > tr:hover {
		background-color: lightgreen !important;
	}
	
	td {
		height: 50px;
		text-align: center;
		font-size: 13px;
		line-height: 2em;
	}
	
	a {
		text-decoration-line: none;
	}
	
	td a:hover {
		text-shadow: 1px 1px 3px #f0f0f0;
		color: darkgreen;
		font-weight: bolder;
	}
	
	.btnDel {
		width: 30px;
		padding: 0px;
		margin-right: 10px;
		text-align: center;
		border: 1px solid gray;
		border-radius: 10px;
	}
	
	.btnDel:hover {
		background-color: orange;
		border: 0px;
		font-weight: bolder;
	}
	
	#up-div {
		width: 100px;
		margin: 20px auto;
		text-align: center;
	}
	
	#footer {
		width: 100%;
		text-align: center;
	}
	
	

</style>
<script>
	var flag1 = 1;
	var flag2 = 1;
	var flag3 = 1;
	$(function() {
		$('#btn1').click(func_btn1);
		$('#btn2').click(func_btn2);
		$('th').click(rowSelect);
		$('.btnDel').on('click', func_del);
		$('#up-btn').on('click', function() {
			location.href = '#top';
		});
		$('.dropdown-item ').on('click', function() {
			console.log('selected');
		});

		
		
		var str = '';
		var arr = ['IT_PROG', 'AD_VP', 'AD_PRES', 'FI_MGR', 'FI_ACCOUNT', 'ST_MAN'];
		$.each(arr, function(index, item) {
			console.log(item);
			str += '<li><a class="dropdown-item">'+ item +'</a></li>';
		});
		
		$('.dropdown-menu').html(str); // html() : jQuery 함수.	innerHTML : 자바스크립트 속성
		
	});
	
	function func_del() {
		location.href='${path}/emp/empDelete.do?empid=' + $(this).attr('data-del');
	}
	
	function func_btn1() {
		flag1 *= -1;
		if(flag1 < 0)
			$('tbody > tr:nth-child(2n)').css('background-color', '#F2DCDB');
		else
			$('tbody > tr').css('background-color', '#f0f0f0');
	}
	
	function func_btn2() {
		//body > div > table > tbody > tr:nth-child(1) > th:nth-child(2)
		//body > div > table > tbody > tr:nth-child(17) > th:nth-child(2)
		
		flag2 *= -1;
		if(flag2 < 0)
			$('tbody > tr > td:nth-child(2):contains("S")').parent().css({'color': 'red', 'font-weight': 'bolder', 'background-color': '#DDD9C3'});
		else
			$('tbody > tr').css({'color': 'black', 'font-weight': '400', 'background-color': '#f0f0f0'});
	}
	
	function rowSelect() {
		flag3 *= -1;
		if(flag3 < 0) {
			//내가 클릭한 th가 몇번째인가?
			var trNum = $(this).closest("th").prevAll().length;
			console.log(trNum);
			
			var a = $("tbody tr").each(function(index, item) {
				var col = $(item).find("td:nth-child(" + (trNum+1) + ")");
				console.log(col);
				// 되돌리기(기존 선택을 clear)
				$(item).find("td").css("background-color", "#f0f0f0");
				// 신규 선택의 색깔 바꾸기
				$(col).css("background-color", "#DEFFCF");
			});
		} else {
			$('tbody > tr > td').css({'color': 'black', 'font-weight': '400', 'background-color': '#f0f0f0'});
		}
		
	}
	
</script>
</head>
<body id="top">
	<h1>직원 목록</h1>
	<div id="container">
		<div class="session-div">세션에서 로그인 사용자 읽기(EL): ${sessionScope.loginUser}</div>
		<div class="session-div">세션에서 로그인 사용자 읽기(ScriptLet): <%=session.getAttribute("loginUser") %></div>
		<!-- inclulde 디렉티브는 소스를 합쳐서 컴파일한다. -->
		<%@ include file="../common/header.jsp" %>
		<!-- include action tag 이용 : 컴파일하고 합친다.-->
		<%-- <jsp:include page="../common/header.jsp"></jsp:include> --%>
		<div id="btn-div">
			<button id="btn1" class="btn btn-outline-success">짝수번째 줄</button>
			<button id="btn2" class="btn btn-outline-success">이름이 S로 시작하는 튜플</button>
			<!-- s문자가 포함 
			급여가 5000 이상
			직원 번호가 홀수인 사람 선택
			직책으로 드롭다운 메뉴 select > option -->
			<div class="dropdown">
			  <button id="jobs" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">직책</button>
			  <ul class="dropdown-menu"></ul>
			</div>
		</div>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">modal</button>
		<%@include file="empInsertModal.jsp" %>
		<a href="${path}/emp/empinsert.do" type="button" id="insertBtn" class="btn btn-outline-success">신규 직원 등록</a>
		<table>
			<thead>
				<tr>
					<th>순서</th>
					<th>직원 번호</th>
					<th>이름</th>
					<th>성</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>입사일</th>
					<th>직책</th>
					<th>급여</th>
					<th>누적 급여</th>
					<th>커미션</th>
					<th>매니저</th>
					<th>부서</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<!-- for (EmpVO emp : empAll) -->
				<c:set var="totalSalary" value="0"/>
				<c:forEach items="${empAll}" var="emp" varStatus="status">
					<c:set var="totalSalary" value="${totalSalary + emp.salary}"/>
					<tr>
						<td style="background-color:${status.first||status.last ? 'orange' : 'lightgreen'};">${status.count}</td>
						<td><a href="${path}/emp/empDetail.do?empid=${emp.employee_id}">${emp.employee_id}</a></td>
						<td style="${fn:length(emp.first_name) > 5 ? 'font-style: italic;' : 'font-style: normal;'}"><a href="${path}/emp/empDetail.do?empid=${emp.employee_id}">${emp.first_name}</a></td>
						<td>${emp.last_name}</td>
						<td>${fn:contains(emp.email, '@') ? fn:substring(emp.email, 0, fn:indexOf(emp.email, '@')) : emp.email}</td>
						<td>${emp.phone_number}</td>
						<td> <fmt:formatDate value="${emp.hire_date}" pattern="YYYY/MM/dd"/> </td>
						<td>${emp.job_id}</td>
						<td><fmt:formatNumber value="${emp.salary}" groupingUsed="true"/></td>
						<td>${totalSalary}</td>
						<td><fmt:formatNumber value="${emp.commission_pct}" type="percent"/></td>
						<td>${emp.manager_id}</td>
						<td>${emp.department_id}</td>
						<td><button class="btnDel" data-del="${emp.employee_id}">⨉</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="up-div"><button id="up-btn" class="btn btn-outline-success">맨 위로</button></div>
		<p id="footer"><%=company %></p>
		
		<form method="post"  action="${path}/downloadTest/result.jsp" >
			<input type=hidden  name="param1" value="top.jpg" /> <br>
			<input type=hidden  name="param2" value="umbrella.jpg" /> <br>
			<input type ="submit" value="이미지 다운로드">	 
		</form> 
	</div>
</body>
</html>