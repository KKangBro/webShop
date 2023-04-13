<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" scope="application" var="path"/>
<% String company = "신한금융SW아카데미"; %>

<c:if test="${loginUser != null}">
	<div id="login-div">
		<img alt="img" src="${path}/uploads/${loginUser.pic}" width="28px" height="28px">
		<img alt="img" src="${path}/images/alien.png" width="28px" height="28px">
		${loginUser.getManager_name()} 님, 반갑습니다!
		<input id="btn-logout" type="button" value="로그아웃">
	</div>
</c:if>
<c:if test="${loginUser == null}">
	<button onclick="location.href='${path}/auth/loginCheck.do'">로그인</button>
</c:if>

<script>
	$(function() {
		$('#btn-logout').on('click', func_logout);
	});
	
	function func_logout() {
		$.ajax({
			url:'${path}/auth/logout.do',
			success:function(responseData){
				console.log(responseData);
				alert('로그아웃이 정상적으로 처리되었습니다.');
				location.href='${path}/auth/loginCheck.do';
			},
			error:function(message){
				alert(message);					
			}
		});			
	}
</script>

<style>
	#login-div {
		width: 100%;
		margin: 10px 0px;
		text-align: right;
	}
	
	#btn-logout {
		margin: 0px;
	    font-size: 16px;
	    padding: 4px 6px;
	    line-height: normal;
		vertical-align : middle;
	}
	
	img {
		vertical-align : middle;
		border-radius: 8px;
	}
</style>