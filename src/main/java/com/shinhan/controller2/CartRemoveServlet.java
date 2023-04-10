package com.shinhan.controller2;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartViewServlet
 */
@WebServlet("/cart/cartremove.do")
public class CartRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 기존 세선을 얻기
		HttpSession session = request.getSession(false);
		session.removeAttribute("cart"); // 특정 속성만 지우기
//		session.invalidate(); //세선에 저장된 모든 data를 지우기
		
		response.sendRedirect("addCart.do");
	}

}
