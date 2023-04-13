<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="3;auth/login.jsp"> -->
<title>Home</title>
<style>
	#study {
		display: none;
	}
	
	#container {
		width: 80%;
		margin: 30px auto;
	}
</style>
</head>
<body>
	<div id="container">
		<h1>KKangBro's JSP/Servlet Project 무야호~! ^오^</h1>
		<%@include file="common/header.jsp" %>
		<hr>
		<button id="btn">나도 하기 싫어 근데 누군가는 해야하잖아</button>
		<div id="study">
			<p>getInitParameter: <%=application.getInitParameter("DB_userid") %>
			<hr>
			<!-- application, session, request 영역 연습 -->
			<p>application : ${myData1}</p>
			<p>session : ${myData2}</p>
			<p>request : ${myData3}</p>
			<p>가까운 곳 request > session > application : ${myName}</p>
			<p>applicationScope : ${applicationScope.myName}</p>
			<p>sessionScope : ${sessionScope.myName}</p>
			<p>requestScope : ${requestScope.myName}</p>
			<hr>
			<ul>
				<li><a href="first">첫번째 서블릿 요청(get)</a></li>
				<li>
					<form action="first" method="get">
						<input type="submit" value="get요청">
					</form>
				</li>
				<li>
					<form action="first" method="post">
						<input type="submit" value="post요청">
					</form>
				</li>
			</ul>
			<hr>
			<ul>
				<li>
					<form action="param" method="get">
						<label>userid: <input type="text" name="userid"></label><br>
						<label>salary: <input type="number" name="salary"></label><br>
						gender: 
						<label><input type="radio" name="gender" value="Male">남자</label>
						<label><input type="radio" name="gender" value="Female">여자</label><br>
						hobby: 
						<label><input type="checkbox" name="hobby" value="게임">게임</label>
						<label><input type="checkbox" name="hobby" value="독서">독서</label>
						<label><input type="checkbox" name="hobby" value="족구">족구</label>
						<label><input type="checkbox" name="hobby" value="농구">농구</label> <br>
						<input type="submit" value="param: get요청">
					</form>
				</li>
			</ul>
		</div>
		
		<hr>
		<a href="auth/loginCheck.do">로그인(상대경로)</a><br>
		<a href="<%= request.getContextPath() %>/auth/loginCheck.do">로그인(절대경로)</a>
		<hr>
		<a href="<%= request.getContextPath() %>/mvc2model/calc">계산기</a>
		<hr>
		<h2>직원 관리</h2>
		<a href="<%= request.getContextPath() %>/emp/emplist.do">직원 조회</a>
		<a href="<%= request.getContextPath() %>/emp/empinsert.do">직원 등록</a>
	</div>
</body>
<script>
	document.getElementById('btn').addEventListener('click', function() {
		var element = document.getElementById('study');
		var display = getComputedStyle(element).display;
		if(display == 'none') {
			element.style.display = 'block';
		} else {
			element.style.display = 'none';
		}
	});
</script>
</html>