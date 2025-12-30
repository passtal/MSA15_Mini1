<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <a href="${pageContext.request.contextPath}/board/view?no=${board.no}">
                    ${board.title}
                </a>
            </h3>
            
            <c:if test="${not empty sessionScope.loginUser and sessionScope.loginUser.no == board.user_no}">
                <a href="${pageContext.request.contextPath}/board/edit?no=${board.no}">[수정]</a>
            </c:if>

            <div class="review-info">
                <span class="rating">평점: ${board.rating} / 5.0</span>
                
                <span class="author">작성자: ${board.username}</span>
            </div>
            
            <div class="review-content">
                ${board.content}
            </div>
        </div>
    </c:forEach>
</div>
