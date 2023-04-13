<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JavaBean 이용하기</h1>
	<%
	/* String email = request.getParameter("email");
	String name = request.getParameter("manager_name");
	String pass = request.getParameter("pass"); */
	
	//AdminVO vo = new AdminVO(email, name, pass);
	%>
	<!--
	useBean : 객체 생성
	setProperty : setter 수행, "set" + "Email" => setEmail()
	-->
	<jsp:useBean id="vo" class="com.shinhan.vo.AdminVO"></jsp:useBean>
	<jsp:setProperty property="email" name="vo"/>
	<jsp:setProperty property="manager_name" name="vo"/>
	<jsp:setProperty property="pass" name="vo"/>
	
	<jsp:getProperty property="email" name="vo"/><br>
	<jsp:getProperty property="manager_name" name="vo"/><br>
	<jsp:getProperty property="pass" name="vo"/>
	<hr>
	
	<jsp:useBean id="vo2" class="com.shinhan.vo.AdminVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo2"/>
	
	<%=vo2 %>
	<hr>
	
	<button onclick="location.href = 'adminInsert.jsp';">Back</button>
</body>
</html>