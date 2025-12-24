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
							<input type="text" class="input_st fit" name="user_id" id="user_id" placeholder="아이디" value="${ user_id }">							
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">비밀번호</span></div>
						<div class="in">							
							<input type="password" class="input_st fit" name="password" id="password" placeholder="비밀번호">							
						</div>
					</li>
					<li>
						<label class="label_st"> 						
							<c:if test="${ rememberId == null || rememberId == '' }">
					   			<input type="checkbox" name="rememberId" id="remember-id">
					   		</c:if>
							<c:if test="${ rememberId != null && rememberId == 'on' }">
					       		<input type="checkbox" name="rememberId" id="remember-id" checked>
					  		</c:if>
						</label>
				      	<span class="form-check-label" for="remember-id">아이디 저장</span>
					</li>
					<li class="btn_wrap">								
						<button type="submit" class="input_st s1 c1">로그인</button>
					</li>
				</ul>
			</form>							
		</div>
	</div>





	<h1>
		<c:set var="navKey" value="${dp1}_${dp2}" />
		${nav[navKey]}
	</h1>
	<form action="${ root }/login" name="loginForm" method="post">
		
	    <!-- TODO: 이메일(user_id) -->
	    <div>
	    	<label>이메일</label>
		    <input type="text" name="user_id" id="user_id" placeholder="아이디" value="${ user_id }">
	    </div>
	    <!-- TODO: 비밀번호 -->
	    <div>
	    	<label>비밀번호</label>
		    <input type="password" name="password" id="password" placeholder="비밀번호">
	    </div>
		<div>
			<div>
				<c:if test="${ rememberId == null || rememberId == '' }">
		   			<input type="checkbox" name="rememberId" id="remember-id">
		   		</c:if>
				<c:if test="${ rememberId != null && rememberId == 'on' }">
		       		<input type="checkbox" name="rememberId" id="remember-id" checked>
		  		</c:if>
		      	<label class="form-check-label" for="remember-id">아이디 저장</label>
		  	</div>
		  	<div>
		      	<input type="checkbox" name="rememberMe" id="remember-me">
		      	<label for="remember-me">자동 로그인</label>
		  	</div>
		</div>
           <div>
               <button type="submit">로그인</button>
               <a href="${ root }/signup">회원가입</a>
           </div>
	</form>
</main> 
<!-- 본문 end -->	   

<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />