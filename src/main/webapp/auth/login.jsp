<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- https://inpa.tistory.com/entry/CSS-%F0%9F%92%8D-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%8A%A4%ED%83%80%EC%9D%BC-%F0%9F%96%8C%EF%B8%8F-%EB%AA%A8%EC%9D%8C -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css" type="text/css">
<script src='https://kit.fontawesome.com/a076d05399.js' ></script>
</head>
<body>
	<h2>Weekly Coding Challenge #1: Sign in/up Form</h2>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="<%= request.getContextPath() %>/auth/signup.do" method="post">
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span>
				<input type="text" name="manager_name" placeholder="Name" />
				<input type="email" name="email" placeholder="Email" />
				<input type="password" name="pass" placeholder="Password" />
				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<!-- 주소를 호출 -->
			<form action="<%= request.getContextPath() %>/auth/loginCheck.do" method="get" enctype="application/x-www-form-urlencoded">
				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span>
				<input type="email" name="email" placeholder="Email" />
				<input type="password" name="pass" placeholder="Password" /> <a href="#">Forgot your password?</a>
				<button>Sign In</button>
				<!-- <input type="submit" value="Sign In"> -->
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal 	info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<script src="<%= request.getContextPath() %>/js/login.js" type="text/javascript"></script>
</body>
</html>