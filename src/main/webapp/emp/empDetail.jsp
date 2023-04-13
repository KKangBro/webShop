<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>직원 상세 정보</title>
<%@ include file="../common/commonfiles.jsp" %>
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
	
	h1 {
		text-align: center;
		margin: 30px auto 10px;
	}
	
	#container {
		width: 90%;
		margin: 20px auto;
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
	
	input[name='employee_id'],
	input[name='first_name'],
	input[name='last_name'],
	input[name='phone_number'],
	input[name='commission_pct'] {
		background-color: gray;
		font-style: italic;
	}
	
	input[name='email'],
	input[name='hire_date'],
	input[name='job_id'],
	input[name='manager_id'],
	input[name='salary'],
	input[name='department_id'] {
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
	<h1>^오^</h1>
	<%--
	${} : getAttribute()
	${emp}					<%= request.getAttribute("emp") %>
	${emp.employee_id}		<%= request.getAttribute("emp").getEmployee_id() %>
	--%>
	<div id="container">
		<%@include file="../common/header.jsp" %>
		<form method="post" action="<%= request.getContextPath() %>/emp/empDetail.do">
			<fieldset>
			<legend>직원 상세 정보</legend>
				<ul>
					<li>
						<label>EMPLOYEE ID<input type="text" name="employee_id" value="${emp.employee_id}" readonly></label>
					</li>
					<li>
						<label>FIRST NAME<input type="text" name="first_name" value="${emp.first_name}" readonly></label>
					</li>
					<li>
						<label>LAST NAME<input type="text" name="last_name" value="${emp.last_name}" readonly></label>
					</li>
					<li>
						<label>EMAIL<input type="email" name="email" value="${emp.email}" autofocus></label>
					</li>
					<li>
						<label>PHONE NUMBER<input type="tel" name="phone_number" pattern="010-[0-9]{4}-[0-9]{4}" value="${emp.phone_number}" readonly></label>
					</li>
					<li>
						<label>HIRE DATE<input type="date" name="hire_date" value="${emp.hire_date}"></label>
					</li>
					<li>
						<label>JOB ID<input type="text" name="job_id" value="${emp.job_id}" readonly></label>
					</li>
					<li>
						<label>SALARY<input type="number" name="salary" value="${emp.salary}"></label>
					</li>
					<li>
						<label>COMMISSION PCT<input type="number" step="0.1" name="commission_pct" value="${emp.commission_pct}" readonly></label>
					</li>
					<li>
						<label>MANAGER ID<input type="number" name="manager_id" value="${emp.manager_id}"></label>
					</li>
					<li>
						<label>DEPARTMENT ID<input type="number" name="department_id" value="${emp.department_id}"></label>
					</li>
				</ul>
				<hr>
				<div class="btn-div">
					<input id="btn_submit" type="submit" value="수정">
					<input id="btn_reset" type="reset" value="취소">
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>