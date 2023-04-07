<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="3;auth/login.jsp"> -->
<title>INDEX</title>
</head>
<body>
	<h1>JSP/Servlet Project ^오^ 무야호~!</h1>
	<hr>
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
	<hr>
	<a href="auth/loginCheck.do">로그인(상대경로)</a><br>
	<a href="<%= request.getContextPath() %>/auth/loginCheck.do">로그인(절대경로)</a>
	<hr>
	<a href="<%= request.getContextPath() %>/mvc2model/calc">계산기</a>
	<hr>
	<h2>직원 관리</h2>
	<a href="<%= request.getContextPath() %>/emp/emplist.do">직원 조회</a>
	<a href="<%= request.getContextPath() %>/emp/empinsert.do">직원 등록</a>
</body>
</html>