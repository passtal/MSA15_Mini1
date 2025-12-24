<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>  
<jsp:include page="/layout/top.jsp" />

<header id="header">
	<div class="util_wrap">
		<div class="box1">
			<ul class="menu flex">
			<c:choose>
				<c:when test="${ empty loginId }">
					<!-- 비로그인 시 -->
					<li><a href="${ root }/login" class="in flex ac"><span class="tt">${ nav.member_login }</span></a></li>
					<li><a href="${ root }/signup" class="in flex ac"><span class="tt">${ nav.member_signup }</span></a></li>
				</c:when>
					
				<c:otherwise>
					<!-- 로그인 시 -->
					<li><a href="${ root }/page/mypage.jsp" class="in flex ac"><span class="tt">${ nav.mypage }</span></a></li>
					<li><a href="${ root }/logout" class="in flex ac"><span class="tt">${ nav.member_logout }</span></a></li>					
				</c:otherwise>
			</c:choose>					
			</ul>
		</div>
	</div>
	<div class="gnb_wrap">
		<div class="box1 inner flex wrap vc">			
			<h1 class="logo"><a href="${ root }/" class="in"><img src="https://placehold.co/140x50" alt="logo"></a></h1>
			<nav class="nav_wrap">
				<%@ include file="/layout/gnb.jsp" %> 
			</nav>
			<div class="search_wrap mgL">
				<form action="">
					<div class="search flex vc">
						<input type="text" class="input_st int_txt" placeholder="검색어를 입력해 주세요.">
						<button type="submit" class="input_st int_btn"><span class="mti material-icons-outlined">search</span></button>
					</div>
				</form>
			</div>
			<div class="side_wrap">			
				<ul class="menu flex vc">					
					<c:choose>
						<c:when test="${ empty loginId }">
							<!-- 비로그인 시 -->							
							<li><a href="${ root }/login" class="in"><span class="mti material-icons-outlined">person</span></a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 시 -->
							<li class="dropdown">								
								<a href="javascript:void(0);" class="userInfo flex vc">
									<p class="img"><img src="${ pageContext.request.contextPath }${ loginUser.profileImg }" alt="profileImg"></p>
									<p class="name"><strong class="tt">${ loginId }</strong></p>
								</a>
								<ul class="list">
									<li><a href="${ root }/page/mypage.jsp" class="in"><span class="tt">${ nav.mypage }</span></a></li>
									<li><a href="${ root }/page/update.jsp" class="in"><span class="tt">${ nav.mypage_modify }</span></a></li>
									<li><a href="${ root }/logout" class="in"><span class="tt">${ nav.member_logout }</span></a></li>
								</ul>								
							</li>
						</c:otherwise>
					</c:choose>					
					<li><a href="" class="in"><span class="mti material-icons-outlined">menu</span></a></li>					
				</ul>
			</div>
		</div>
	</div>	
</header>

<nav class="dn">
	<div class="container">
	    <a href="${ root }/">Home</a>
	    <button >
	    	<span>버튼</span>
	    </button>
	    <div>
			<ul>
				<li>
					<a href="${ root }/board/list">맛집소개</a>
				</li>
				<li>
					<a href="${ root }/board/list">리뷰</a>
				</li>
				<li>
					<a href="${ root }/board/list">공지사항</a>
				</li>
			</ul>
			<ul class="navbar-nav d-flex align-items-center px-3">
	       
				<c:choose>
					<c:when test="${ empty loginId }">
						<!-- 비로그인 시 -->
						<li>
							<a href="${ root }/login">로그인</a>
						</li>
						<li >
							<a href="${ root }/signup">회원가입</a>
					</c:when>
						
					<c:otherwise>
						<!-- 로그인 시 -->
						<li>
							<div>
								<a>
									<img src="${ pageContext.request.contextPath }${ loginUser.profileImg }" alt="profileImg" width="32" height="32">
									<strong>${ loginId }</strong>
								</a>
								<ul>
									<li><a href="${ root }/page/mypage.jsp">마이 페이지</a></li>
									<li><a href="${ root }/page/update.jsp">회원정보 수정</a></li>
									<li><a href="${ root }/logout">로그아웃</a></li>
								</ul>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<!-- 컨텐츠 start -->
<div id="contents" class="fullMH">

