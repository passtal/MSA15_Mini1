<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<main>
		<div>
			<a href="${ root }/signup?type=ROLE_USER">일반 회원으로 가입</a>
		</div>
		<div>
			<a href="${ root }/signup?type=ROLE_OWNER">사업자 회원으로 가입</a>
		</div>
	</main>
</body>
</html>