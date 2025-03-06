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

	/** 모든 사원 내역 관련 메서드 1번 */
	public EmpDTO[] empListPart1() {
		try {
			dbConnect();
			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			Vector<EmpDTO> arr = new Vector<EmpDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				arr.add(dto);
			}

			EmpDTO dtos[] = new EmpDTO[arr.size()];
			arr.copyInto(dtos);

			return dtos;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 모든 사원 내역 관련 메서드 2번 */
	public ArrayList<EmpDTO> empListPart2() {
		try {
			dbConnect();
			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				arr.add(dto);
			}

			return arr;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}

	}

	public String empListPart3() {
		try {
			dbConnect();
			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			StringBuffer sb = new StringBuffer();

			if (rs.next()) {
				do {
					sb.append("<tr>");
					sb.append("<td>" + rs.getInt("idx") + "</td>");
					sb.append("<td>" + rs.getString("name") + "</td>");
					sb.append("<td>" + rs.getString("email") + "</td>");
					sb.append("<td>" + rs.getString("dept") + "</td>");
					sb.append("</tr>");
				} while (rs.next());
			}

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}

	}
}
