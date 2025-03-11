<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.yong.member.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
String search_col = request.getParameter("search_col");
String search_text = request.getParameter("search_text");
%>
<style>
h2 {
	text-align: center;
}

#result {
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
	width: 700px;
}

table th {
	background-color: skyblue;
}
</style>
</head>
<body>
	<h2>검색 결과</h2>
	<table id="result">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>E-mail</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
			ArrayList<MemberDTO> arr = mdao.mamberFind(search_col, search_text);
			if (arr == null || arr.size() == 0) {
			%>
			<tr>
				<td colspan="8" align="center">등록된 회원이 없습니다.</td>
			</tr>
			<%
			} else {
			for (int i = 0; i < arr.size(); i++) {
			%>
			<tr>
				<td><%=arr.get(i).getIdx()%></td>
				<td><%=arr.get(i).getId()%></td>
				<td><%=arr.get(i).getPwd()%></td>
				<td><%=arr.get(i).getName()%></td>
				<td><%=arr.get(i).getEmail()%></td>
				<td><%=arr.get(i).getTel()%></td>
				<td><%=arr.get(i).getAddr()%></td>
				<td><%=arr.get(i).getJoindate()%></td>
			</tr>

			<%
			}
			}
			%>
		</tbody>
	</table>

</body>
</html>