package com.shinhan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shinhan.model.AdminService;

@WebServlet("/auth/emailDupCheck.do")
public class EmailDupCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println(email);
		AdminService service = new AdminService();
		int rst = service.dupCheck(email);
		
//		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(rst);
	}

}
