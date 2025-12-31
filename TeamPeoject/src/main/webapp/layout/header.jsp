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
					<li><a href="${ root }/user/mypage" class="in flex ac"><span class="tt">${ nav.mypage }</span></a></li>
					<li><a href="${ root }/logout" class="in flex ac"><span class="tt">${ nav.member_logout }</span></a></li>					
				</c:otherwise>
			</c:choose>					
			</ul>
		</div>
	</div>
	<div class="gnb_wrap">
		<div class="box1 inner flex wrap vc">			
			<h1 class="logo"><a href="${ root }/" class="in"><img src="${ root }/static/img/logo.png" alt="logo"></a></h1>
			<nav class="nav_wrap">
				<%@ include file="/layout/gnb.jsp" %> 
			</nav>
			<div class="search_wrap mgL">
				<form action="">
					<div class="search flex vc">
						<input type="text" class="input_st int_txt" placeholder="검색어를 입력해 주세요.">
						<button type="submit" class="input_st int_btn"><span class="mti material-symbols-outlined">search</span></button>
					</div>
				</form>
			</div>
			<div class="side_wrap">			
				<ul class="menu flex vc">					
					<c:choose>
						<c:when test="${ empty loginId }">
							<!-- 비로그인 시 -->							
							<li><a href="${ root }/login" class="in"><span class="mti material-symbols-outlined">person</span></a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 시 -->
							<li class="dropdown toggleWrap jsClick">								
								<a href="javascript:void(0);" class="userInfo" onclick="toggleClass(this)">
									<p class="img imgfix"><img src="${ pageContext.request.contextPath }${ loginUser.profileImg }" alt="profileImg"></p>									
								</a>
								<ul class="list">
									<li class="userWrap">
										<div class="userInfo flex vc">
											<p class="img imgfix"><img src="${ pageContext.request.contextPath }${ loginUser.profileImg }" alt="profileImg"></p>
											<p class="name"><strong class="tt wb2">${loginUser.username}</strong></p>
										</div>
										<div class="userId"><span class="tt wb2">${loginId}</span></div>
									</li>									
									<li><a href="${ root }/user/mypage" class="in"><span class="tt">${ nav.mypage }</span></a></li>
									<li><a href="${ root }/user/update" class="in"><span class="tt">${ nav.mypage_modify }</span></a></li>
									<li><a href="${ root }/logout" class="in"><span class="tt">${ nav.member_logout }</span></a></li>
								</ul>								
							</li>
						</c:otherwise>
					</c:choose>					
					<li><a href="javascript:void(0)" class="in" onclick="toggleClass(this,'html','allGnbOn')"><span class="mti material-symbols-outlined">menu</span></a></li>					
				</ul>
			</div>
		</div>
	</div>
	<!-- 사이드 네비게이션 -->
	<div class="navigation_wrap">
		<div class="close_bg" onclick="toggleClass(this,'html','allGnbOn')"></div>
		<div class="slide_inner">
			<div class="wrap_in flex col">
				<div class="wrap_top flex space vc">
					<div class="logo"><a href="${ root }/" class="in"><img src="${ root }/static/img/logo.png" alt="logo"></a></div>
					<div class="close"><a href="javascript:void(0)" class="in" onclick="toggleClass(this,'html','allGnbOn')"><span class="mti material-symbols-outlined">close</span></a></div>
				</div>
				<c:if test="${not empty loginId}">
					<!-- 로그인 시 -->
					<div class="wrap_user">
						<div class="userWrap">
							<div class="userInfo flex vc">
								<div class="img imgfix"><img src="${ pageContext.request.contextPath }${ loginUser.profileImg }" alt="profileImg"></div>
								<div class="name_in flex col">
									<p class="name"><strong class="tt wb2">${loginUser.username}</strong></p>
									<p class="userId"><span class="tt wb2">${loginId}</span></p>
								</div>
							</div>						
						</div>
					</div>					
				</c:if>
				<div class="wrap_mem">
					<ul class="menu flex">
					<c:choose>
						<c:when test="${ empty loginId }">
							<!-- 비로그인 시 -->	
							<li><a href="${ root }/login" class="in flex ac"><span class="tt">${ nav.member_login }</span></a></li>
							<li><a href="${ root }/signup" class="in flex ac"><span class="tt">${ nav.member_signup }</span></a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 시 -->
							<li><a href="${ root }/user/mypage" class="in flex ac"><span class="tt">${ nav.mypage }</span></a></li>
							<li><a href="${ root }/user/update" class="in flex ac"><span class="tt">${ nav.mypage_modify }</span></a></li>
							<li><a href="${ root }/logout" class="in flex ac"><span class="tt">${ nav.member_logout }</span></a></li>	
						</c:otherwise>
					</c:choose>
					</ul>
				</div>
				<c:if test="${role == 'ROLE_OWNER' or role == 'ROLE_ADMIN'}">
					<!-- 기업회원, 관리자 로그인 시 -->
                	<a href="${ root }/page/map" class="input_st c1 re w1 round">가게 정보입력</a>
                </c:if>
				<div class="wrap_con">
					<%@ include file="/layout/gnb.jsp" %> 
				</div>
				<div class="wrap_bottom">
					<ul class="menu flex wrap">
						<li><a href="javascript:void(0);" class="tt">${ nav.policy_agree }</a></li>
						<li><a href="javascript:void(0);" class="tt point">${ nav.policy_privacy }</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 사이드 네비게이션 end -->	
</header>

<!-- 컨텐츠 start -->
<div id="contents" class="fullMH">

