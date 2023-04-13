<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	
	#container {
		width: 90%;
		margin: 20px auto;
	}
	
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
	}
	
	#test-div {
		/* display: none; */
		font-size: 10px;
		margin-bottom: 5px;
	}
	
	fieldset {
		font-weight: bold;
		background-color: #f0f0f0;
		width: 450px;
		margin: 20px auto;
	}
	
	legend {
		background-color: lightblue;
		font-weight: bold;
		font-size: 1.5em;
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
	
	input[name='hire_date'] {
		width: 153px;
	}
	
	input[name='employee_id'] {
		background-color: gray;
		font-style: italic;
	}
	
	form input:not(input[name='employee_id']) {
		background-color: #f0f0f0;
	}
	
	.btn-div {
		width: 158px;
		margin: 0px 20px 0px auto;
	}
	
	.btn-div > input {
		background: lightblue;
		color: black;
		font-weight: bold;
		padding: 5px 10px;
		transition:0.2s;
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
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">직원 등록</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="<%= request.getContextPath() %>/emp/empinsert.do">
						<fieldset>
							<ul>
								<li>
									<label>EMPLOYEE ID<input type="text" name="employee_id" value="auto increment.." readonly></label>
								</li>
								<li>
									<label>FIRST NAME<input type="text" name="first_name" autofocus placeholder="KyungYun"></label>
								</li>
								<li>
									<label>LAST NAME<input type="text"name="last_name" placeholder="Kim" required></label>
								</li>
								<li>
									<label>EMAIL<input type="email" name="email" required placeholder="kky@gmail.com"></label>
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
									<label>SALARY<input type="number" name="salary" placeholder="4000"></label>
								</li>
								<li>
									<label>COMMISSION PCT<input type="number" step="0.1" name="commission_pct" value="0.2"></label>
								</li>
								<li>
									<label>MANAGER ID<input type="number" name="manager_id" value="205"></label>
								</li>
								<li>
									<label>DEPARTMENT ID<input type="number" name="department_id" value="110"></label>
								</li>
							</ul>
							<hr>
							<div class="btn-div">
								<input id="btn_submit" type="submit" value="확인">
								<input id="btn_reset" type="reset" value="취소">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>