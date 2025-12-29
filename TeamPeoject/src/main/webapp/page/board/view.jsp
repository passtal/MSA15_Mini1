<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<jsp:include page="/layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.title} - 상세보기</title>
</head>
<body>
    <div class="view-container">

        <div class="post-header">
            <h2 class="post-title">${board.title}</h2>
            <div class="post-meta">
                <span class="meta-item">작성자: ${board.username}</span>
                <span class="meta-item">평점: ${board.rating} / 5.0</span>
                <span class="meta-item">작성일: <fmt:formatDate value="${board.created_at}" pattern="yyyy-MM-dd HH:mm"/></span>
            </div>
        </div>

        <hr>

        <div class="post-content">
            <pre style="white-space: pre-wrap; font-family: inherit;">${board.content}</pre>
        </div>

        <hr>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/board/list" class="btn-list">목록으로</a>

            <c:if test="${not empty sessionScope.loginUser and sessionScope.loginUser.no == board.user_no}">
                
                <a href="${pageContext.request.contextPath}/board/edit?no=${board.no}" class="btn-edit">수정</a>

                <form action="${pageContext.request.contextPath}/board/delete" method="post" class="form-delete" style="display:inline-block;">
                    <input type="hidden" name="no" value="${board.no}">
                    <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn-delete">삭제</button>
                </form>
                
            </c:if>
        </div>

        <div class="comment-section">
            <h3 class="comment-header">댓글</h3>
            <ul class="comment-list">
                <c:forEach var="comment" items="${commentList}">
                    <li class="comment-item">
                        <strong class="comment-author">${comment.username}</strong>
                        <span class="comment-text">${comment.content}</span>
                    </li>
                </c:forEach>
            </ul>
            
            <c:if test="${not empty sessionScope.loginUser}">
                <form action="${pageContext.request.contextPath}/board/comment" method="post" class="comment-form">
                    <input type="hidden" name="board_no" value="${board.no}">
                    <div class="form-group">
                        <textarea name="content" rows="3" required placeholder="댓글을 입력하세요" class="form-control"></textarea>
                    </div>
                    <button type="submit" class="btn-comment-submit">댓글 등록</button>
                </form>
            </c:if>
        </div>
    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp" />