<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	@font-face {
	    font-family: 'TAEBAEKmilkyway';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/TAEBAEKmilkyway.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	* {
		font-family: 'TAEBAEKmilkyway';
		font-weight: bold;
		line-height: 2em;
		letter-spacing: 0.2em;
	}

	h1, h2, a {
		width: 400px;
		margin: 0px auto;
		text-align: center;
	}

</style>
</head>
<body>
	<h2>로그인한 사용자 : ${loginUser.manager_name}</h2>
	<%
	Object obj = session.getAttribute("cart");
	Map<String, Integer> cart;
	
	if (obj == null) {
		cart = new HashMap<>();
	} else {
		cart = (Map<String, Integer>) obj;
	}
	
	if (cart.size() == 0){
		out.println("<h1>cart is empty..</h1>");
	} else {
		out.println("<h1>" + cart + "</h1>");
	}
	%>
	<a href="addCart.do">계속 쇼핑</a>
</body>
</html>