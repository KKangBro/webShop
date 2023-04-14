package com.shinhan.frontcontrollerpattern;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

public class AdminsAjaxController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");

		// 모든 job 조회하기
		AdminService aService = new AdminService();
		List<AdminVO> adminList = aService.selectThreeAdmin();
		request.setAttribute("adminList", adminList);
		
		JSONArray arr = new JSONArray();
		for (AdminVO admin : adminList) {
			JSONObject obj = new JSONObject();
			obj.put("email", admin.getEmail());
			obj.put("manager_name", admin.getManager_name());
			obj.put("pass", admin.getPass());
			obj.put("pic", admin.getPic());
			arr.add(obj);
		}
		
		JSONObject jobsObj = new JSONObject();
		jobsObj.put("adminList", arr);
		return "responseBody:" + jobsObj.toJSONString();
	}

}
