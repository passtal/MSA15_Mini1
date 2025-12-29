<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<jsp:include page="/layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>맛집 리뷰 목록</title>
</head>
<body>
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
    </div>
</body>
<footer>
    <div class="form-actions">
        <button type="button" class="btn-home" onclick="location.href='${pageContext.request.contextPath}/'">홈으로 이동</button>
    </div>
</footer>
</html>

<jsp:include page="/layout/footer.jsp" />