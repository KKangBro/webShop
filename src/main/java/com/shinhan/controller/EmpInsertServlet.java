package com.shinhan.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shinhan.model.EmpService;
import com.shinhan.util.DateUtil;
import com.shinhan.vo.EmpVO;

@WebServlet("/emp/empinsert.do")
public class EmpInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원 등록 페이지 보여주기
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("empInsert.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력된 파라메터를 읽어서 실제로 DB에 저장하기 위해서
		EmpVO emp = makeEmp(request);
		
		EmpService service = new EmpService();
		System.out.println(service.empInsert(emp));
		
		// 재요청하기: Browser로 내려가서 새로운 요청으로 가기
		response.sendRedirect("emplist.do");
	}

	private EmpVO makeEmp(HttpServletRequest request) throws UnsupportedEncodingException  {
//		request.setCharacterEncoding("utf-8"); // filter에서 수행했음.
		//String employee_id = request.getParameter("employee_id");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String hire_date = request.getParameter("hire_date");
		String job_id = request.getParameter("job_id");
		String salary = request.getParameter("salary");
		String commission_pct = request.getParameter("commission_pct");
		String manager_id = request.getParameter("manager_id");
		String department_id = request.getParameter("department_id");

		EmpVO emp = new EmpVO();
		emp.setEmployee_id(0); // auto increment..
		emp.setFirst_name(first_name);
		emp.setLast_name(last_name);
		emp.setEmail(email);
		emp.setPhone_number(phone_number);
		emp.setHire_date(DateUtil.convertToDate(hire_date));
		emp.setJob_id(job_id);
		emp.setSalary(Double.parseDouble(salary));
		emp.setCommission_pct(Double.parseDouble(commission_pct));
		emp.setManager_id(Integer.parseInt(manager_id));
		emp.setDepartment_id(Integer.parseInt(department_id));
		System.out.println(emp);
		
		return emp;
	}

}
