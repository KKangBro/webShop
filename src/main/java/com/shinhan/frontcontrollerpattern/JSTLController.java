package com.shinhan.frontcontrollerpattern;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shinhan.vo.AdminVO;

public class JSTLController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		// /로 시작하면 절대경로. 그렇지 않으면 상대경로.
		// /webShop이 생략되어있으므로 현재는 모두가능하다.
		String page = "jsptest/jstlTest3.jsp";
		
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession();
		application.setAttribute("myName", "김길동");
		session.setAttribute("myName", "박길동");
		request.setAttribute("myName", "홍길동");
		
		List<AdminVO> adminList = new ArrayList<>();
		adminList.add(new AdminVO("abc1@mail.com", "김1", "1234"));
		adminList.add(new AdminVO("abc2@mail.com", "김2", "1234"));
		adminList.add(new AdminVO("abc3@mail.com", "김3", "1234"));
		request.setAttribute("admins", adminList);
		
		request.setAttribute("score", 99);
		request.setAttribute("today", new Date());
		
		if (method.equals("GET")) { // GET
			
		} else { // POST
			
		}
		return page;
	}

}
