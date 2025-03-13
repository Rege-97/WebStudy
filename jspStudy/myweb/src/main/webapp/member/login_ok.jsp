<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String remember = request.getParameter("remember");

int login = mdao.loginCheck(id, pwd);

if (login == 1 || login == 2) {
%><script>
	location.href = "login.jsp";
	window.alert("아이디 또는 비밀번호가 틀렸습니다.")
</script>
<%
} else if (login == 3) {
session.setAttribute("id", id);
String name = mdao.getUserInfo(id);
if (remember != null) {
	session.setAttribute("remember", id);
} else {
	session.removeAttribute("remember");
}
%><script>
	window.alert("<%=name%>" + "님 로그인 환영합니다");
	opener.window.location.reload();
	window.self.close();
</script>
<%
}
%>
