<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
// 1.파라미터 가져오기
String name = request.getParameter("name");

// 2.DB 연동
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "mydb";
String pwd = "1234";

Connection conn = DriverManager.getConnection(url, user, pwd);

String sql = "delete from employee where name=?";
PreparedStatement ps = conn.prepareStatement(sql);

ps.setString(1, name);

int count = ps.executeUpdate();

ps.close();
conn.close();

String msg=count>0?"사원 퇴사 성공!":"사원 퇴사 실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='emp.jsp';
</script>