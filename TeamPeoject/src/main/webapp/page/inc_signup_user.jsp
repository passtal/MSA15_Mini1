<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 개인회원 -->	
<div class="wrap_in">
	<form action="${root}/signup" name="signupForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" value="${type}">
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
								<div class="con h1"><%@ include file="policy/inc_agree.jsp" %></div>
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
								<div class="con h1"><%@ include file="policy/inc_privacy.jsp" %></div>
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
					<span class="tt s1 fit">개인회원정보 입력</span>
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
					<input type="number" class="input_st fit" name="age" id="age" required>
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
				<div class="mem_tit"><span class="tt">프로필 이미지</span></div>
				<div class="in">
					<input type="file" class="input_st fit" name="profileImg">
				</div>
			</li>
			<li class="btn_wrap">								
				<button type="button" class="input_st s1 c1" onclick="checkUser()">회원가입</button>
				<button type="button" class="input_st s1 c1 re" onclick="history.back()">취소</button>
			</li>
		</ul>
	</form>
</div>