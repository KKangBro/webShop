package com.shinhan.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.shinhan.util.OracleUtil;
import com.shinhan.vo.AdminVO;

public class AdminDAO {
	Connection conn;
	Statement st;
	PreparedStatement pst; // ? 지원
	CallableStatement cst; // sp 지원
	ResultSet rs;
	int rstCount; // insert, update, delete 건수
	
	// 특정 직원 조회
		public AdminVO loginCheck(String email, String pass) {
			AdminVO admin = null;
			String sql = "select manager_name from admins where email = ? and pass = ? ";
			conn = OracleUtil.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, email);
				pst.setString(2, pass);
				rs = pst.executeQuery();

				if (rs.next()) {
					admin = new AdminVO(email, rs.getString("manager_name"), pass);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				OracleUtil.dbDisconnect(rs, pst, conn);
			}

			return admin;
		}

}
