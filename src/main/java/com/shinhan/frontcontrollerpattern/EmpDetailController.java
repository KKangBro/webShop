package com.shinhan.frontcontrollerpattern;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shinhan.model.CompanyService;
import com.shinhan.model.EmpService;
import com.shinhan.util.DateUtil;
import com.shinhan.vo.EmpVO;

public class EmpDetailController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		String page = "empDetail.jsp";
		HttpServletRequest request = (HttpServletRequest) data.get("request");

		if (method.equals("GET")) { // GET
			// 직원 정보 상세 페이지 보여주기
			int empid = Integer.parseInt(request.getParameter("empid"));
			
			EmpService eService = new EmpService();
			EmpVO emp = eService.selectById(empid);
			
			request.setAttribute("emp", emp);
			
			// 부서, 직책, 매니저를 선택하고자 한다.
			CompanyService cService = new CompanyService();
			request.setAttribute("deptList", cService.deptSelectAll());
			request.setAttribute("managerList", cService.managerSelectAll());
			request.setAttribute("jobList", cService.jobSelectAll());
		} else { // POST
			// 직원 정보 수정하기
			EmpVO emp = makeEmp(request);
			
			EmpService service = new EmpService();
			String message = service.empUpdate(emp);
			System.out.println(message);
			
			page = "redirect:emplist.do";
		}
		
		return page;
	}

	private EmpVO makeEmp(HttpServletRequest request) throws UnsupportedEncodingException  {
//		request.setCharacterEncoding("utf-8"); // filter에서 수행했음
		String employee_id = request.getParameter("employee_id");
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
		emp.setEmployee_id(Integer.parseInt(employee_id)); // auto increment..
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