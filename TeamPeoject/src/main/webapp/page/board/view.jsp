<%@ include file="/layout/jstl.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.title}</title>
</head>
<body>
    <div class="view-container">

        <div class="post-header">
            <h2 class="post-title">${board.title}</h2>
            <div class="post-meta">
                <span class="meta-item">작성자 번호: ${board.user_no}</span>
                <span class="meta-item">평점: ${board.rating} / 5.0</span>
            </div>
        </div>

        <hr>

        <div class="post-content">
            ${board.content}
        </div>

        <hr>

        <div class="action-buttons">
            <a href="board" class="btn-list">목록으로</a>

            <a href="board?action=edit&no=${board.no}" class="btn-edit">수정</a>

            <form action="board" method="post" class="form-delete">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="no" value="${board.no}">
                <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn-delete">삭제</button>
            </form>
            </div>

        <div class="comment-section">
            <h3 class="comment-header">댓글 (${commentList.size()})</h3>

            <ul class="comment-list">
                <c:forEach var="comment" items="${commentList}">
                    <li class="comment-item">
                        <strong class="comment-author">User ${comment.user_no}:</strong>
                        <span class="comment-text">${comment.content}</span>
                    </li>
                </c:forEach>
            </ul>

            <form action="board" method="post" class="comment-form">
                <input type="hidden" name="action" value="commentInsert">
                <input type="hidden" name="board_no" value="${board.no}">

                <div class="form-group">
                    <textarea name="content" rows="3" required placeholder="댓글을 입력하세요" class="form-control"></textarea>
                </div>
                <button type="submit" class="btn-comment-submit">댓글 등록</button>
            </form>
        </div>
    </div>
</body>
</html>