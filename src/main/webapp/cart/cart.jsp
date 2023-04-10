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

	h2, p {
		text-align: center;
	}

	#wrap {
		width: 500px;
		margin: 0px auto;
	}
	
	fieldset {
		width: 300px;
		margin: 0px auto;
		border: 2px solid gray;
		padding: 10px;
		border-radius: 3px;
	}

	input[type="number"] {
		display: flex;
		margin: 10px auto 5px auto;
		width: 30px;
		text-align: center;
	}
	
	label {
		margin: 0px auto 30px;
	}
	
	#btn-div {
		display: flex;
		justify-content: flex-start;
	}
	
	input {
		width: 60px;
	}
	
	input[value="담기"] {
		margin: 0px auto 0px 20px;
	}
	
	input[value="보기"] {
		margin: 0px auto 0px auto;
	}
	
	input[value="비우기"] {
		margin: 0px 20px 0px auto;
	}
</style>
</head>
<body>
	<div id="wrap">
		<h2>장바구니 담기</h2>
		<p>로그인한 사람: ${loginUser.manager_name}</p>
		<form action="addCart.do" method="post">
			<fieldset>
				<legend>장바구니</legend>
				<label><input type="radio" name="product" value="gimbab"> 김밥</label>
				<br>
				<label><input type="radio" name="product" value="hambuger"> 햄버거</label>
				<br>
				<label><input type="radio" name="product" value="cola"> 콜라</label>
				<br>
				<input type="number" name="count" value="1">
				<hr>
				<div id="btn-div">
					<input type="submit" value="담기">
					<input type="button" value="보기" onclick="location.href='cartview.do'">
					<input type="button" value="비우기" onclick="location.href='cartremove.do'">
				</div>
			</fieldset>
		</form>
	</div>
	
</body>
</html>