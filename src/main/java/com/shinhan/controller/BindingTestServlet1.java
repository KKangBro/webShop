package com.shinhan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bind1")
public class BindingTestServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// application영역(ServletContext)에 저장 (WAS가 살아있는 동안 유효)
		// session영역(Browser가 살아있는 동안 유효)
		// request영역(request가 살아있는 동안 유효)
		ServletContext application = request.getServletContext();
		HttpSession browser = request.getSession();
		
		application.setAttribute("myData1", "application에 저장함");
		browser.setAttribute("myData2", "session에 저장함");
		request.setAttribute("myData3", "request에 저장함");
		
		application.setAttribute("myName", "박명수");
		browser.setAttribute("myName", "정형돈");
		request.setAttribute("myName", "노홍철");

		RequestDispatcher rd;
		rd = request.getRequestDispatcher("bind2");
		rd.forward(request, response);
		
//		response.setContentType("text/html;charset=utf-8");
//		response.getWriter().append("<h1>bind1</h1>Served at: <br>")
//			.append(request.getContextPath())
//			.append((String)application.getAttribute("myData1")+"<br>")
//			.append((String)browser.getAttribute("myData2")+"<br>")
//			.append((String)request.getAttribute("myData3")+"<br>");
		
	}

}
