<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP/Servlet Project ^오^ 무야호~!</h1>
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
</body>
</html>