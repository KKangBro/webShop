<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록</title>
<style type="text/css">
	@font-face {
	    font-family: 'EF_watermelonSalad';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_watermelonSalad.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	* {
		font-family: 'EF_watermelonSalad';
		letter-spacing: 0.2em;
	}
	
	body {
		background-color: lightgray;
	}
	
	h1 {
		text-align: center;
		margin: 30px auto;
	}
	
	fieldset {
		font-weight: bold;
		background-color: white;
		margin: 20px auto;
		width: 450px;
	}
	
	legend {
		background-color: lightblue;
		font-weight: bold;
	}
	
	ul {
		list-style: none;
		padding-left:0px;
	}
	
	li {
		line-height: 2em;
		margin: 10px;
	}
	
	label input {
		line-height: 1.7em;
		float: right;
		margin-right: 10px;
		width: 150px;
	}
	
	.btn {
		width: 158px;
		margin: 0px 20px 0px auto;
	
	}
	
	.btn > input {
		background: lightblue;
		color: black;
		font-weight: bold;
		padding: 5px 10px;
		transition:0.5s;
	}
	
	#btn_submit {
		margin: 0px auto 0px 0px;
	}
	
	#btn_reset {
		margin: 0px 0px 0px auto;
		float: right;
	}
	
	#btn_submit:hover {
		background: green;
		color: white;
		font-weight: bolder;
	}
	
	#btn_reset:hover {
		background: red;
		color: white;
		font-weight: bolder;
	}

</style>
</head>
<body>
	<h1>신규 직원을 등록하세요</h1>
	<form method="post" action="<%= request.getContextPath() %>/emp/empinsert.do">
		<fieldset>
		<legend>직원 정보 입력</legend>
			<ul>
				<li>
					<label>EMPLOYEE ID<input type="text" name="employee_id" value="auto increment.." readonly></label>
				</li>
				<li>
					<label>FIRST NAME<input type="text" name="first_name" autofocus value="KyungYun"></label>
				</li>
				<li>
					<label>LAST NAME<input type="text"name="last_name" value="Kim" required></label>
				</li>
				<li>
					<label>EMAIL<input type="email" name="email" required value="kky@gmail.com"></label>
				</li>
				<li>
					<label>PHONE NUMBER<input type="tel" name="phone_number" pattern="010-[0-9]{4}-[0-9]{4}" value="010-1234-1234"></label>
				</li>
				<li>
					<label>HIRE DATE<input type="date" name="hire_date" required></label>
				</li>
				<li>
					<label>JOB ID<input type="text" name="job_id" required value="IT_PROG"></label>
				</li>
				<li>
					<label>SALARY<input type="number" name="salary"></label>
				</li>
				<li>
					<label>COMMISSION PCT<input type="number" step="0.1" name="commission_pct" value="0.2"></label>
				</li>
				<li>
					<label>MANAGER ID<input type="number" name="manager_id" value="100"></label>
				</li>
				<li>
					<label>DEPARTMENT ID<input type="number" name="department_id" value="60"></label>
				</li>
			</ul>
			<hr>
			<div class="btn">
				<input id="btn_submit" type="submit" value="확인">
				<input id="btn_reset" type="reset" value="취소">
			</div>
		</fieldset>
	</form>
</body>
</html>