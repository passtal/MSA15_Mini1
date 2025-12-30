<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>  
<%
request.setAttribute("dp1", "member");
request.setAttribute("dp2", "login");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
	<div class="member_wrap">
		<div class="mem_inner w1">
			<div class="mem_tit ac">
				<span class="tt s2">
					<c:set var="navKey" value="${dp1}_${dp2}" />
					${nav[navKey]}
				</span>							
			</div>	
			<form action="${ root }/login" name="loginForm" method="post">
				<ul class="form_st ps">					
					<li>
						<div class="mem_tit"><span class="tt">이메일</span></div>
						<div class="in">
							<input type="text" class="input_st s1 fit" name="user_id" id="user_id" placeholder="아이디" value="${ user_id }">							
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">비밀번호</span></div>
						<div class="in">							
							<input type="password" class="input_st s1 fit" name="password" id="password" placeholder="비밀번호">							
						</div>
					</li>
					<li>
						<div class="label_wrap gap1">
							<label class="label_st"> 						
								<c:if test="${ rememberId == null || rememberId == '' }">
						   			<input type="checkbox" name="rememberId">
						   		</c:if>
								<c:if test="${ rememberId != null && rememberId == 'on' }">
						       		<input type="checkbox" name="rememberId" checked>
						  		</c:if>
						  		<span class="tt">아이디 저장</span>
							</label>
							
							<label class="label_st"> 
								<input type="checkbox" name="rememberMe">
			      				<span class="tt">자동 로그인</span>
							</label>
						</div>
					</li>
					<li class="btn_wrap">								
						<button type="submit" class="input_st s1 c1 w1">로그인</button>
						<a href="${ root }/signup" class="input_st s1 c1 re w1">회원가입</a>
					</li>
				</ul>
			</form>							
		</div>
	</div>
</main> 
<!-- 본문 end -->	 

<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />