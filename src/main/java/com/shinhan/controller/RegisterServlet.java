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

@WebServlet("/auth/signup.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String manager_name = request.getParameter("manager_name");
		// get 방식은 parameter가 넘어올때 url에 encoding돼서 들어온다.
		// post 방식은 parameter가 넘어올때 요청문서의 body에 들어온다. 한글이 깨짐.
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		AdminService service = new AdminService();
		AdminVO admin = new AdminVO(email, manager_name, pass);
		int result = service.registerAdmin(admin);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); // 응답 문서의 body부분에 출력된다.
		
		if (result == 1) {
			out.print("<h1>계정 등록 성공</h1>");
		} else {
			//response.sendRedirect("login.jsp"); // 재요청
			out.print("<h1>계정 등록 실패</h1>");
		}
		response.addHeader("refresh", "2;login.jsp");
	}

}
