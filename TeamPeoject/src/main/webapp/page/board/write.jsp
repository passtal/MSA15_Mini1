<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp0", "pop");
%>
<jsp:include page="/layout/top.jsp" />
<!--본문 -->
<div class="popWrap popForm">
	<div class="popTit"><span class="tit"><i class="t1">맛집 리뷰 작성</i></span><a href="javascript:parent.layerClose();" class="popClose"><i class="mti material-symbols-outlined">close</i></a></div>
	<div class="popIn scrollst">
		<div class="popCon">
			<form action="${pageContext.request.contextPath}/board/write" method="post" class="review-form">		
			<input type="hidden" name="place_no" value="${param.place_no}">
			<div class="member_wrap">	
				<ul class="form_st">
					<li>
						<div class="mem_tit"><span class="tt">닉네임</span></div>
						<div class="in">
							<input type="text" class="input_st fit" name="username" id="username" value="${loginUser.username}" disabled="disabled">						
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">평점 (1 ~ 5)</span></div>
						<div class="in">
							<input type="number" class="input_st fit" id="rating" name="rating" min="1.0" max="5.0" step="1.0" value="5.0">
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">리뷰작성</span></div>
						<div class="in">
							<textarea id="content" class="input_st fit" name="content" placeholder="맛, 서비스, 분위기는 어떠셨나요?"></textarea>
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">사진첨부</span></div>
						<div class="in flex col">
							<!-- 사진 최대 5개 까지 -->
							<c:forEach var="i" begin="1" end="5">
							<input type="file" class="input_st fit" name="">
							</c:forEach>
						</div>
					</li>
					<li class="btn_wrap">						
						<button type="button" class="input_st c1 re" onclick="parent.layerClose();">취소</button>
			            <button type="submit" class="input_st c1">리뷰 등록</button>
					</li>
				</ul>
			</div>
			</form>
		</div>
	</div>
</div>
<!--본문 end-->
<jsp:include page="/layout/bottom.jsp" />
