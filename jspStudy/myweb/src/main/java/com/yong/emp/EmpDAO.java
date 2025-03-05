package com.yong.emp;

import java.sql.*;
import java.util.*;

public class EmpDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public EmpDAO() {
		System.out.println("EmpDAO 객체 생성됨!");
	}

	public void dbConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "mydb";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

			} catch (Exception e2) {

			}
		}
	}

	/** 사원 등록 관련 메서드 */
	public int empAdd(EmpDTO dto) {
		try {
			dbConnect();
			String sql = "insert into employee values(employee_idx_sq.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
			}
		}

	}

	/** 사원 퇴사 관련 메서드 */
	public int empDel(EmpDTO dto) {
		try {
			dbConnect();
			String sql = "delete from employee where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

	}
}
