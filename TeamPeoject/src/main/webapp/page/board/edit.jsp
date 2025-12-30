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
	<div class="popTit"><span class="tit"><i class="t1">맛집 리뷰 수정</i></span><a href="javascript:parent.layerClose();" class="popClose"><i class="mti material-symbols-outlined">close</i></a></div>
	<div class="popIn scrollst">
		<div class="popCon">
			<form action="${pageContext.request.contextPath}/board/edit" method="post" class="edit-form">
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="user_no" value="${board.user_no}">
			<input type="hidden" name="no" value="${board.no}">
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
							<input type="number" class="input_st fit" id="rating" name="rating" step="1.0" min="1.0" max="5.0" value="${board.rating}">							
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">리뷰내용</span></div>
						<div class="in">
							<textarea id="content" class="input_st fit" name="content" required>${board.content}</textarea>							
						</div>
					</li>
					<li>
						<div class="mem_tit"><span class="tt">사진첨부</span></div>
						<div class="in flex col">
							<!-- 사진 최대 5개 까지 -->
							<c:forEach var="i" begin="1" end="5">
							<input type="file" class="input_st fit" name="">
							<!-- 올린 파일 있을 때만 노출 -->
							<div class="label_wrap gap1 fs15">							
								<label class="label_st"><input type="checkbox" name="" value="" /><span class="tt">삭제</span></label>
								<span>: 파일명.jpg</span>			
							</div>
							<!-- 올린 파일 있을 때만 노출 end -->
							</c:forEach>
						</div>
					</li>
					<li class="btn_wrap">						
						<button type="button" class="input_st c1 re" onclick="parent.layerClose();">취소</button>
			            <button type="submit" class="input_st c1">수정 완료</button>
					</li>
				</ul>
			</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/layout/bottom.jsp" />
