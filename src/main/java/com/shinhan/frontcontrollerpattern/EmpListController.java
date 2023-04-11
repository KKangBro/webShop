package com.shinhan.frontcontrollerpattern;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shinhan.model.EmpService;
import com.shinhan.vo.AdminVO;
import com.shinhan.vo.EmpVO;

public class EmpListController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) { // GET
			HttpServletRequest request = (HttpServletRequest) data.get("request");
			HttpSession session = request.getSession();
			AdminVO user = (AdminVO) session.getAttribute("loginUser");

			EmpService service = new EmpService();
			List<EmpVO> empList = service.selectAll();

			request.setAttribute("empAll", empList);

			page = "empSelect.jsp";
		} else { // POST

		}

		return page;
	}

}
