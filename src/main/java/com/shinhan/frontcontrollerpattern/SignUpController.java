package com.shinhan.frontcontrollerpattern;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

public class SignUpController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String page = "";

		if (method.equals("GET")) { // GET
			
		} else { // POST
			System.out.println("IP: " + request.getRemoteAddr()+"\tRegistered.");
			String manager_name = request.getParameter("manager_name");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");

			AdminService service = new AdminService();
			AdminVO admin = new AdminVO(email, manager_name, pass);
			int result = service.registerAdmin(admin);
			
			page = "redirect:loginCheck.do";
		}
		return page;
	}

}
