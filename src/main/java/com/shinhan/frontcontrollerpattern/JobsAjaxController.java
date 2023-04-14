package com.shinhan.frontcontrollerpattern;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
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
		JSONArray arr = new JSONArray();
		for (JobVO job : jobList) {
			JSONObject obj = new JSONObject();
			obj.put("job_id", job.getJob_id());
			obj.put("job_title", job.getJob_title());
			arr.add(obj); // [{"job_id":"IT"}, {}, {} ]
		}
		
		JSONObject jobsObj = new JSONObject();
		jobsObj.put("jobList", arr); // {"jobList" : [{"job_id":"IT"}, {}, {} ]}
		return "responseBody:" + jobsObj.toJSONString();
	}

}
