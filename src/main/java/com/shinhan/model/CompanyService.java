package com.shinhan.model;

import java.util.List;

import com.shinhan.vo.DeptVO;
import com.shinhan.vo.EmpVO;
import com.shinhan.vo.JobVO;

public class CompanyService {
	CompanyDAO dao = new CompanyDAO();

	// 매니저 전체 조회
	public List<EmpVO> managerSelectAll() {
		return dao.managerSelectAll();
	}
	
	// 직책 전체 조회
	public List<JobVO> jobSelectAll() {
		return dao.jobSelectAll();
	}
	
	// 부서 전체 조회
	public List<DeptVO> deptSelectAll() {
		return dao.deptSelectAll();
	}
	
}
