package com.shinhan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvc2model/calc")
public class CalculatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// page 보여주기....주소창의 주소를 변경한다. (재요청)
		// response.sendRedirect("calc.jsp");

		// page 보여주기....주소창은 그대로 두고 위임하기
		RequestDispatcher rd = request.getRequestDispatcher("calc.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		// 계산하기
		int num1 = Integer.parseInt(request.getParameter("su1"));
		int num2 = Integer.parseInt(request.getParameter("su2"));
		String op = request.getParameter("op");
		System.out.println(op);

		int rst = 0;
		double rstDouble = 0.0;
		switch (op) {
		case "+":
			rst = num1 + num2;
			break;
		case "-":
			rst = num1 - num2;
			break;
		case "*":
			rst = num1 * num2;
			break;
		case "/":
			if (num1 % num2 == 0)
				rst = num1 / num2;
			else
				rstDouble = (double) num1 / (double) num2;
			break;
		default:
			break;
		}

		request.setAttribute("su1", num1);
		request.setAttribute("su2", num2);
		request.setAttribute("op", op);

		if (op.equals("/") && num1 % num2 != 0) {
			request.setAttribute("rst", rstDouble);
		} else {
			request.setAttribute("rst", rst);
		}

		RequestDispatcher rd = request.getRequestDispatcher("calc.jsp");
		rd.forward(request, response);

//		response.setContentType("text/plain;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.print("계산 결과는.. "+rst);
		
	}

}
