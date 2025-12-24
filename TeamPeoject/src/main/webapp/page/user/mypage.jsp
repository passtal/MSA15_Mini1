<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
</head>
<body>
	<main>
    <h1>내 정보</h1>
    
    <img src="${root}${loginUser.profileImg}" width="150px" height="150px">
    
    <p>아이디: ${loginUser.userId}</p>
    <p>이름(닉네임): ${loginUser.username}</p>
    <p>나이: ${loginUser.age}</p>
    <p>성별: ${loginUser.sex}</p>
    
    <a href="${root}/user/update" class="btn">회원정보 수정</a>
</main>
</body>
</html>