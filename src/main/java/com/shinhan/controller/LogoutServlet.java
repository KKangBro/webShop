package com.shinhan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shinhan.vo.AdminVO;

//@WebServlet("/auth/logout.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		ServletContext app = request.getServletContext();
		HttpSession session = request.getSession();
		
		Object obj = app.getAttribute("userList");
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		List<AdminVO> userList = null;
		
		if(obj != null) {
			userList = (List<AdminVO>) obj;
			userList.remove(admin);
			app.setAttribute("userList", userList);
		}
		userList.add(admin);
		app.setAttribute("userList", userList);
		
		// 기존 세선을 얻기
		session = request.getSession(false);
		session.invalidate(); //세선에 저장된 모든 data를 지우기
	}

}
