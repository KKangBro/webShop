<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL 연습 3</h1>
	<p>myName (request>session>application) : ${myName}</p>
	<p>requestScope myName : ${requestScope.myName}</p>
	<p>sessionScope myName : ${sessionScope.myName}</p>
	<p>applicationScope myName : ${applicationScope.myName}</p>
	<hr>
	
	<ul>
		<c:set var="sum" value="0"/>
		<c:forEach items="${admins}" var="admin" varStatus="status">
			<c:set var="sum" value="${sum+100}"/>
			<li style="color:${status.first ? 'red' : 'blue'};">${status.first} : ${status.last} : ${sum} : ${status.index} : ${status.count} : ${admin} --- ${admin.manager_name}</li>
		</c:forEach>
	</ul>
	<hr>
	
	<h2>score평가</h2>
	<c:if test="${score >= 90}">
		<p>합격입니다.</p>
	</c:if>
	<c:if test="${score < 90}">
		<p>불합격입니다.</p>
	</c:if>
	<hr>
	
	<c:choose>
		<c:when test="${score >= 90}">
			<p>A학점</p>
		</c:when>
		<c:when test="${score >= 80}">
			<p>B학점</p>
		</c:when>
		<c:otherwise>
			<p>C학점</p>
		</c:otherwise>
	</c:choose>
	<hr>
	
	<h2>c:out 연습</h2>
	<c:out value="<<월요일>> 좋아~"/><br>
	<!-- <<월요일>> 좋아~ -->
	<hr>
	
	<c:set value="10000000000" var="price"/>
	1. price : ${price} <br>
	2. price : <fmt:formatNumber value="${price}" groupingUsed="true" type="currency" currencySymbol="￦"/> <br>
	3. 오늘 : ${today} <br>
	3. 오늘 : <fmt:formatDate value="${today}" pattern="YYYY-MM-dd hh:mm:ss"/> <br>
	3. 오늘 : <fmt:formatDate value="${today}" dateStyle="full"/> <br>
	3. 오늘 : <fmt:formatDate value="${today}" timeStyle="hh:mm"/> <br>
	<hr>
	
	<h2>JSTL에서 문자열 함수 사용하기</h2>
	<p>myName: ${myName}</p>
	<p>myName: ${fn:substring(myName, 0, 1)}</p>
	<p>myName: ${fn:length(myName)}</p>
	
</body>
</html>