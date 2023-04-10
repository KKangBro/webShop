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

@WebServlet("/cart/addCart.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
		rd.forward(request, response);
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String product = request.getParameter("product");
		if (product == null)
			response.sendRedirect("addCart.do");
		else {
			int count = Integer.parseInt(request.getParameter("count"));

			HttpSession session = request.getSession(); // 있으면 얻고, 없으면 새로 만들어라.
			Object obj = session.getAttribute("cart");
			Map<String, Integer> cart;
	
			if (obj == null) {
				cart = new HashMap<>();
				cart.put(product, count);
				session.setAttribute("cart", cart);
			} else {
				cart = (Map<String, Integer>) obj;
				int ogCnt = cart.get(product) == null ? 0 : cart.get(product);
				cart.put(product, ogCnt + count);
			}
			
			response.sendRedirect("addCart.do");
		}
		
	}

}
