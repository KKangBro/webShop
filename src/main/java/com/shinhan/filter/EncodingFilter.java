package com.shinhan.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("*.do")
public class EncodingFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public EncodingFilter() {
    		System.out.println("EncodingFilter 생성자");
    }

	public void destroy() {
		System.out.println("EncodingFilter 소멸자");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 요청 filter
		request.setCharacterEncoding("utf-8");
		
		// 강제 형변환: 자식 = (자식)부모
		HttpServletRequest req = (HttpServletRequest) request;
		System.out.println("EncodingFilter에서 getContextPath : " + req.getContextPath());
		System.out.println("EncodingFilter에서 getRequestURI : " + req.getRequestURI());
		System.out.println("EncodingFilter에서 getRequestURL : " + req.getRequestURL());
		
		// 서블릿으로 요청과 응답이 간다.
		chain.doFilter(request, response);
		// 응답 filter
		// 브라우저에 응답하러 가고있는 중
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("EncodingFilter init");
	}

}
