<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul>
	<%-- <c:forEach items="${jobList}" var="job"> --%>
	
	<c:forEach begin="1" end="5" var="idx">
		<li>${jobList[idx].job_id} -- ${jobList[idx].job_title}</li>
	</c:forEach>
</ul>