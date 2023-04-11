<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="login-div">
	<img alt="img" src="../images/alien.png" width="30px" height="30px" style="border-radius: 8px; vertical-align : middle;">
	${loginUser.getManager_name()} 님, 반갑습니다!
	<input type="button" value="로그아웃" id="btn-logout">
</div>