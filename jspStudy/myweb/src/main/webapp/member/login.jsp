<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String remember=(String)session.getAttribute("remember");

%>
</head>
<body>
	<form name="login" action="login_ok.jsp">
		<fieldset style="width: 200px; height: 100px; margin: 0px auto;">
			<legend>로그인</legend>
			<table>
				<tr>
					<td>
						<label>ID</label>
					</td>
					<td>
						<input type="text" name="id" <%=remember!=null?"value='"+remember+"'":"" %>>
					</td>
				</tr>
				<tr>
					<td>
						<label>PW</label>
					</td>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>
			</table>
				<input type="checkbox" name="remember" value="on" <%=remember!=null?"checked":"" %> >
				ID 기억
				<input type="submit" value="로그인">
		</fieldset>

	</form>

</body>
</html>