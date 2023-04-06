<%@page import="com.shinhan.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<EmpVO> empList = (List<EmpVO>)request.getAttribute("empAll");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>직원 목록</title>
<style type="text/css">

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
	
	* {
		font-family: 'EF_watermelonSalad';
		letter-spacing: 0.2em;
	}
	
	body {
		background-color: lightgray;
	}
	
	h1 {
		text-align: center;
		margin: 30px auto 5px;
	}
	
	div {
		width: 90%;
		margin: 20px auto;
	}
	
	table {
		width: 100%;
		background-color: #f0f0f0;
	}
	
	thead {
		background-color: lightblue;
	}
	
	th {
		font-family: 'ChosunCentennial';
		text-align: center;
		padding: 8px;
	}
	
	tbody > tr:hover {
		background-color: lightgreen !important;
	}
	
	td {
		text-align: center;
		line-height: 2em;
	}
	
	#insertBtn {
		float: right;
		margin-bottom: 10px;
	}
	
	#btn1, #btn2 {
		float: left;
		margin-right: 5px;
	}
	
	select {
		width: 200px;
		height: 38px;
		padding: .5em;
		border: 1px solid #999;
		font-size: 15px;
	}
	
	option {
		font-size: 17px;
	}
	
	a {
		text-decoration-line: none;
	}
	
	td a:hover {
		text-shadow: 2px 2px 3px white;
		color: darkgreen;
		font-weight: bolder;
		transition: 0.2s;
	}

</style>
<script>
	var flag1 = 1;
	var flag2 = 1;
	var flag3 = 1;
	$(function() {
		$('#btn1').click(func_btn1);
		$('#btn2').click(func_btn2);
		$("th").click(rowSelect);
		
		
		var str = '';
		var arr = ['IT_PROG', 'AD_VP', 'AD_PRES', 'FI_MGR', 'FI_ACCOUNT', 'ST_MAN'];
		$.each(arr, function(index, item) {
			console.log(item);
			str += '<option>'+item+'</option>';
		});
		
		$('#jobs').html(str); // html() : jQuery 함수.	innerHTML : 자바스크립트 속성
		
	});
	
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
<body>
	<h1>직원 목록</h1>
	<div id="divBtn">
		<button id="btn1" class="btn btn-outline-success">짝수번째 줄</button>
		<button id="btn2" class="btn btn-outline-success">이름이 S로 시작하는 튜플</button>
		<!-- s문자가 포함 
		급여가 5000 이상
		직원 번호가 홀수인 사람 선택
		직책으로 드롭다운 메뉴 select > option -->
		<select id="jobs">
			
		</select>
	</div>
	<div>
		<a href="empinsert.do" type="button" id="insertBtn" class="btn btn-outline-success">신규 직원 등록</a>
		<br>
		<br>
		<table>
			<thead>
				<tr>
					<th>직원 번호</th>
					<th>이름</th>
					<th>성</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>입사일</th>
					<th>직책</th>
					<th>급여</th>
					<th>커미션</th>
					<th>매니저</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
				<%for(EmpVO emp : empList) { %>
				<tr>
					<td><a href="empDetail.do?empid=<%=emp.getEmployee_id() %>"><%=emp.getEmployee_id() %></a></td>
					<td><a href="empDetail.do?empid=<%=emp.getEmployee_id() %>"><%=emp.getFirst_name() %></a></td>
					<td><%=emp.getLast_name() %></td>
					<td><%=emp.getEmail() %></td>
					<td><%=emp.getPhone_number() %></td>
					<td><%=emp.getHire_date() %></td>
					<td><%=emp.getJob_id() %></td>
					<td><%=emp.getSalary() %></td>
					<td><%=emp.getCommission_pct() %></td>
					<td><%=emp.getManager_id() %></td>
					<td><%=emp.getDepartment_id() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
</body>
</html>