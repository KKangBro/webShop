package com.shinhan.frontcontrollerpattern;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.shinhan.model.CompanyService;
import com.shinhan.vo.JobVO;

public class JobsAjaxController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String page = "";

		// 모든 job 조회하기
		CompanyService cService = new CompanyService();
		List<JobVO> jobList = cService.jobSelectAll();
		request.setAttribute("jobList", jobList);
		
		// JavaScript로 작성된 ajax부분에 전달하는 방법1 -- JSP 만들어서 보낸다. (html로 디자인)
//		page = "jobView.jsp"; // forward
//		return page;
		
		// JavaScript로 작성된 ajax부분에 전달하는 방법2 -- JSON 만들어서 보낸다. (js로 디자인)
		
		
		JSONObject obj = new JSONObject();
		obj.put("job_id", "IT234");
		obj.put("job_title", "IT programmer423");
		return "responseBody:" + obj.toJSONString();
	}

}
