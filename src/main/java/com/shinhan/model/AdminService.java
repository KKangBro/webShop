package com.shinhan.model;

import com.shinhan.vo.AdminVO;

public class AdminService {
	AdminDAO dao = new AdminDAO();
	
	// 신규 admin 등록
	public int registerAdmin(AdminVO admin) {
		return dao.registerAdmin(admin);
	}
	
	// 특정 admin 조회
	public AdminVO loginCheck(String email, String pass) {
		return dao.loginCheck(email, pass);
	}
	
	// 중복 체크
	public int dupCheck(String email) {
		return dao.dupCheck(email);
	}
}
