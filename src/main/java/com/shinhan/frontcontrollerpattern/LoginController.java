package com.shinhan.frontcontrollerpattern;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

public class LoginController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String page = "";

		if (method.equals("GET")) { // GET
			page = "login.jsp";
		} else { // POST
			ServletContext app = request.getServletContext();
			String email = request.getParameter("email"); // <input name="email">
			String pass = request.getParameter("pass"); // <input name="pass">
			AdminService service = new AdminService();
			AdminVO admin = service.loginCheck(email, pass);

			System.out.println("IP: " + request.getRemoteAddr() + "\tLogin Attempted...");
			if (admin == null) {
				System.out.println("Login Failed!\n");
			} else {
				System.out.println("Login Success!\n" + admin + "\n");
			}

			Object obj = app.getAttribute("userList");
			List<AdminVO> userList = null;
			if (admin != null) { // 로그인 성공
				if (obj == null) {
					userList = new ArrayList<>();
				} else {
					userList = (List<AdminVO>) obj;
				}
				userList.add(admin);
				app.setAttribute("userList", userList);

				System.out.println("---------------------------User List---------------------------");
				for (AdminVO vo : userList)
					System.out.println(vo);
				System.out.println("---------------------------------------------------------------");

				// 로그인한 사람의 정보를 저장하기
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", admin);

				page = "redirect:" + request.getContextPath() + "/emp/emplist.do";
			} else {// 로그인에 실패했을시
				page = "redirect:loginCheck.do";
			}

		}

		return page;
	}

}
