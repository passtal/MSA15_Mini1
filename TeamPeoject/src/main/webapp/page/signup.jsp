<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>  
<%
request.setAttribute("dp1", "member");
request.setAttribute("dp2", "signup");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
	<div class="member_wrap">
		<div class="mem_inner">
			<ul class="tabIdx tab_st flex">
				<li class="idx on" data-wrap="wrap" data-idx="wrap1"><a href="javascript:void(0)">개인회원</a></li>
				<li class="idx" data-wrap="wrap" data-idx="wrap2"><a href="javascript:void(0)">기업회원</a></li>				
			</ul>
			
			<!-- 개인회원 -->
			<div class="conIdx on" data-wrap="wrap" data-idx="wrap1">
				<div class="wrap_in">
					<form action="${root}/signup" name="signupForm" method="post" enctype="multipart/form-data">
						<ul class="form_st">
							<li>
								<div class="mem_tit"><span class="tt s1">이용약관 동의</span></div>
								<ul class="agree">
									<li class="all">
										<label class="label_st"> 
											<input class="all_check" type="checkbox" onclick="AllChkNew($(this))" /><span class="tt">전체 동의</span>
										</label>
									</li>									
									<li>
										<div class="flex wrap vc toggleWrap">
											<label class="label_st"> 
												<input type="checkbox" class="ag_check agree1" name="agree1" value="" /><span class="tt">이용약관에 동의</span> <span class="c_red">(필수)</span>
											</label> 
											<a href="javascript:void(0)" class="more mgL" onclick="toggleClass(this)"></a>
											<div class="agree_box ps05 fill">
												<div class="con h1">
													<p><strong>이용약관 제목</strong></p>
													<p>이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 </p>
													<p>이용약관 내용이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 </p>													
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="flex wrap vc toggleWrap">
											<label class="label_st"> 
												<input type="checkbox" class="ag_check agree2" name="agree2" value="" /><span class="tt">개인정보처리방침에 동의</span> <span class="c_red">(필수)</span>
											</label> 
											<a href="javascript:void(0)" class="more mgL" onclick="toggleClass(this)"></a>
											<div class="agree_box ps05 fill">
												<div class="con h1">개인정보처리방침 내용</div>
											</div>
										</div>
									</li>
									<li>
										<label class="label_st"> 
											<input type="checkbox" class="ag_check smsing" name="contact" value="" /><span class="tt">이벤트, 프로모션 알림 메일 및 SMS 수신</span> <span class="c_gray">(선택)</span>
										</label>
									</li>
								</ul>
							</li>
						</ul>
						
						<ul class="form_st">
							<li>								
								<div class="mem_tit in">
									<span class="tt s1 fit">회원정보 입력</span>
									<div class="ess_tt"><span class="ess"></span><span class="tt">필수 입력정보</span></div>
								</div>								
							</li>
							<li>
								<div class="mem_tit"><span class="tt">이메일</span><span class="ess"></span></div>
								<div class="in">
									<input type="text" class="input_st fit" name="user_id" id="user_id">
		    						<button type="button" class="input_st c4 re" onclick="clickIdCheck()">중복확인</button>	
								</div>
							</li>
							<li>
								<div class="mem_tit"><span class="tt">비밀번호</span><span class="ess"></span></div>
								<div class="in">
									<input type="password" class="input_st fit" name="password" id="password">
								</div>
								<div class="input_tt">영문자, 숫자, 특수문자를 포함하여 8자 이상으로 입력해주세요.</div>
							</li>
							<li>
								<div class="mem_tit"><span class="tt">비밀번호 확인</span><span class="ess"></span></div>
								<div class="in">
									<input type="password" class="input_st fit" name="password_confirm" id="password_confirm">
								</div>
							</li>
							<li>
								<div class="mem_tit"><span class="tt">닉네임</span><span class="ess"></span></div>
								<div class="in">
									<input type="text" class="input_st fit" name="username" id="username">
		    						<button type="button" class="input_st c4 re" onclick="clickUserNameCheck()">중복확인</button>
								</div>
								<div class="input_tt">한글 또는 영문 20자 이내로 입력해주세요.</div>
							</li>
							<li>
								<div class="mem_tit"><span class="tt">나이</span><span class="ess"></span></div>
								<div class="in">
									<input type="number" class="input_st fit" name="age" id="age">
								</div>
							</li>
							<li>
								<div class="mem_tit"><span class="tt">성별</span><span class="ess"></span></div>
								<div class="label_wrap">
									<label class="label_st"> 
										<input type="radio" name="sex" value="male" /><span class="tt">남</span>
									</label>
									<label class="label_st"> 
										<input type="radio" name="sex" value="female" /><span class="tt">여</span>
									</label> 
									<label class="label_st"> 
										<input type="radio" name="sex" value="undisclosed" /><span class="tt">공개안함</span>
									</label> 
								</div>
							</li>
							<li>
								<div class="mem_tit"><span class="tt">프로필 이미지</span><span class="ess"></span></div>
								<div class="in">
									<input type="file" class="input_st fit" name="profileImg">
								</div>
							</li>
							<li class="btn_wrap">								
								<button type="button" class="input_st s1 c1" onclick="checkUser()">회원가입</button>
								<button type="button" class="input_st s1 c1 re btn btn-lg btn-secondary" onclick="history.back()">취소</button>
							</li>
						</ul>
					</form>
				</div>			
			</div>
			
			<!-- 기업회원 -->
			<div class="conIdx" data-wrap="wrap" data-idx="wrap2">
				<div class="wrap_in">
					<form action="${root}/signup" name="" method="post" enctype="multipart/form-data">
						bbb
					</form>
				</div>	
			</div>
		</div>
	</div>
</main>	
<!-- 본문 end -->	    


<!-- TODO: 에러 메시지 출력 -->
<jsp:include page="/layout/script.jsp" />	
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
	
	// 약관 전체 동의 체크박스
	function AllChkNew(obj) {
		if($(obj).parents("form").find(".all_check").prop("checked") == true) {
			$(obj).parents("form").find(".ag_check").prop("checked", true);
		}else {
			$(obj).parents("form").find(".ag_check").prop("checked", false);
		}
	}
	
	$(".ag_check").change(function(){
		var agr1 = $(this).parents("form").find(".agree1").prop("checked");
		var agr2 = $(this).parents("form").find(".agree2").prop("checked");		
		var agr3 = $(this).parents("form").find(".smsing").prop("checked");
		if(agr1==true && agr2==true && agr3==true){
			$(this).parents("form").find(".all_check").prop("checked",true);
		}else{
			$(this).parents("form").find(".all_check").prop("checked",false);
		}
	});
</script>
<jsp:include page="/layout/footer.jsp" />