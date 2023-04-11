package com.shinhan.frontcontrollerpattern;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shinhan.model.EmpService;

public class EmpDeleteController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String page = "";

		if (method.equals("GET")) { // GET
			int empid = Integer.parseInt(request.getParameter("empid"));
			
			EmpService service = new EmpService();
			service.empDelete(empid);
			
			page = "redirect:emplist.do";
		} else { // POST
			
		}
		return page;
	}

}
