package com.shinhan.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shinhan.util.OracleUtil;
import com.shinhan.vo.AdminVO;
import com.shinhan.vo.EmpVO;

public class AdminDAO {
	Connection conn;
	Statement st;
	PreparedStatement pst; // ? 지원
	CallableStatement cst; // sp 지원
	ResultSet rs;
	
	// 신규 admin 등록
	public int registerAdmin(AdminVO admin) {
		int result = 0;
		String sql = "insert into admins(email, pass, manager_name, pic) values(?, ?, ?, ?)";
		conn = OracleUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, admin.getEmail());
			pst.setString(2, admin.getPass());
			pst.setString(3, admin.getManager_name());
			pst.setString(4, admin.getPic());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, pst, conn);
		}
		
		return result;
	}
	
	// 특정 admin 조회
	public AdminVO loginCheck(String email, String pass) {
		AdminVO admin = null;
		String sql = "select * from admins where email = ? and pass = ? ";
		conn = OracleUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();

			if (rs.next()) {
				admin = new AdminVO(email, rs.getString("manager_name"), pass, rs.getString("pic"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, pst, conn);
		}

		return admin;
	}
	
	// 중복 체크
	public int dupCheck(String email) {
		int cnt = 0;
		String sql = "select count(*) from admins where email = ? ";
		conn = OracleUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();

			while (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, pst, conn);
		}

		return cnt;
	}
	
	// 3명 이름순으로 admin 조회
	public List<AdminVO> selectThreeAdmin() {
		List<AdminVO> adminList = new ArrayList<>();
		String sql = "select * from (select * from admins order by manager_name desc) where rownum <= 3";
		conn = OracleUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				AdminVO admin = new AdminVO();
				admin.setEmail(rs.getString(1));
				admin.setManager_name(rs.getString(2));
				admin.setPass(rs.getString(3));
				admin.setPic(rs.getString(4));
				adminList.add(admin);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return adminList;
	}

}
