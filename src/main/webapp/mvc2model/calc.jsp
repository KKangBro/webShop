<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<style>
	form, input, select, button {
		font-size: 17px;
	}
	
	input {
		width: 80px;
	}
</style>
</head>
<body>
	<h1>계산기</h1>
	
	<form action="calc" method="post">
		<label>입력1: <input type="number" name="su1" value="${su1}"></label>
		<!-- 
		<select name="op">
			<option ${op == "+" ? "selected" : ""}>+</option>
			<option ${op == "-" ? "selected" : ""}>-</option>
			<option ${op == "*" ? "selected" : ""}>*</option>
			<option ${op == "/" ? "selected" : ""}>/</option>
		</select>
		 -->
		 <select name="op">
			<option id="plus">+</option>
			<option id="sub">-</option>
			<option id="multi">*</option>
			<option id="div">/</option>
		</select>
		<label>입력2: <input type="number" name="su2" value="${su2}"></label>
		<button>=</button>
		<input type="number" value="${rst}">
	</form>
	
	
	<script>
	var op = `${op}`;
	var element;
	switch (op) {
	case '+':
		element = document.getElementById('plus');
		break;
	case '-':
		element = document.getElementById('sub');
		break;
	case '*':
		element = document.getElementById('multi');
		break;
	case '/':
		element = document.getElementById('div');
		break;
	}
	if(element)
		element.setAttribute('selected', 'selected');
	
</script>
</body>
</html>