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
			<ul class="tab_st flex">
				<li class="${type eq 'ROLE_USER' ? 'on' : ''}"><a href="?type=ROLE_USER">개인회원</a></li>
				<li class="${type eq 'ROLE_OWNER' ? 'on' : ''}"><a href="?type=ROLE_OWNER">기업회원</a></li>				
			</ul>
			<c:choose>
				<c:when test="${ type == 'ROLE_USER' }">				
					<!-- 개인회원 -->					
					<%@ include file="/page/inc_signup_user.jsp" %>				
				</c:when>
				<c:when test="${ type == 'ROLE_OWNER' }">
					<!-- 기업회원 -->
					<%@ include file="/page/inc_signup_owner.jsp" %>	
				</c:when>
			</c:choose>			
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