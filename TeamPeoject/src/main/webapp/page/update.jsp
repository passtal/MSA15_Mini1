<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<main>
		<h1>회원 정보 수정</h1>
		<form action="${root}/user/update" name="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${loginUser.no}">
			<div>
				<label>프로필 이미지</label><br>
				<div>
					<c:if test="${loginUser.profileImg == null}">
						<img src="${root}/static/img/default-profile.png" id="preview" class="profile-preview" width="100px" height="100px">
					</c:if>
					<c:if test="${loginUser.profileImg != null}">
						<img src="${root}${loginUser.profileImg}" id="preview" class="profile-preview" width="100px" height="100px">
					</c:if>
				</div>
				<br>
				<input type="file" name="profileImg" onchange="readURL(this);">
			</div>
			
			<hr>
			
			<div>
				<label>이메일 (아이디)</label>
				<input type="text" name="user_id" value="${loginUser.userId}">
			</div>
			<div>
				<label>새 비밀번호 (변경시에만 입력)</label>
				<input type="password" name="password" id="password" placeholder="비밀 번호 유지시 공백">
			</div>
			<div>
				<label>새 비밀번호 확인</label>
				<input type="password" id="password_confirm">
			</div>
			<div>
				<label>닉네임</label>
				<input type="text" name="username" id="username" value="${loginUser.username}">
			</div>
			<div>
				<label>나이</label>
				<input type="number" name="age" id="age" value="${loginUser.age}">
			</div>
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
			<div>
				<button type="submit" class="btn-submit">수정 완료</button>
			</div>
		</form>
	</main>
	
	<jsp:include page="/layout/footer.jsp"/>
    <jsp:include page="/layout/script.jsp"/>
    
    <script>
    /* 유효성 검사 추가 */
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function checkUpdate() {
            let form = document.updateForm;
            let userId = document.getElementById("user_id").value
            let userIdCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
           	
            if(!userIdCheck.test(userId)) {
   				alert('이메일 형식이 올바르지 않습니다.')
   				return;
   			}

			let check = await idCheck() {
				if( check ) {
					alert('중복된 이메일 입니다.')
				} else {
					alert('사용 가능한 이메일 입니다.')
				}
			}
						            
            let pw = document.getElementById("password").value;
            let pwConfirm = document.getElementById("password_confirm").value;
            let username = document.getElementById("username").value;
            let nameCheck = /^(?=.*\S)[^\r\n]{1,20}$/
            
   			if(!nameCheck.test(username)) {
   				alert('닉네임은 20자 이내로 입력해주세요.')
   				return;
   			}

            if(!username) {
                alert("닉네임을 입력해주세요.");
                return;
            }
            
			let check = await usernameCheck() {
				if( check ) {
					alert('중복된 닉네임 입니다.')
				} else {
					alert('사용 가능한 닉네임 입니다.')
				}
			}
			
            
            if(pw.length > 0) {
                if(pw != pwConfirm) {
                    alert("비밀번호가 일치하지 않습니다.");
                    return;
                }
            }
            form.submit();
        }
    </script>
</body>
</html>