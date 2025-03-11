<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2 {
	text-align: center;
}

fieldset {
	width: 400px;
	margin: 0px auto;
}

table {
	margin: 0px auto;
}
</style>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<form name="memberFind" action="memberFind.jsp">
				<h2>회원검색</h2>
				<fieldset>
					<legend>검색</legend>
					<table id="search">
						<tr>
							<td><select name="search_col">
									<option value="id">아이디
									<option value="name">이름
									<option value="email">이메일
									<option value="tel">전화번호
							</select></td>
							<td><input type="text" name="search_text"></td>
							<td><input type="submit" value="검색"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
		<article>
			<jsp:include page="result.jsp">
				<jsp:param value='<%=request.getParameter("search_col")%>'
					name="search_col" />
				<jsp:param value='<%=request.getParameter("search_text")%>'
					name="search_text" />
			</jsp:include>
		</article>
	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>