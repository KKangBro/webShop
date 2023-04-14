package com.shinhan.frontcontrollerpattern;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shinhan.vo.AdminVO;

public class LogoutController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String page = "";

		if (method.equals("GET")) { // GET
			ServletContext app = request.getServletContext();
			HttpSession session = request.getSession();
			
			Object obj = app.getAttribute("userList");
			AdminVO admin = (AdminVO) session.getAttribute("loginUser");
			List<AdminVO> userList = null;
			
			if(obj != null) {
				userList = (List<AdminVO>) obj;
				userList.remove(admin);
				app.setAttribute("userList", userList);
			}
			
			session = request.getSession(false);
			session.invalidate();
			
			page = "responseBody:OK";
		} else { // POST
			
		}
		
		return page;
	}

}
