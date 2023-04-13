<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../common/commonfiles.jsp" %>
</head>
<body>
	<h1>JSTL 연습 1</h1>
	<%@include file="../common/header.jsp" %>
	<hr>
	
	<p>contextPath(application에 저장되어있음! from header.jsp) : ${path}</p>
	<hr>
	
	<c:set var="happy" value="${param.jumsu}"/>
	
	<c:set var="happy1" value="1" scope="page"/>
	<c:set var="happy2" value="2" scope="request"/>
	<c:set var="happy3" value="3" scope="session"/>
	<c:set var="happy4" value="4" scope="application"/>
	
	<h2>점수는 ${happy}</h2>
	
	<p>page: ${happy1}</p>
	<p>request: ${happy2}</p>
	<p>session: ${happy3}</p>
	<p>application: ${happy4}</p>
	<hr>
	
	<c:forEach begin="1" end="10" step="1" var="su">
		<p>${su }</p>
	</c:forEach>
</body>
</html>