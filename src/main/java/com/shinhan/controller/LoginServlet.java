package com.shinhan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

// http://localhost:9090/webShop
@WebServlet("/auth/loginCheck.do") // URL mapping주소를 정의
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext app = request.getServletContext();
		Object obj = app.getAttribute("visitor");
		
		int todayVisit = -1;
		if (obj == null) {
			todayVisit = 1;
		} else {
			todayVisit = (Integer)obj;
			todayVisit++;
		}
		
		app.setAttribute("visitor", todayVisit);
		
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"); // <input name="email">
		String pass = request.getParameter("pass"); // <input name="pass">
		AdminService service = new AdminService();
		AdminVO admin = service.loginCheck(email, pass);

		System.out.println("IP: " + request.getRemoteAddr() + "\tLogin Attempted.");
		if (admin == null) {
			System.out.println("Login Failed..");
		} else {
			System.out.println("[Login]\t" + admin);
		}

		// 응답 문서 만들기. header + ResponseBody에 문자열을 출력하기
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (admin == null) {
			// 응답문서에 header부분을 작성해서 내려간다. 3초 후 재요청한다는 의미
			response.setHeader("refresh", "1;loginCheck.do"); // 3초 후 /auth/loginCheck.do로 이동
			/*
				addHeader: 지정된 이름과 값으로 응답 헤더를 추가합니다. 이 방법을 사용하면 응답 헤더에 여러 값을 가질 수 있습니다.
				setHeader: 지정된 이름과 값으로 응답 헤더를 설정합니다. 헤더가 이미 설정된 경우 새 값이 이전 값을 덮어씁니다.
			 */
			out.print("<h1>Login Failed!</h1>");
			out.print("<h4>로그인 페이지로 이동합니다..</h4>");

			return;
		}
		
		// 로그인한 사람의 정보를 저장하기
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", admin);
		
		
		String path = request.getContextPath();
		String encodeName = URLEncoder.encode(admin.getManager_name(), "UTF-8");
		// 응답문서의 주소창을 바꾼다.
		response.sendRedirect(path + "/emp/emplist.do?myname=" + encodeName);
		
		// 재요청
//		out.print("<script>"
//				+ "alert('로그인 성공이야~');"
//				+ "location.href='"
//				+ path
//				+ "/emp/emplist.do';"
//				+ "</script>");
		
	}

}
