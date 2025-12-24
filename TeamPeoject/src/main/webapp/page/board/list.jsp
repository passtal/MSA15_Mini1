<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "shop");
request.setAttribute("dp2", "list");
%>
<jsp:include page="/layout/header.jsp" />
    <div class="container">
        <h2>지역 맛집 리뷰 게시판</h2>

        <div class="review-write">
            <a href="${pageContext.request.contextPath}/board/write">새 리뷰 쓰기</a>
        </div>

        <hr>

        <c:if test="${empty boardList}">
            <p class="empty-msg">등록된 리뷰가 없습니다. 첫 리뷰를 남겨보세요!</p>
        </c:if>

        <div class="review-list">
            <c:forEach var="board" items="${boardList}">
                <div class="review-card">
                    <h3 class="review-title">
                    	<a href="${pageContext.request.contextPath}/board/edit?no=${board.no}">
        					${board.title}
    					</a>
                    </h3>
                    <c:if test="${not empty sessionScope.loginUser and sessionScope.loginUser.no == board.user_no}">
    					<a href="${pageContext.request.contextPath}/board/edit?no=${board.no}">[수정]</a>
					</c:if>
                    <div class="review-info">
                        <span class="rating">평점: ${board.rating} / 5.0</span>
                        <span class="author">작성자 번호: ${board.user_no}</span>
                    </div>
                    <div class="review-content">
                        ${board.content}
                    </div>
                    <div class="form-actions">
                		<button type="button" class="btn-back" onclick="history.back()">뒤로가기</button>
                	</div>
                </div>
            </c:forEach>
        </div>
    </div>
<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />