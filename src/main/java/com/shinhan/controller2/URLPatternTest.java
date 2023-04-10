package com.shinhan.controller2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/url/test") // 이름이 일치하는 URL pattern
//@WebServlet("/url/test/*") // 폴더 형태
@WebServlet("*.go") // 확장자 URL pattern인 경우 폴더와 같이 사용 안됨.
public class URLPatternTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("getContextPath: " + request.getContextPath());
		System.out.println("getRequestURI: " + request.getRequestURI());
		System.out.println("getRequestURL: " + request.getRequestURL());
		System.out.println("getMethod: " + request.getMethod());
		System.out.println("getRemoteAddr: " + request.getRemoteAddr());
		System.out.println("getServletPath: " + request.getServletPath());
		System.out.println("getPathInfo: " + request.getPathInfo());
		// url/test/*
		// 요청한 URL 이름 뒷부분의 url
		System.out.println("getQueryString: " + request.getQueryString());
		// 파라메터들 나옴. aa=100
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
