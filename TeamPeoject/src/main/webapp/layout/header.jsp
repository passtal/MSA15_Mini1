<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<nav>
	<div class="container">
	    <a href="${ root }/">Home</a>
	    <button >
	    	<span>버튼</span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${ root }/board/list">맛집소개</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${ root }/board/list">리뷰</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${ root }/board/list">공지사항</a>
				</li>
			</ul>
			<ul class="navbar-nav d-flex align-items-center px-3">
	       
				<c:choose>
					<c:when test="${ empty loginId }">
						<!-- 비로그인 시 -->
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${ root }/login">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="TeamProject" href="${ root }/signup">회원가입</a>
					</c:when>
						
					<c:otherwise>
						<!-- 로그인 시 -->
						<li class="nav-item">
							<div class="dropdown">
								<a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="${ root }/static/img/avatar1.png" alt="" width="32" height="32" class="rounded-circle me-2">
									<strong>${ loginId }</strong>
								</a>
								<ul>
									<li><a href="${ root }/users/my">마이 페이지</a></li>
									<li><a href="${ root }/users/update">회원정보 수정</a></li>
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