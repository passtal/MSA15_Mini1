<%@ include file="/layout/jstl.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>맛집 리뷰 목록</title>
</head>
<body>
    <div class="container">
        <h2>지역 맛집 리뷰 게시판</h2>

        <div class="header-actions">
            <a href="board?action=write" class="btn-write">리뷰 작성하기</a>
        </div>

        <hr>

        <c:if test="${empty boardList}">
            <p class="empty-msg">등록된 리뷰가 없습니다. 첫 리뷰를 남겨보세요!</p>
        </c:if>


        <!-- 이것도 login/join 나오면 싹 수정해서 올리겠습니다!!(by최영우) -->
        <%-- <c:if test="${sessionScope.loginUser.no == board.user_no}">
    		<a href="board?action=edit&no=${board.no}">수정</a>
    		<a href="board?action=delete&no=${board.no}">삭제</a>
		</c:if> --%>

        <%-- 리뷰 카드 목록 --%>
        <div class="review-list">
            <c:forEach var="board" items="${boardList}">
                <div class="review-card">
                    <h3 class="review-title">
                    	<a href="board?action=view&no=${board.no}">
                    		${board.title}
                    	</a>
                    </h3>
                    <div class="review-info">
                        <span class="rating">평점: ${board.rating} / 5.0</span>
                        <span class="author">작성자 번호: ${board.user_no}</span>
                    </div>
                    <div class="review-content">
                        ${board.content}
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>