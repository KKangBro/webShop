package com.shinhan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

// http://localhost:9090/webShop
@WebServlet("/auth/loginCheck.do") // URL mapping주소를 정의
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email"); // <input name="email">
		String pass = request.getParameter("pass"); // <input name="pass">
		AdminService service = new AdminService();
		AdminVO admin = service.loginCheck(email, pass);

		System.out.println(admin == null ? "로그인 실패.." : admin);

		// 응답 문서 만들기. header + ResponseBody에 문자열을 출력하기
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (admin == null) {
			response.setHeader("refresh", "3;login.jsp"); // 3초 후 auth/login.jsp로 이동
			out.print("<h1>Login Failed!</h1>");
			out.print("<h4>3초 후 로그인 페이지로 이동합니다..</h4>");

			return;
		}
		out.print("<h1>Login Infomation</h1>");
		out.printf("<h2>이메일은 %s</h2>", email);
		out.printf("<h2>이름은 %s</h2>", admin.getManager_name());
	}

}
