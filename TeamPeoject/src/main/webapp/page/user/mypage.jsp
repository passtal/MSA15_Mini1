<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "mypage");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
    <div class="member_wrap">
		<div class="mem_inner">
			<div class="mem_tit ac">
				<span class="tt s2">
					<c:set var="navKey" value="${dp1}" />
					${nav[navKey]}
				</span>							
			</div>
            <ul class="form_st ps">
                <li>
                    <div class="mem_tit"><span class="tt s1">내 정보</span></div>
                    <div class="in">
                        <div class="profile flex wrap vc fit">
                            <div class="img imgfix">
                                <img src="${root}${loginUser.profileImg}">
                            </div>
                            <div class="fit">
                                <div class="mem_tit"><span class="tt">아이디</span></div>	
                                <div class="mem_txt"><strong class="tt">${loginUser.userId}</strong></div>                            
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="mem_tit"><span class="tt">이름(닉네임)</span></div>
                    <div class="in">												
                        <div class="mem_txt"><strong class="tt">${loginUser.username}</strong></div>
                    </div>                   		
                </li>
                <li>
                    <div class="mem_tit"><span class="tt">나이</span></div>
                    <div class="in">												
                        <div class="mem_txt"><strong class="tt">${loginUser.age}</strong></div>
                    </div>                   		
                </li>
                <li>
                    <div class="mem_tit"><span class="tt">성별</span></div>
                    <div class="in">												
                        <div class="mem_txt"><strong class="tt">${loginUser.sex}</strong></div>
                    </div>                   		
                </li>
                <li class="btn_wrap">
                    <button type="button" class="input_st s1 c1" onclick="location.href='${root}/user/update'">회원정보 수정</button>
                    <c:if test="${role == 'ROLE_OWNER' or role == 'ROLE_ADMIN'}">
                    <a href="${ root }/page/map" class="input_st s1 c1 re w1">가게 정보입력</a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</main>
<!-- 본문 end -->	  

<jsp:include page="/layout/script.jsp"/>
<jsp:include page="/layout/footer.jsp" />