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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shinhan.vo.AdminVO;

@WebFilter(urlPatterns = {"/emp/*", "/cart/*"})
public class LoginCheckFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public LoginCheckFilter() {
        super();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		if (req.getServletPath().equals("/auth/loginCheck.do") ||
			req.getServletPath().equals("/auth/signup.do") || 
			req.getServletPath().equals("/auth/emailDupCheck.do")) {
			// do_nothing
		} else {
			HttpSession session = req.getSession();
			AdminVO user = (AdminVO) session.getAttribute("loginUser");
			if (user == null) {
				res.sendRedirect(req.getContextPath() + "/auth/loginCheck.do");
				return;
			}
		}

		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
