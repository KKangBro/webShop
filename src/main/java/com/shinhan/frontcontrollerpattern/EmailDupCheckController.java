package com.shinhan.frontcontrollerpattern;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shinhan.model.AdminService;

public class EmailDupCheckController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String page = "";

		if (method.equals("GET")) { // GET
			String email = request.getParameter("email");
//			System.out.println(email);
			AdminService service = new AdminService();
			int rst = service.dupCheck(email);
			
			page = "responseBody:" + rst;
		} else { // POST
			
		}
		return page;
	}

}
