<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<!-- 상단으로 구분 -->
<script>
	function loginPopup() {
		window.open('/myweb/member/login.jsp', 'popup','width=400 ,height=150');
	}
</script>
<%
String loginCheck = "로그인";
String joinCheck = "회원가입";

String id = (String) session.getAttribute("id");
if (id != null) {
	String name = mdao.getUserInfo(id);
	loginCheck = name + "님 로그인 중";
	joinCheck = "로그아웃";
}
%>

<header>
	<div>
		<a <%=id == null ? "onclick='loginPopup()'" : ""%>><%=loginCheck%></a>| <a <%=id == null ? " href='/myweb/member/memberJoin.jsp'" : "href='/myweb/member/logout.jsp'"%>><%=joinCheck%></a>
	</div>
	<h1>JSP Study Site</h1>
	<!-- 메뉴 영역으로 구분 -->
	<nav>
		<ul>
			<li><a href="/myweb/index.jsp">Home</a></li>
			<li><a href="/myweb/profile.jsp">Profile</a></li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">파일업로드</a></li>
			<li><a href="#">방명록</a></li>
		</ul>
	</nav>
	<hr>
</header>