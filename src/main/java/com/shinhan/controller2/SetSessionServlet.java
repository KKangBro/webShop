package com.shinhan.controller2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shinhan.vo.AdminVO;

@WebServlet("/SetSessionServlet")
public class SetSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		HttpSession session = request.getSession(); // 최초 접속인 경우, session이 없음. 그러면 자동으로 생성한다(true)
		System.out.println(session.getId());
		System.out.println(session.getMaxInactiveInterval());
		System.out.println(session.isNew());
		
		session.setAttribute("key1", userid);
		session.setAttribute("key2", 100);
		session.setAttribute("key3", new AdminVO("clamdownman@mail.com", "침착맨", "1234"));
		
		response.setContentType("text/html;charset=utf-8"); // <meta charset="utf-8">
		PrintWriter out = response.getWriter();
		out.write("<h1>세션 저장 연습</h1>");
		
		
	}


}
