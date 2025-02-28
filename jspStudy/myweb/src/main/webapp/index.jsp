<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<!-- 컨텐츠 범위지정 -->
	<section>
		<!-- 컨텐츠 영역 -->
		<article id="mainImg">
			<img src="img/main.jpg" alt="메인이미지">
		</article>
		<!-- 컨텐츠 영역 -->
		<article id="mainSubmenu">
			<h2>아래에 계속 추가됨</h2>
			<ul>
				<li><a href="formTest.jsp">form테스트</a></li>
				<li><a href="cal.jsp">사칙 계산기</a></li>
			</ul>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>