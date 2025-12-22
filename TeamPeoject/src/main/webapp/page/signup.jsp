<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SignUp</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<main>
		<h1>회원 가입</h1>
		<form action="${root}/signup" name="signupForm" method="post" enctype="multipart/form-data">
		    <!-- TODO: 이메일(user_id) -->
		    <div>
		    	<label>이메일</label>
			    <input type="text" name="user_id" id="user_id">
			    <button type="button" onclick="clickIdCheck()">중복확인</button>
		    </div>
		    <!-- TODO: 비밀번호 -->
		    <div>
		    	<label>비밀번호</label>
			    <input type="password" name="password" id="password">
		    </div>
		    <div>
		    	<label>비밀번호 확인</label>
			    <input type="password" name="password_confirm" id="password_confirm">
		    </div>
		    <!-- TODO: 닉네임(username) -->
		    <div>
		    	<label>닉네임</label>
			    <input type="text" name="username" id="username">
			    <button type="button" onclick="clickUserNameCheck()">중복확인</button>
		    </div>
		    <!-- TODO: 나이 -->
		    <div>
		    	<label>나이</label>
			    <input type="number" name="age" id="age">
		    </div>
		    <!-- TODO: 성별 -->
		    <div>
		    	<label>성별</label>
		    	<div>
		    		<label>남</label>
				    <input type="radio" name="sex" value="male">
		    		<label>여</label>
				    <input type="radio" name="sex" value="female">
		    		<label>공개안함</label>
				    <input type="radio" name="sex" value="undisclosed">
		    	</div>
		    </div>
		    <!-- TODO: 프로필 이미지 -->
		    <div>
		    	<input type="file" name="profileImg">
		    </div>
			<div>
				<input type="button" value="회원가입" onclick="checkUser()" />
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary">취소</a>
			</div>	
		</form>
	</main>
		    


    <!-- TODO: 에러 메시지 출력 -->
    <jsp:include page="/layout/footer.jsp"/>
    <jsp:include page="/layout/script.jsp"/>
	<script>
		async function clickIdCheck() {

			// 아이디(이메일) 유효성 검사
			let userId = document.getElementById("user_id").value
			let userIdCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
			if(!userIdCheck.test(userId)) {
				alert('이메일 형식이 올바르지 않습니다.')
				return;
			}
			
			let check = await idCheck()
			
			if( check ) {
				alert('중복된 이메일 입니다.')
			} else {
				alert('사용 가능한 이메일 입니다.')
			}
		}
		
		async function clickUserNameCheck() {

			// 아이디(이메일) 유효성 검사
			let username = document.getElementById("username").value
			let nameCheck = /^(?=.*\S)[^\r\n]{1,20}$/
			if(!nameCheck.test(username)) {
				alert('닉네임은 20자 이내로 입력해주세요.')
				return;
			}
			
			let check = await usernameCheck()
			
			if( check ) {
				alert('중복된 닉네임 입니다.')
			} else {
				alert('사용 가능한 닉네임 입니다.')
			}
		}
	</script>
	
</body>
</html>