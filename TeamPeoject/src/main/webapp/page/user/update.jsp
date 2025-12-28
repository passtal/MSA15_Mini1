<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "mypage");
request.setAttribute("dp2", "modify");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
	<div class="member_wrap">
		<div class="mem_inner">
			<div class="mem_tit ac">
				<span class="tt s2">
					<c:set var="navKey" value="${dp1}_${dp2}" />
					${nav[navKey]}
				</span>							
			</div>
			
			<form action="${root}/user/update" name="updateForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${loginUser.no}">
				<ul class="form_st ps">
					<li>
						<div class="mem_tit"><span class="tt">프로필 이미지</span></div>
						<div class="in">
							<div class="profile flex wrap vc fit">
								<div class="img imgfix">
									<c:if test="${loginUser.profileImg == null}">
										<img src="${root}/static/img/default-profile.png" id="preview" class="profile-preview">
									</c:if>
									<c:if test="${loginUser.profileImg != null}">
										<img src="${root}${loginUser.profileImg}" id="preview" class="profile-preview">
									</c:if>	
								</div>
								<input type="file" class="input_st fit" name="profileImg" onchange="readURL(this);">
							</div>
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">이메일 (아이디)</span></div>
						<div class="in">
							<div class="mem_txt"><strong class="tt">${loginUser.userId}</strong></div>							
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">새 비밀번호 (변경시에만 입력)</span></div>
						<div class="in">
							<input type="password" class="input_st fit" name="password" id="password" placeholder="비밀 번호 유지시 공백">					
						</div>
						<div class="input_tt">영문자, 숫자, 특수문자를 포함하여 8자 이상으로 입력해주세요.</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">새 비밀번호 확인</span></div>
						<div class="in">												
							<input type="password" class="input_st fit" id="password_confirm">
						</div>						
					</li>
					<li>
						<div class="mem_tit"><span class="tt">닉네임</span></div>
						<div class="in">												
							<input type="text" class="input_st fit" name="username" id="username" value="${loginUser.username}">
							<button type="button" class="input_st c4 re" onclick="clickUserNameCheck()">중복확인</button>
						</div>	
						<div class="input_tt">한글 또는 영문 20자 이내로 입력해주세요.</div>					
					</li>
					<li>
						<div class="mem_tit"><span class="tt">나이</span></div>
						<div class="in">												
							<input type="number" class="input_st fit" name="age" id="age" value="${loginUser.age}">
						</div>						
					</li>
					<li>
						<div class="mem_tit"><span class="tt">성별</span></div>
						<div class="label_wrap">
							<label class="label_st"> 
								<input type="radio" name="sex" value="male"><span class="tt">남</span>
							</label>
							<label class="label_st"> 
								<input type="radio" name="sex" value="female"><span class="tt">여</span>
							</label> 
							<label class="label_st"> 
								<input type="radio" name="sex" value="undisclosed"><span class="tt">공개안함</span>
							</label> 
						</div>					
					</li>
					<li>
						<div class="mem_tit"><span class="tt">이벤트, 프로모션 알림 메일 및 SMS 수신</span></div>
						<div class="label_wrap">
							<label class="label_st"> 
								<input type="checkbox" name="" value=""><span class="tt">동의</span>
							</label>
						</div>						
					</li>
					<li class="btn_wrap">
						<button type="submit" class="input_st s1 c1">수정 완료</button>
					</li>
				</ul>
			</form>
		</div>
	</div>	
</main>
<!-- 본문 end -->	  

<jsp:include page="/layout/script.jsp"/>
<script>
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
        let pw = document.getElementById("password").value;
        let pwConfirm = document.getElementById("password_confirm").value;
        let username = document.getElementById("username").value;

        if(!username) {
            alert("닉네임을 입력해주세요.");
            return;
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
<jsp:include page="/layout/footer.jsp" />